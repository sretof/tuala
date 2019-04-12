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
__mwd = ('monthly', 'weekly', 'daily')


def fetchData(ind):
    logger = tul.TuLog('fetch_idx_' + ind + '_x', '/log').getlog()
    conn = tuh.getMysqlConn()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    if __fav == 0 or __fav == 1:
        cursor.execute(
            "select t.ts_code from idx_basic t where t.del<>1 and t.fav=" + str(__fav) + " order by t.ts_code;")
    else:
        cursor.execute("select t.ts_code from idx_basic t where t.del<>1 order by t.ts_code;")
    idxcs = cursor.fetchall()
    cursor.close()

    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select t.ts_code as idc,max(t.trade_date) as itd from idx_" + ind + " t group by t.ts_code;")
    idxsdd = tuh.listToDict(cursor.fetchall(), 'idc', 'itd')
    cursor.close()
    tuapi = tuh.tuApi
    isql = ''

    cursor = conn.cursor()
    for idxd in idxcs:
        idxc = idxd['ts_code']
        sdate = cd.ymd2date(getIdxSdate(idxsdd, idxc, __force))
        edate = cd.preday()
        while edate >= sdate:
            try:
                df = fetchTuData(tuapi, ind, sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'), idxc)
                if len(df) > 0:
                    cols = df.columns
                    isql = tuh.genInsSql(cols, 'idx_' + ind, isql)
                    rowvs = []
                    for index, row in df.iterrows():
                        rowv = []
                        for col in cols:
                            rowv.append(row[col])
                        rowvs.append(rowv)
                    emsgs = tuh.insertDatas({'sql': isql, 'vals': rowvs})
                    for m in emsgs:
                        logger.error(m)
                    print(idxc, '===>sd:', sdate, ' ed:', edate, ' ldf:', len(df), ' mtd:', df['trade_date'].min(),
                          ' emc:', len(emsgs))
                else:
                    print(idxc, '===>sd:', sdate, ' ed:', edate, ' ldf:', len(df))
            except BaseException as e:
                print(e)
                time.sleep(60)
                continue
            if pd.isnull(df['trade_date'].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df['trade_date'].min()))
    cursor.close()
    conn.close()


def getIdxSdate(idxsdd, idxc, force=False):
    sdate = idxsdd.get(idxc, tuh.tuSdate)
    if sdate > tuh.tuSdate:
        dsdate = cd.ymd2date(sdate)
        dsdate = cd.preday(dsdate, -1)
        sdate = dsdate.strftime('%Y%m%d')
    if force or sdate < tuh.tuSdate:
        sdate = tuh.tuSdate
    return sdate


def fetchTuData(api, ind, sdate, edate, idxc):
    if ind == 'm' or ind == 'monly':
        fdf = api.index_monthly(ts_code=idxc, start_date=sdate, end_date=edate)
    elif ind == 'w' or ind == 'weekly':
        fdf = api.index_weekly(ts_code=idxc, start_date=sdate, end_date=edate)
    else:
        fdf = api.index_daily(ts_code=idxc, start_date=sdate, end_date=edate)
    fdf = tuh.cutTuData(fdf, 'trade_date')
    fdf = fdf.fillna(0)
    return fdf


def main():
    for ind in __mwd:
        fetchData(ind)


# def test():
#     # idxsdd = {'1': '20180101'}
#     # print('1===>', getIdxSdate(idxsdd, '1'))
#     # print('2===>', getIdxSdate(idxsdd, '2'))
#     # print('3===>', getIdxSdate(idxsdd, '1', True))
#     df = fetchTuData(tuh.tuApi, 'w', '20190401', '20190410', '000001.SH')
#     print('datalen==>', len(df))


if __name__ == '__main__':
    main()
