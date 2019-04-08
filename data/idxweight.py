#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import datetime
import time
import calendar

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

__sdate = '20190108'
__force = True

conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor()

cursor.execute("select max(t.trade_date) from idx_weight t;")
data = cursor.fetchone()
conn.close()

conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor(pymysql.cursors.DictCursor)
cursor.execute("select t.ts_code from idx_basic t where t.id<2 order by t.ts_code;")
idxcs = cursor.fetchall()
conn.close()

if data[0] and len(data[0]) == 8 and int(data[0]) > int(__sdate) and not __force:
    __sdate = data[0]

tsdate = datetime.date(int(__sdate[0:4]), int(__sdate[4:6]), 1)

tedate = datetime.date.today()
tedate = datetime.date(tedate.year, tedate.month, 1) - datetime.timedelta(days=1)
tedate = datetime.date(tedate.year, tedate.month, 1)

api = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')
conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
cursor = conn.cursor()
isql = ''
while tedate >= tsdate:
    fdate = tedate
    days_num = calendar.monthrange(tedate.year, tedate.month)[1]
    fedate = fdate+datetime.timedelta(days=(days_num-1))
    idxi=0
    while idxi<len(idxcs):
        idxc=idxcs[idxi]
        try:
            df = api.index_weight(index_code=idxc['ts_code'],start_date=fdate.strftime('%Y%m%d'), end_date=fedate.strftime('%Y%m%d'))
            print(fdate, ' ', fedate, ' ', idxc['ts_code'], ' ', len(df.values))
            print(df)
            idxi+=1
        except BaseException as e:
            print(e)
            time.sleep(60)
            continue
        finally:
            time.sleep(0.6)
    tedate = tedate-datetime.timedelta(days=1)
    tedate = datetime.date(tedate.year, tedate.month, 1)
    #     if(len(df.values)>maxc):
    #         maxc = len(df.values)
    #         maxd = fdate
    #     fdate = fdate+datetime.timedelta(days=1)
    # print(maxd,' ',maxc)
    # except BaseException as e:
    #     print(e)
    #     time.sleep(0.6)
    #     continue
    # tedate = tedate - datetime.timedelta(days=1)
    # cols = df.columns
    # if not isql:
    #     isql = "insert into idx_weight("
    #     isqlv = ""
    #     for col in cols:
    #         isql = isql + col + ","
    #         isqlv = isqlv + "%s" + ","
    #     isql = isql[:len(isql) - 1]
    #     isqlv = isqlv[:len(isqlv) - 1]
    #     isql = isql + " ) values(" + isqlv + " )"
    # if len(df.values) == 0:
    #     continue
    #
    # for index, row in df.iterrows():
    #     rowv = []
    #     for col in cols:
    #         rowv.append(row[col])
    #     try:
    #         cursor.execute(isql, rowv)
    #         conn.commit()
    #     except BaseException as e:
    #         print(row['index_code'], ':', e)
cursor.close()
conn.close()
