#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import util.tuhelper as thu

api = thu.tuApi

# df = api.index_dailybasic(trade_date='20181018')
# c1=df.groupby('trade_date')['ts_code'].count()
# print(c1)
#
# c2=df.groupby(['ts_code','trade_date'])['ts_code'].count()
# print(c2)

# df2 = df[df['trade_date'] == '20180928']
# print(df2)
#
# dmin = df['trade_date'].min()
# print(dmin)
#
# df3 = df.drop(df[df['trade_date'] == '20180928'].index)
# print(len(df3))
#
# sdate = datetime.date(2004, 1, 1)
# edate = calMonthE(datetime.date.today(), 1)
#
# # print(sdate, edate)
#
# df4 = fetchTuData(api, sdate, edate, '000001.SH')
# print('df4len======>', len(df4))
# c = df4.groupby(['trade_date'])['index_code'].count()
# # print(c)
#
# df5 = df.append(df4)
# print('df5len======>', len(df5))
# c5 = df5.groupby(['trade_date'])['index_code'].count()
# # print(c)
#
# for idx in c5.index:
#     print('===>C5:', idx, ' ', c5[idx])
#
# print('=========================>CUT')
#
# df6 = cutTuData(df5, 5000, 'trade_date')
#
# print('===>lendf6:', len(df6))
# c6 = df6.groupby(['trade_date'])['index_code'].count()
# # print(c)
#
# for idx in c6.index:
#     print('===>C6:', idx, ' ', c6[idx])


#############################
#####CUTDATA S1
# df = api.index_weight(index_code='h30137.CSI', start_date='20161130', end_date='20171130')
# # for dfidx in df.index:
# #     print('===>dfidx:',dfidx)
# print('dflen======>', len(df))
# c1 = df.groupby(['trade_date'])['index_code'].count()
# # print(c)
#
# for idx in c1.index:
#     print('===>C1:', idx, ' ', c1[idx])
#
# g1 = df.groupby(['trade_date'])
# print('len(g1)======>', len(g1))
#
# df2 = thu.cutTuData(df, 'trade_date', 250)
# c2 = df2.groupby(['trade_date'])['index_code'].count()
# print('cutLen====>', len(df2))
#
# for idx in c2.index:
#     print('===>C2:', idx, ' ', c2[idx])
#####CUTDATA E1

#####CUTDATA S2 idx_daily 000001.SH
# df = api.index_daily(ts_code='000001.SH')
# print('oridflen=====>', len(df))
# c = df.groupby(['trade_date'])['ts_code'].count()
# for idx in c.index:
#     print('===>C:', idx, ' ', c[idx])

#####CUTDATA E2

#####CUTDATA S3
# df = api.index_daily(ts_code='000001.SH', start_date='19901219', end_date='20190411')
# g = df.groupby(['trade_date'])
# # for i,k in g:
# #     print(i,'  ',k)
# print(g.size().values)
# print(g.size().index)
#####CUTDATA E3

#####CUTDATA S4
df = api.index_daily(ts_code='000001.SH', start_date='19901219', end_date='20190411')
print(len(df))
df2 = thu.cutTuData(df, 'trade_date')
print(len(df2))
#####CUTDATA E4

#####CUTDATA S5
# df = api.index_weight(index_code='000001.SH')
# gc = df.groupby(['trade_date']).size()
#
# for idx in gc.index:
#     print('===>C1:', idx, ' ', gc[idx])
#
# print(type(gc))
# print(gc)
# print(gc.index)
# print(gc['20190228'])
#
# # Series sort
# gcs1 = gc.sort_index()
# print('Series sort1===>', gcs1.index)
# gcs2 = gc.sort_index(ascending=False)
# print('Series sort2===>', gcs2.index)
#
# gc2 = df.groupby(['trade_date'])['index_code'].size()
# print(gc2.index)
# print(gc2['20190228'])
#
# gc3 = df.groupby(['trade_date'])['trade_date'].size()
# print(gc3.index)
# print(gc3['20190228'])
#
# gm = df.groupby(['trade_date']).mean()
# print(type(gm))
# print(gm)
# print(gm.index)

#####CUTDATA E5

#####GROUPBY test S
# dict1 = {"Province": ["Guangdong", "Beijing", "Qinghai", "Fujiang", "Guangdong", "Qinghai"],
#          "year": [2018, 2018, 2018, 2018, 2017, 2017],
#          "pop": [1.3, 2.5, 1.1, 0.7, 2.2, 3.3]}
# df1 = pd.DataFrame(dict1)
# g1 = df1.groupby(['Province'])
# print(g1.size().index)
# print(g1.size().index.values)
#
# g12 = df1.groupby(['year'])
# print(g12.size().index)
# print(g12.size().index.values)
#####GROUPBY test E

#####CHECKAPI daily
# df = api.index_daily(ts_code='000001.SH')
# print('oridflen=====>', len(df))
# c = df.groupby(['trade_date'])['ts_code'].count()
# for idx in c.index:
#     print('===>C:', idx, ' ', c[idx])
#
# print('sd1990=====')
# df = api.index_daily(ts_code='000001.SH', start_date='19901219', end_date='20190411')
# print('ed1990=====')
#####CHECKAPI daily

#####CHECKLEN S 检查daily长度
# cll = ('000001.SH', '000016.SH', '000300.SH', '000905.SH', '399001.SZ', '399005.SZ', '399006.SZ', '399975.SZ')
# for c in cll:
#     df = api.index_daily(ts_code=c)
#     print(c, '=======>', len(df))
#####CHECKLEN E
