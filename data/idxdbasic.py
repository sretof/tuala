#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import datetime
import time

import pymysql
import tushare as ts

# # 打开数据库连接
# db = pymysql.connect("localhost", "root", "879211Qa!", "stock")
#
# # 使用 cursor() 方法创建一个游标对象 cursor
# cursor = db.cursor()
#
# # 使用 execute()  方法执行 SQL 查询
# cursor.execute("SELECT VERSION()")
#
# # 使用 fetchone() 方法获取单条数据.
# data = cursor.fetchone()
#
# print("Database version : %s " % data)
#
# # 关闭数据库连接
# db.close()

__sdate = '20040101'
__force = False
__maxt = 100

conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor()

cursor.execute("select max(t.trade_date) from idx_daily_basic t;")
data = cursor.fetchone()
conn.close()

if data[0] and len(data[0]) == 8 and int(data[0]) > int(__sdate) and not __force:
    __sdate = data[0]

tsdate = datetime.date(int(__sdate[0:4]), int(__sdate[4:6]), int(__sdate[6:8]))
tedate = datetime.date.today()

api = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')
conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor()
isql = ''
while tsdate < tedate:
    try:
        df = api.index_dailybasic(trade_date=tsdate.strftime('%Y%m%d'))
    except BaseException as e:
        print(e)
        continue
    finally:
        time.sleep(0.6)
    print(tsdate, ' ', len(df.values))
    tsdate = tsdate + datetime.timedelta(days=1)
    cols = df.columns
    if not isql:
        isql = "insert into idx_daily_basic("
        isqlv = ""
        for col in cols:
            isql = isql + col + ","
            isqlv = isqlv + "%s" + ","
        isql = isql[:len(isql) - 1]
        isqlv = isqlv[:len(isqlv) - 1]
        isql = isql + " ) values(" + isqlv + " )"
        print(isql)
    if len(df.values) == 0:
        continue
    for index, row in df.iterrows():
        rowv = []
        for col in cols:
            rowv.append(row[col])
        try:
            cursor.execute(isql, rowv)
            conn.commit()
        except BaseException as e:
            print(tsdate, row['ts_code'])
            print(e)
cursor.close()
conn.close()
