#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

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

# df = api.index_weight(index_code='h11044.CSI')
# print(len(df))

# df = api.daily(ts_code='000001.SZ', start_date='20180701', end_date='20180718')
# print(df)

# df = api.stock_basic()
# #print(df)
#
# cols = df.columns
# rowv = []
# for col in cols:
#     rowv.append(col)
# print(rowv)
# for index, row in df.iterrows():
#     rowv = []
#     for col in cols:
#         rowv.append(row[col])
#     print(rowv)


# df = api.stock_basic(list_status='D',fields='ts_code,symbol,name,area,industry,fullname,enname,market,exchange,list_status,delist_date,list_date,is_hs')
# print('len====>',len(df))
# print(df)
# c = df.groupby(['list_status']).size()
# for idx in c.index:
#     print('===>C:', idx, ' ', c[idx])
# cols = df.columns
# rowv = []
# for col in cols:
#     rowv.append(col)
# print(rowv)
#
df = api.daily(ts_code='600601.SH', start_date='19901219', end_date='19901219')
print(df)
print(df['trade_date'].min())
print(len(df))

rowvs = []
for index, row in df.iterrows():
    rowv = []
    for col in df.columns:
        rowv.append(row[col])
    rowvs.append(rowv)
print(rowvs)



#
# df2 = api.daily(ts_code='000001.SZ', start_date='19901219', end_date='20020303')
# print(df2['trade_date'].min())
# print(len(df2))

# df4 = api.monthly(ts_code='000012.SZ', start_date='19901219', end_date='19920227')
# print(len(df4))

# df3 = ts.pro_bar(api=api, adj='qfq', freq='M', ts_code='000012.SZ', start_date='19901219', end_date='20190415',factors=['tor', 'vr'])
# print(df3['trade_date'].min(),' ',df3['trade_date'].max())
# print(df3)
# for col in df3.columns:
#     print(col)

# orilist=('close','open','high','low','pre_close','change','pct_chg')
# chgdict={}
# for orin in orilist:
#     chgdict[orin]='ori_'+orin
# print(chgdict)
# df5 = api.monthly(ts_code='000012.SZ', start_date='19920228', end_date='20190329')
# df5.rename(columns=chgdict, inplace = True)
# # print(df5)
#
# uncutlist=('trade_date',)+orilist
# print(uncutlist)
#
# cutcols=[]
# for col in df3.columns:
#     if col not in uncutlist:
#         cutcols.append(col)
# print(cutcols)
#
# data = df5.set_index('trade_date', drop=False).merge(df3.set_index('trade_date'), left_index=True, right_index=True, how='left')
# # print(data)
#
# print(data.columns.values)

# print(len(df3))
# for col in df3.columns:
#     print(col)

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
