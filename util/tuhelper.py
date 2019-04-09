#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import pymysql
import tushare as ts

tuMarkets = ('MSCI', 'CSI', 'SSE', 'SZSE', 'CICC', 'SW', 'OTH')
tuApi = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')
tuMaxLen = 5000

tuSdate = '20040101'


def genInsSql(cols, tab, isql=''):
    if not isql and len(cols) > 0:
        isql = "insert into " + tab + "("
        isqlv = ""
        for col in cols:
            isql = isql + col + ","
            isqlv = isqlv + "%s" + ","
        isql = isql[:len(isql) - 1]
        isqlv = isqlv[:len(isqlv) - 1]
        isql = isql + ") values(" + isqlv + ")"
    return isql


def getMysqlConn():
    conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
    return conn


def cutTuData(df, cutIdx):
    while len(df) > 0 and len(df) >= tuMaxLen:
        m = df[cutIdx].min()
        df = df.drop(df[df[cutIdx] == m].index)
    return df


def listToDict(datas, keyn, valn):
    dict = {}
    for data in datas:
        dict[data[keyn]] = data[valn]
    return dict


def test():
    cols = ('Michael', 'Bob', 'Tracy')
    print(genInsSql(cols, 'idx_w'))


if __name__ == '__main__':
    test()
