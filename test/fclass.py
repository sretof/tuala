#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import logging
import os


class TuLogTest:
    name = 'Class TuLogTest'
    # 日志打印格式

    logging.basicConfig(level=logging.INFO)
    log_file_handler = logging.FileHandler('../log/' + __name__ + '.log')
    log_fmt = '%(asctime)s\tFile \"%(filename)s\",line %(lineno)s\t%(levelname)s: %(message)s'
    formatter = logging.Formatter(log_fmt)
    log_file_handler.setFormatter(formatter)
    log = logging.getLogger()
    log.addHandler(log_file_handler)

    def __init__(self):
        self.log = TuLogTest.log

    def init_log(self, name, lpath='../log/'):
        log_file_handler = logging.FileHandler(lpath + name + '.log')
        log_file_handler.setFormatter(TuLogTest.formatter)
        self.log = logging.getLogger()
        self.log.addHandler(log_file_handler)


def main():
    tuh1 = TuLogTest()
    tuh1.name = 'Object TuLogTest'
    print(TuLogTest.name)
    print(tuh1.name)

    lg1 = TuLogTest()
    lg1.log.info('lg1-1===>1111111111111')

    lg2 = TuLogTest()
    lg2.init_log('lg2')
    lg2.log.info('lg2-1===>2111111111111')

    lg1.log.info('lg1-2===>3111111111111')

    print('======>' + os.getcwd())


if __name__ == '__main__':
    main()
