#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import time

import pandas as pd

import util.caldate as cd
import util.tuhelper as tuh
import util.tulog as tul

FORCE = False
FAV = 2
BATCH = True

TABLE = 'stk_daily_basic'

LOGGER = tul.TuLog('fetch_stk_daily_basic_x', '/log', True).getlog()


def fetchdataone():
    logger = LOGGER
    conn = tuh.getMysqlConn()

    stktcs = tuh.getstktcs(FAV)
    stkmtdm = tuh.getstkmtdm('stk_daily_basic')

    tuapi = tuh.tuApi
    isql = ''

    cursor = conn.cursor()
    for stktcm in stktcs:
        stktc = stktcm['ts_code']
        sdate = cd.ymd2date(tuh.getsdate(stkmtdm, stktc, FORCE))
        edate = cd.preday()
        while edate >= sdate:
            df = fetchtudata(tuapi, stktc, sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'))
            logger.debug('====SSSS====> %s ===>sd:%s ed:%s len(df):%s' % (stktc, sdate, edate, len(df)))
            if df is not None and len(df) > 0:
                cols = df.columns
                isql = tuh.geninssql(cols, TABLE, isql)
                rowvs = []
                for index, row in df.iterrows():
                    rowv = []
                    for col in cols:
                        rowv.append(row[col])
                    rowvs.append(rowv)
                emsgs = tuh.saveorupdate({'sql': isql, 'vals': rowvs}, BATCH)
                for m in emsgs:
                    logger.error(m)
                logger.debug('====SAVEEND====> %s ===>sd:%s ed:%s ldf:%d mtd:%s emc:%d' % (
                    stktc, sdate, edate, len(df), df['trade_date'].min(), len(emsgs)))
            if df is None or pd.isnull(df['trade_date'].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df['trade_date'].min()))
    cursor.close()
    conn.close()


def fetchtudata(api, stktc, sdate, edate):
    excnt = 0
    fdf = None
    while excnt < tuh.tumaxexcnt:
        try:
            fdf = api.daily_basic(ts_code=stktc, start_date=sdate, end_date=edate)
            break
        except BaseException as e:
            excnt += 1
            if excnt == tuh.tumaxexcnt:
                raise e
            else:
                time.sleep(60)
            continue
    fdf = tuh.cleandf(fdf)
    return fdf


def fetchdata():
    fetchdataone()


def main():
    fetchdata()


if __name__ == '__main__':
    main()
