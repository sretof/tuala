#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

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

__markets = ('MSCI', 'CSI', 'SSE', 'SZSE', 'CICC', 'SW', 'OTH')
__force = False

conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor()

api = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')
conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor()
isql = ''
i = 0
mlen = len(__markets)
while i < mlen:
    m = __markets[i]
    try:
        df = api.index_basic(market=m)
    except BaseException as e:
        print(e)
        time.sleep(1)
        continue
    cols = df.columns
    if not isql and len(cols) > 0:
        isql = "insert into idx_basic("
        isqlv = ""
        for col in cols:
            isql = isql + col + ","
            isqlv = isqlv + "%s" + ","
        isql = isql[:len(isql) - 1]
        isqlv = isqlv[:len(isqlv) - 1]
        isql = isql + " ) values(" + isqlv + " )"
        print(isql)
    i = i + 1
    if len(df.values) == 0:
        continue
    print(len(df.values))
    for index, row in df.iterrows():
        rowv = []
        for col in cols:
            rowv.append(row[col])
        try:
            cursor.execute(isql, rowv)
            conn.commit()
        except BaseException as e:
            print(row['ts_code'], ':', e)
cursor.close()
conn.close()
