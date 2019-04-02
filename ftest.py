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


def nop():
    pass


# return a tuple
print(swap(1, 4))
a, b = swap(1, 4)
print(a, b)

print(mypower(3))
print(mypower(3, 3))
