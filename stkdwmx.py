#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#前复权

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
__mwd = ('monthly', 'weekly', 'daily')


def fetchdataone(ind):
    logger = tul.TuLog('fetch_stk_' + ind + '_x', '/log', True).getlog()
    conn = tuh.getMysqlConn()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    if __fav == 0 or __fav == 1:
        cursor.execute(
            "select t.ts_code from stk_basic t where t.del<>1 and t.fav=" + str(__fav) + " order by t.ts_code;")
    else:
        cursor.execute("select t.ts_code from stk_basic t where t.del<>1 order by t.ts_code;")
    stkbs = cursor.fetchall()
    cursor.close()

    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select t.ts_code as stkc,max(t.trade_date) as md from stk_" + ind + " t group by t.ts_code;")
    stkmtdd = tuh.listToDict(cursor.fetchall(), 'stkc', 'md')
    cursor.close()
    tuapi = tuh.tuApi
    isql = ''

    cursor = conn.cursor()
    for stk in stkbs:
        stkc = stk['ts_code']
        sdate = cd.ymd2date(getsdate(stkmtdd, stkc, __force))
        edate = cd.preday()
        while edate >= sdate:
            df = fetchtudata(tuapi, ind, sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'), stkc)
            if len(df) > 0:
                cols = df.columns
                isql = tuh.geninssql(cols, 'stk_' + ind, isql)
                print(isql)
                rowvs = []
                for index, row in df.iterrows():
                    rowv = []
                    for col in cols:
                        rowv.append(row[col])
                    rowvs.append(rowv)
                emsgs = tuh.saveorupdate({'sql': isql, 'vals': rowvs})
                for m in emsgs:
                    logger.error(m)
                logger.debug('%s %s===>sd:%s ed:%s ldf:%d mtd:%s emc:%d' % (
                    stkc, ind, sdate, edate, len(df), df['trade_date'].min(), len(emsgs)))
            else:
                logger.debug('%s %s===>sd:%s ed:%s ldf:%d' % (stkc, ind, sdate, edate, len(df)))
            if pd.isnull(df['trade_date'].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df['trade_date'].min()))
    cursor.close()
    conn.close()


def getsdate(stkmtdd, stkc, force=False):
    sdate = stkmtdd.get(stkc, tuh.tuSdate)
    if sdate > tuh.tuSdate:
        dsdate = cd.ymd2date(sdate)
        dsdate = cd.preday(dsdate, -1)
        sdate = dsdate.strftime('%Y%m%d')
    if force or sdate < tuh.tuSdate:
        sdate = tuh.tuSdate
    return sdate


def fetchtudata(api, ind, sdate, edate, stkc):
    excnt = 0
    while excnt < tuh.tumaxexcnt:
        try:
            if ind == 'm' or ind == 'monthly':
                fdf = api.monthly(ts_code=stkc, start_date=sdate, end_date=edate)
            elif ind == 'w' or ind == 'weekly':
                fdf = api.weekly(ts_code=stkc, start_date=sdate, end_date=edate)
            else:
                fdf = api.daily(ts_code=stkc, start_date=sdate, end_date=edate)
            break
        except BaseException as e:
            excnt += 1
            if excnt == tuh.tumaxexcnt:
                raise e
            else:
                time.sleep(60)
            continue
    fdf = fdf.fillna(0)
    return fdf


def fetchdata():
    for ind in __mwd:
        fetchdataone(ind)


def main():
    fetchdata()


# def test():
#     # idxsdd = {'1': '20180101'}
#     # print('1===>', getIdxSdate(idxsdd, '1'))
#     # print('2===>', getIdxSdate(idxsdd, '2'))
#     # print('3===>', getIdxSdate(idxsdd, '1', True))
#     df = fetchTuData(tuh.tuApi, 'w', '20190401', '20190410', '000001.SH')
#     print('datalen==>', len(df))


if __name__ == '__main__':
    main()
