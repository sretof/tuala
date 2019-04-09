#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import calendar
import datetime

import tushare as ts


def calMonthS(date, x=0):
    if x <= 0:
        return datetime.date(date.year, date.month, 1)
    while x >= 1:
        date = datetime.date(date.year, date.month, 1)
        date = date - datetime.timedelta(days=1)
        date = datetime.date(date.year, date.month, 1)
        x -= 1
    return date


def calMonthE(date, x=0):
    date = calMonthS(date, x)
    days_num = calendar.monthrange(date.year, date.month)[1]
    date = date + datetime.timedelta(days_num - 1)
    return date


tuMaxLen = 5000


def cutTuData(df, maxLen, cutIdx):
    while len(df) > 0 and len(df) >= maxLen:
        df = df[df[cutIdx] > df[cutIdx].min()]
    return df


def fetchTuData(api, sdate, edate, idxcode):
    fdf = api.index_weight(index_code=idxcode, start_date=sdate.strftime('%Y%m%d'), end_date=edate.strftime('%Y%m%d'))
    fdf = cutTuData(fdf, tuMaxLen, 'trade_date')
    return fdf


api = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')

# df = api.index_dailybasic(trade_date='20181018')
# c1=df.groupby('trade_date')['ts_code'].count()
# print(c1)
#
# c2=df.groupby(['ts_code','trade_date'])['ts_code'].count()
# print(c2)

df = api.index_weight(index_code='000001.SH', start_date='20170101', end_date='20171130')
# for dfidx in df.index:
#     print('===>dfidx:',dfidx)
print('dflen======>', len(df))
c1 = df.groupby(['trade_date'])['index_code'].count()
# print(c)

for idx in c1.index:
    print('===>C1:', idx, ' ', c1[idx])

# df2 = df[df['trade_date'] == '20180928']
# print(df2)
#
# dmin = df['trade_date'].min()
# print(dmin)
#
# df3 = df.drop(df[df['trade_date'] == '20180928'].index)
# print(len(df3))

sdate = datetime.date(2018, 1, 1)
edate = calMonthE(datetime.date.today(), 1)

# print(sdate, edate)

df4 = fetchTuData(api, sdate, edate, '000001.SH')
print('df4len======>', len(df4))
c = df4.groupby(['trade_date'])['index_code'].count()
# print(c)

df5 = df.append(df4)
print('df5len======>', len(df5))
c5 = df5.groupby(['trade_date'])['index_code'].count()
# print(c)

for idx in c5.index:
    print('===>C5:', idx, ' ', c5[idx])

print('=========================>CUT')

df6 = cutTuData(df5, 5000, 'trade_date')

print('===>lendf6:', len(df6))
c6 = df6.groupby(['trade_date'])['index_code'].count()
# print(c)

for idx in c6.index:
    print('===>C6:', idx, ' ', c6[idx])
