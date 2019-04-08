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

df = api.index_dailybasic(trade_date='20181018')
