#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import time

import pymysql

import util.tuhelper as tuh
import util.tulog as tul

__batch = True
__stss = ('L', 'P', 'D')
__checkfield = ['delist_date', 'list_status', 'name']


def fetchdataone(liststs='L'):
    logger = tul.TuLog('fetch_stk_basic_' + liststs + 'x', '/log', True).getlog()
    conn = tuh.getMysqlConn()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(
        "select t.ts_code,t.delist_date,t.list_status,t.`name` from stk_basic t order by t.ts_code;")
    stkbd = cursor.fetchall()
    stkbm = tuh.listToDict(stkbd, 'ts_code', '_all_')
    cursor.close()

    tuapi = tuh.tuApi
    isql = ''
    usql = ''

    cursor = conn.cursor()
    df = fetchtudata(tuapi, liststs=liststs)
    if len(df) > 0:
        cols = df.columns
        isql = tuh.genInsSql(cols, 'stk_basic', isql)
    rowvs = []
    urowvs = []
    for index, row in df.iterrows():
        rowv = []
        if row['ts_code'] in stkbm:
            if checkdatachg(row, stkbm[row['ts_code']]):
                usql = tuh.genupdsql(cols, 'stk_basic', ('ts_code',), usql)
                for col in cols:
                    rowv.append(row[col])
                rowv.append(row['ts_code'])
                if len(rowv) > 0:
                    urowvs.append(rowv)
            continue
        for col in cols:
            rowv.append(row[col])
        if len(rowv) > 0:
            rowvs.append(rowv)
    logger.info('LS: %s rowvs == == > %d  urowvs == == > %d' % (liststs, len(rowvs), len(urowvs)))
    emsgs = tuh.saveorupdate({'sql': isql, 'vals': rowvs})
    for m in emsgs:
        logger.error(m)
    emsgs = tuh.saveorupdate({'sql': usql, 'vals': urowvs})
    for m in emsgs:
        logger.error(m)
    cursor.close()
    conn.close()


def fetchtudata(api, liststs='L'):
    excnt = 0
    fdf = None
    while excnt < tuh.tumaxexcnt:
        try:
            fdf = api.stock_basic(list_status=liststs,
                                  fields='ts_code,symbol,name,area,industry,fullname,enname,market,exchange,list_status,delist_date,list_date,is_hs')
            break
        except BaseException as e:
            excnt += 1
            if excnt == tuh.tumaxexcnt:
                raise e
            else:
                time.sleep(60)
            continue
    return fdf


def checkdatachg(rowv, dbv):
    for field in __checkfield:
        if rowv[field] != dbv[field]:
            return True
    return False


def fetchdata():
    for sts in __stss:
        fetchdataone(liststs=sts)


def main():
    fetchdata()


# def test():
#     # idxsdd = {'1': '20180101'}
#     # print('1===>', getIdxSdate(idxsdd, '1'))
#     # print('2===>', getIdxSdate(idxsdd, '2'))
#     # print('3===>', getIdxSdate(idxsdd, '1', True))
#     # df = fetchTuData(tuh.tuApi, 'w', '20190401', '20190410', '000001.SH')
#     # print('datalen==>', len(df))
#     # bb = True
#     # if (not bb):
#     #     print('bb========', 'False')
#     # else:
#     #     print('bb========', 'True')
#     # tt = 2
#     # if (not tt):
#     #     print('tt========', 'False')
#     # else:
#     #     print('tt========', 'True')
#     #
#     # str1 = 'is_ds'
#     # print(str1[3:])
#     # fetchtudata(tuh.tuApi)


if __name__ == '__main__':
    main()
