#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

arr1 = ['a']
arr2 = ['b', 'a']
arr3 = []

print(arr1 + arr2 + arr3)

print(arr1)

arr1.append(arr2)
print(arr1)
arr1.append(arr3)
print(arr1)
