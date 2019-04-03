#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

from functools import partial

import pandas as pd
import requests
import simplejson as json


class DataApi:
    __token = ''
    __http_url = 'http://api.tushare.pro'

    def __init__(self, token='2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c', timeout=10):
        self.__token = token
        self.__timeout = timeout

    def query(self, api_name, fields='', **kwargs):
        req_params = {
            'api_name': api_name,
            'token': self.__token,
            'params': kwargs,
            'fields': fields
        }

        res = requests.post(self.__http_url, json=req_params, timeout=self.__timeout)
        result = json.loads(res.text)
        if result['code'] != 0:
            raise Exception(result['msg'])
        data = result['data']
        columns = data['fields']
        items = data['items']

        return pd.DataFrame(items, columns=columns)

    def __getattr__(self, name):
        return partial(self.query, name)
