#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

STKDAILYTABLES = {
    'stk_daily': {'sdate': '19901219', 'tuapi': 'daily', 'params': '', 'spm': True, 'dfield': 'trade_date', 'enable': True, 'loop': True, 'fields': ''},
    'stk_weekly': {'sdate': '19901219', 'tuapi': 'weekly', 'params': '', 'spm': True, 'dfield': 'trade_date', 'enable': True, 'loop': True, 'fields': ''},
    'stk_monthly': {'sdate': '19901219', 'tuapi': 'monthly', 'params': '', 'spm': True, 'dfield': 'trade_date', 'enable': True, 'loop': True,
                    'fields': ''},
    'stk_daily_basic': {'sdate': '19901219', 'tuapi': 'daily_basic', 'params': '', 'spm': False, 'dfield': 'trade_date', 'enable': True,
                        'loop': True, 'fields': ''},
    'stk_suspend': {'sdate': '19901219', 'tuapi': 'suspend', 'fields': '', 'params': '', 'spm': False, 'dfield': 'suspend_date', 'enable': True,
                    'loop': False, 'fields': 'ts_code,suspend_date,resume_date,ann_date,suspend_reason,reason_type'},
    'stk_adj_factor': {'sdate': '19901219', 'tuapi': 'adj_factor', 'params': '', 'spm': False, 'dfield': 'trade_date', 'enable': True,
                       'loop': True, 'fields': ''},
    'stk_moneyflow': {'sdate': '19901219', 'tuapi': 'moneyflow', 'params': '', 'spm': False, 'dfield': 'trade_date', 'enable': False,
                      'loop': True, 'fields': ''}
}
