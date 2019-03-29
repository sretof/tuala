#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# print
print('hello world')
print(2 ** 3)

# print format
print('hello world %s %d' % ('Erik', 8314))
print('Hello, {0}, 成绩提升了 {1:.1f}%'.format('Erik', 17.125))

# \n ...
print('hello\nworld')

# input
# name=input()
# print(name)

# TF
print(3 > 2)

# if-else
age = 18
if age > 2:
    print(1)
else:
    print(2)

# str byte len
print('ABC'.encode('ascii'))
print('中文'.encode('utf-8'))
print(len('中文'))
print(len('中文'.encode('utf-8')))
