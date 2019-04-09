#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import calendar
import datetime


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


def test():
    tdate = datetime.date.today()
    for i in range(0, 25):
        print(i, ' ', calMonthS(tdate, i), ' ', calMonthE(tdate, i))

if __name__ == '__main__':
    test()
