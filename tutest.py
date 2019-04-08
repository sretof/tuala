#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import tuclient as ts

tuc = ts.DataApi()
data = tuc.stock_basic("ts_code,name,area,industry,list_date")
print(data)

data = tuc.index_dailybasic(trade_date='20181018', fields='ts_code,trade_date,turnover_rate,pe')