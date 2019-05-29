#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import cache.datas as cdatas
import util.tuhelper as tuh


def main():
    tuh.initcsql(True)
    conn = tuh.getMysqlConn()
    cursor = conn.cursor()
    for tab in cdatas.CSQLMAP:
        if tab.find('stk') > -1 and tab.find('basic') < 0:
            sqls = cdatas.CSQLMAP[tab].split(";")
            for sql in sqls:
                if sql.strip():
                    print("============>", sql)
                    cursor.execute(sql)
    cursor.close()
    conn.close()


if __name__ == '__main__':
    main()
