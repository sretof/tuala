#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import sys

##PART1 BASE
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

# str byte len
print('ABC'.encode('ascii'))
print('中文'.encode('utf-8'))
print(len('中文'))
print(len('中文'.encode('utf-8')))

# tpule list
classmates = ('Michael', 'Bob', 'Tracy')
t = (1, 2)
t1 = (1)
t2 = (1,)
print(classmates)
print(t)
print(t1)
print(t2)

# not support item assignment
# 1[0] = 3
# print(t)

l = ['Apple', 123, True]
print(l)

l[0] = 'Dog'
print(l)

# if-else
age = 18
if age > 20:
    print(1)
elif age > 14:
    print(2)
else:
    print(3)

if age:
    print('True')
else:
    print('False')
age = 0
if age:
    print('True')
else:
    print('False')
age = []
if age:
    print('True')
else:
    print('False')
age = ''
if age:
    print('True')
else:
    print('False')

# for
sum = 0
for x in [1, 2, 3]:
    sum = sum + x
print(sum)

# range
# print(range(5))  #range(0, 5)
print(list(range(5)))
print(list(range(2, 5)))

sum = 0
for x in range(101):
    sum = sum + x
print(sum)

# dict set
d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
print(d['Michael'])
# print(d[1])
print(d.get('Bob', -1))
print(d.get('Bobb', -1))

s = set([1, 1, 2, 2, 3, 3])
s.add(2)
print(s)


##PART2 FUNC
# fun
def swap(a, b):
    c = b
    b = a
    a = c
    return a, b


# def param
def mypower(x, n=2):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s


# recursive func
def fact(n):
    if n == 1:
        return 1
    else:
        return n * fact(n - 1)


# pass
def nop():
    pass


# return a tuple
print(swap(1, 4))
a, b = swap(1, 4)
print(a, b)

print(mypower(3))
print(mypower(3, 3))

print(fact(3))


##PART3 slice ; for...in ; list...range ; generator ; Iterable

##PART4 lambda calculus

##PART5 import/scope/pip
# import sys
def testimp():
    args = sys.argv
    if len(args) == 1:
        print('Hello, world!')
    elif len(args) == 2:
        print('Hello, %s!' % args[1])
    else:
        print('Too many arguments!')


if __name__ == '__main__':
    testimp()
# scope
def _private_1(name):
    return 'Hello, %s' % name

def _private_2(name):
    return 'Hi, %s' % name

def greeting(name):
    if len(name) > 3:
        return _private_1(name)
    else:
        return _private_2(name)

##PART6 mysql

##PART7 web

##PART8 IO/ASYNCIO

##PART9 time datetime calendar
# tsdate = '20040106'
# tmedate = datetime.date(tsdate.year, tsdate.month, 1)
# tmedate = tmedate + datetime.timedelta(days=80)
# tmedate = datetime.date(tmedate.year, tmedate.month, 1)
# days_num = calendar.monthrange(tmedate.year, tmedate.month)[1]
#
# qedate = datetime.date(tsdate.year, tsdate.month, 1)
# tmedate = qedate + datetime.timedelta(days=80)
# tmedate = datetime.date(tmedate.year, tmedate.month, 1)
# days_num = calendar.monthrange(tmedate.year, tmedate.month)[1]
# qsdate = tmedate + datetime.timedelta(days_num - 1)
# if qedate < tsdate :
#     qedate = tsdate
# if qsdate > tedate :
#     qsdate = tedate
# print(qedate, ' ', qsdate)
#
# while qedate < tedate
# isql = ''
# while tsdate < tedate:
#
