#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import datetime
import time

import pymysql
import tushare as ts

api = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')

# daily
# df = api.daily(ts_code='600028.SH', start_date='20190401', end_date='20190402')
# print(df)

# factor
# df = api.adj_factor(ts_code='600028.SH', trade_date='')
# print(df)


# df = api.index_basic(market='SW')
# print(df)
#
# df = api.index_basic(market='MSCI')
# print(df)
#
# df = api.index_basic(market='CSI')
# print(df)
#
# df = api.index_basic(market='SSE')
# print(df)
#
# df = api.index_basic(market='SZSE')
# print(df)
#
# df = api.index_basic(market='CICC')
# print(df)
#
# df = api.index_basic(market='OTH')
# print(df)

# df = api.index_dailybasic(trade_date='20181018')
# c1=df.groupby('trade_date')['ts_code'].count()
# print(c1)
#
# c2=df.groupby(['ts_code','trade_date'])['ts_code'].count()
# print(c2)

df = api.index_weight(index_code='000001.SH', start_date='20180901', end_date='20181230')
print(len(df))




# __fav = '1'
# conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
# cursor = conn.cursor()
#
# cursor.execute("select max(t.trade_date) from idx_weight t where t.index_code in (select t1.ts_code from idx_basic t1 where t1.fav="+__fav+");")
# data = cursor.fetchone()
# conn.close()
# print(data)
#
# conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
# cursor = conn.cursor(pymysql.cursors.DictCursor)
# cursor.execute("select t.ts_code from idx_basic t where t.fav="+__fav+" order by t.ts_code;")
# idxcs = cursor.fetchall()
# conn.close()
#
# sdate = datetime.date(2018, 6, 1)
# edate = datetime.date(2019, 3, 31)

# while edate>=sdate:
#     idxi=0
#     while idxi<len(idxcs):
#         idxc=idxcs[idxi]
#         try:
#             df = api.index_weight(index_code=idxc['ts_code'],trade_date=edate.strftime('%Y%m%d'))
#             print(edate, idxc['ts_code'], ' ', len(df.values))
#             # print(df)
#             idxi+=1
#         except BaseException as e:
#             print(e)
#             time.sleep(60)
#             continue
#         finally:
#             time.sleep(0.6)
#     edate = edate - datetime.timedelta(days=1)

# idxi=0
# while idxi<len(idxcs):
#     idxc=idxcs[idxi]
#     try:
#         df = api.index_weight(index_code=idxc['ts_code'],start_date=sdate.strftime('%Y%m%d'),end_date=edate.strftime('%Y%m%d'))
#         print(edate, idxc['ts_code'], ' ', len(df.values))
#         print(df)
#         idxi+=1
#     except BaseException as e:
#         print(e)
#         time.sleep(60)
#         continue
#     finally:
#         time.sleep(0.6)