#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import time

import pandas as pd
import pymysql

import util.caldate as cd
import util.tuhelper as tuh
import util.tulog as tul

__force = False
__fav = 2
__batch = True

__logger = tul.TuLog('fetch_stk_adj_factor_x', '/log', True).getlog()


def fetchdataone():
    logger = __logger
    conn = tuh.getMysqlConn()
    cursor = conn.cursor()
    if __force:
        cursor.execute("delete from stk_adj_factor")
    cursor.close()

    cursor = conn.cursor(pymysql.cursors.DictCursor)
    if __fav == 0 or __fav == 1:
        cursor.execute(
            "select t.ts_code from stk_basic t where t.del<>1 and t.fav=" + str(__fav) + " order by t.ts_code;")
    else:
        cursor.execute("select t.ts_code from stk_basic t where t.del<>1 order by t.ts_code;")
    stkbs = cursor.fetchall()
    cursor.close()

    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select t.ts_code as stkc,max(t.trade_date) as md from stk_adj_factor t group by t.ts_code;")
    stkmtdd = tuh.listToDict(cursor.fetchall(), 'stkc', 'md')
    cursor.close()

    tuapi = tuh.tuApi
    isql = ''

    cursor = conn.cursor()
    for stk in stkbs:
        stkc = stk['ts_code']
        sdate = cd.ymd2date(tuh.getsdate(stkmtdd, stkc))
        edate = cd.preday()
        while edate >= sdate:
            logger.debug('%s ===>sd:%s ed:%s ====SSSS====>' % (stkc, sdate, edate))
            df = fetchtudata(tuapi, sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'), stkc)
            if df is not None and len(df) > 0:
                cols = df.columns
                isql = tuh.geninssql(cols, 'stk_adj_factor', isql)
                rowvs = []
                for index, row in df.iterrows():
                    rowv = []
                    for col in cols:
                        rowv.append(row[col])
                    rowvs.append(rowv)
                emsgs = tuh.saveorupdate({'sql': isql, 'vals': rowvs})
                for m in emsgs:
                    logger.error(m)
                logger.debug('%s ===>sd:%s ed:%s ldf:%d mtd:%s emc:%d  ====SAVEEND====>' % (
                    stkc, sdate, edate, len(df), df['trade_date'].min(), len(emsgs)))
            if df is None or pd.isnull(df['trade_date'].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df['trade_date'].min()))
    cursor.close()
    conn.close()


def fetchtudata(api, sdate, edate, stkc):
    excnt = 0
    fdf = None
    while excnt < tuh.tumaxexcnt:
        try:
            fdf = api.adj_factor(ts_code=stkc, start_date=sdate, end_date=edate)
            break
        except BaseException as e:
            excnt += 1
            if excnt == tuh.tumaxexcnt:
                raise e
            else:
                time.sleep(60)
            continue
    return fdf


def fetchdata():
    fetchdataone()


def main():
    fetchdata()


if __name__ == '__main__':
    main()
