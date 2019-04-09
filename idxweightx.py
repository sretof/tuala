#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import datetime

import pymysql

import util.caldate as caldate
import util.tuhelper as tuh

__force = True
__fav = 1
__batch = True

conn = tuh.getMysqlConn()
cursor = conn.cursor(pymysql.cursors.DictCursor)
if __fav==0 or __fav==1:
    cursor.execute("select t.ts_code from idx_basic t where t.fav=" + str(__fav) + " order by t.ts_code;")
else:
    cursor.execute("select t.ts_code from idx_basic t order by t.ts_code;")
idxcs = cursor.fetchall()
cursor.close()

cursor = conn.cursor()
cursor.execute("select t.index_code,max(t.trade_date) from idx_weight t group by t.index_code;")
imdates = cursor.fetchall()
cursor.close()

tuApi = tuh.tuApi
isql = ''

cursor = conn.cursor()
for idxd in idxcs:
    idxcode = idxd['ts_code']

    data = cursor.fetchone()
    sdate = tuh.tuSdate
    if data[0] and len(data[0]) == 8 and int(data[0]) > int(sdate) and not __force:
        sdate = data[0]
    tsdate = datetime.date(int(sdate[0:4]), int(sdate[4:6]), 1)
    tedate = caldate.calMonthE(datetime.date.today(), 1)
    calPs = (12,6,3,1)
    print(idxcode, ' ', tsdate, ' ', tedate)

cursor.close()
conn.close()
