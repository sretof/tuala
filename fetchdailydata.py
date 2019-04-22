#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import time

import pandas as pd

import util.caldate as cd
import util.tuhelper as tuh
import util.tulog as tul

TABLES = ('stk_daily_basic',)

FORCE = False
FAV = 2
BATCH = True

FORCEMAP = {}
FAVMAP = {}
BATCHMAP = {}
TUMETHODMAP = {
    'stk_daily_basic': 'daily_basic'
}

TUAPI = tuh.tuApi


def fetchdata(table):
    logger = tul.TuLog('fetch_' + table + '_x', '/log', True).getlog()
    force = FORCEMAP.get(table, FORCE)
    fav = FAVMAP.get(table, FAV)
    batch = BATCHMAP.get(table, BATCH)
    conn = tuh.getMysqlConn()

    stktcs = tuh.getstktcs(fav)
    stkmtdm = tuh.getstkmtdm(table)

    tumethod = TUMETHODMAP[table]
    logger.debug('====S====> table:%s tumethod:%s ===>force:%s fav:%s batch:%s' % (table, tumethod, force, fav, batch))

    cursor = conn.cursor()
    isql = ''
    for stktcm in stktcs:
        stktc = stktcm['ts_code']
        sdate = cd.ymd2date(tuh.getsdate(stkmtdm, stktc, force))
        edate = cd.preday()
        logger.debug('====SS====> %s ==== init ===>sd:%s ed:%s' % (stktc, sdate, edate))
        fetchstk(cursor, logger, table, tumethod, isql, stktc, sdate, edate, batch)
    cursor.close()
    conn.close()

    logger.debug('====E====> %s ============================' % (table,))


def fetchstk(cursor, logger, table, tumethod, isql, stktc, sdate, edate, batch):
    while edate >= sdate:
        df = fetchtudata(table, tumethod, stktc, sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'))
        logger.debug('====SSSS====> %s ===>sd:%s ed:%s len(df):%s' % (stktc, sdate, edate, len(df)))
        if len(df) > 0:
            cols = df.columns
            isql = tuh.geninssql(cols, table, isql)
            rowvs = []
            for index, row in df.iterrows():
                rowv = []
                for col in cols:
                    rowv.append(row[col])
                rowvs.append(rowv)
            emsgs = tuh.saveorupdate({'sql': isql, 'vals': rowvs}, batch, cursor)
            for m in emsgs:
                logger.error(m)
            logger.debug('====SAVEEND====> %s ===>sd:%s ed:%s ldf:%d mtd:%s emc:%d' % (
                stktc, sdate, edate, len(df), df['trade_date'].min(), len(emsgs)))
        if len(df) < 1 or pd.isnull(df['trade_date'].min()):
            edate = cd.preday(sdate)
        else:
            edate = cd.preday(cd.ymd2date(df['trade_date'].min()))


def fetchtudata(table, tumethod, stktc, sdate, edate):
    excnt = 0
    fdf = None
    while excnt < tuh.tumaxexcnt:
        try:
            fdf = TUAPI.query(api_name=tumethod, ts_code=stktc, start_date=sdate, end_date=edate)
            break
        except BaseException as e:
            excnt += 1
            if excnt == tuh.tumaxexcnt:
                raise e
            else:
                time.sleep(60)
            continue
    fdf = tuh.cleandf(fdf)
    # fdf = tuh.cutTuData(fdf, table)
    return fdf


def main():
    for table in TABLES:
        fetchdata(table)


if __name__ == '__main__':
    main()
