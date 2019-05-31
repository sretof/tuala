#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

STKDAILYTABLES = {
    'stk_daily': {'sdate': '19901219', 'tuapi': 'daily', 'spm': True, 'dfield': 'trade_date', 'enable': True, 'loop': True, 'fields': ''},
    'stk_weekly': {'sdate': '19901219', 'tuapi': 'weekly', 'spm': True, 'dfield': 'trade_date', 'enable': False, 'loop': True, 'fields': ''},
    'stk_monthly': {'sdate': '19901219', 'tuapi': 'monthly', 'spm': True, 'dfield': 'trade_date', 'enable': False, 'loop': True, 'fields': ''},
    'stk_daily_basic': {'sdate': '19901219', 'tuapi': 'daily_basic', 'spm': False, 'dfield': 'trade_date', 'enable': False, 'loop': True, 'fields': ''},
    'stk_suspend': {'sdate': '19901219', 'tuapi': 'suspend', 'fields': '', 'spm': False, 'dfield': 'suspend_date', 'enable': True, 'loop': False,
                    'fields': 'ts_code,suspend_date,resume_date,ann_date,suspend_reason,reason_type'},
    'stk_adj_factor': {'sdate': '19901219', 'tuapi': 'adj_factor', 'spm': False, 'dfield': 'trade_date', 'enable': True, 'loop': True, 'fields': ''},
    'stk_moneyflow': {'sdate': '19901219', 'tuapi': 'moneyflow', 'spm': False, 'dfield': 'trade_date', 'enable': False, 'loop': True, 'fields': ''}
}

BASICTABLES = {
    'stk_basic': {'params': ({'list_status': 'L'}, {'list_status': 'D'}, {'list_status': 'P'}), 'tuapi': 'stock_basic', 'spm': False, 'enable': True,
                  'kfield': 'ts_code', 'ufields': ['delist_date', 'list_status', 'name'],
                  'fields': 'ts_code,symbol,name,area,industry,fullname,enname,market,exchange,list_status,delist_date,list_date,is_hs'}
}
