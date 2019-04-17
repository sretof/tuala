#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 前复权

__author__ = 'Erik YU'

import pandas as pd
import pymysql

import util.caldate as cd
import util.tuhelper as tuh
import util.tulog as tul

__force = False
__fav = 2
__batch = True
__mwdx = ('daily', 'weekly', 'monthly')
__mwd = ('daily',)

__logmap = {
    'mlog': tul.TuLog('fetch_stk_m_x', '/log', True).getlog(),
    'wlog': tul.TuLog('fetch_stk_w_x', '/log', True).getlog(),
    'dlog': tul.TuLog('fetch_stk_d_x', '/log', True).getlog()
}

__qdfcmap = {
    'm': [],
    'w': [],
    'd': []
}

__ocols = ('close', 'open', 'high', 'low', 'pre_close', 'change', 'pct_chg')
__ocolmap = {}
for ocol in __ocols:
    __ocolmap[ocol] = 'ori_' + ocol

PRICE_COLS = ['open', 'close', 'high', 'low', 'pre_close']
FORMAT = lambda x: '%.2f' % x


def fetchdataone(ind):
    logger = __logmap[ind[0:1] + 'log']
    conn = tuh.getMysqlConn()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    if __fav == 0 or __fav == 1:
        cursor.execute(
            "select t.ts_code from stk_basic t where t.del<>1 and t.fav=" + str(__fav) + " order by t.ts_code;")
    else:
        cursor.execute("select t.ts_code from stk_basic t where t.del<>1 order by t.ts_code;")
    stkbs = cursor.fetchall()
    cursor.close()

    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select t.ts_code as stkc,max(t.trade_date) as md from stk_" + ind + " t group by t.ts_code;")
    stkmtdd = tuh.listToDict(cursor.fetchall(), 'stkc', 'md')
    cursor.close()
    tuapi = tuh.tuApi
    isql = ''

    cursor = conn.cursor()
    for stk in stkbs:
        stkc = stk['ts_code']
        sdate = cd.ymd2date(tuh.getsdate(stkmtdd, stkc, __force))
        edate = cd.preday()
        while edate >= sdate:
            df = fetchtudata(tuapi, ind, sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'), stkc)
            logger.debug('====SSSS====> %s %s===>sd:%s ed:%s len(df):%s' % (stkc, ind, sdate, edate, len(df)))
            if len(df) > 0:
                cols = df.columns
                isql = tuh.geninssql(cols, 'stk_' + ind, isql)
                rowvs = []
                for index, row in df.iterrows():
                    rowv = []
                    for col in cols:
                        rowv.append(row[col])
                    rowvs.append(rowv)
                emsgs = tuh.saveorupdate({'sql': isql, 'vals': rowvs})
                for m in emsgs:
                    logger.error(m)
                logger.debug('====SAVEEND====> %s %s===>sd:%s ed:%s ldf:%d mtd:%s emc:%d' % (
                    stkc, ind, sdate, edate, len(df), df['trade_date'].min(), len(emsgs)))
            if df is None or pd.isnull(df['trade_date'].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df['trade_date'].min()))
    cursor.close()
    conn.close()


def fetchtudata(api, ind, sdate, edate, stkc):
    excnt = 0
    while excnt < tuh.tumaxexcnt:
        try:
            if ind == 'm' or ind == 'monthly':
                fdf = api.monthly(ts_code=stkc, start_date=sdate, end_date=edate)
            elif ind == 'w' or ind == 'weekly':
                fdf = api.weekly(ts_code=stkc, start_date=sdate, end_date=edate)
            else:
                fdf = api.daily(ts_code=stkc, start_date=sdate, end_date=edate)
            if fdf is not None and len(fdf) > 0:
                fdf.rename(columns=__ocolmap, inplace=True)
                freq = ind[0:1].upper()
                qdf = tuh.tspro.pro_bar(api=api, adj='hfq', freq=freq, ts_code=stkc, start_date=fdf['trade_date'].min(), end_date=fdf['trade_date'].max())
                qdfcl = __qdfcmap[ind[0:1]]
                if not qdfcl:
                    fcols = fdf.columns.values
                    qcols = qdf.columns.values
                    for qcol in qcols:
                        if qcol in fcols and qcol != 'trade_date':
                            qdfcl.append(qcol)
                qdf = qdf.drop(qdfcl, axis=1)

                pdate = cd.preday().strftime('%Y%m%d')
                fcts = api.adj_factor(ts_code=stkc, start_date=pdate, end_date=pdate)
                if fcts is None or len(fcts) < 1:
                    fcts = api.adj_factor(ts_code=stkc)
                for col in PRICE_COLS:
                    qdf[col] = qdf[col] / float(fcts['adj_factor'][0])
                    qdf[col] = qdf[col].map(FORMAT)
                    qdf[col] = qdf[col].astype(float)
                qdf['change'] = qdf['close'] - qdf['pre_close']
                qdf['pct_chg'] = qdf['change'] / qdf['pre_close'] * 100

                fdf = fdf.set_index('trade_date', drop=False).merge(qdf.set_index('trade_date'), left_index=True, right_index=True, how='left')
            break
        except BaseException as e:
            raise e
            # print(e)
            # excnt += 1
            # if excnt == tuh.tumaxexcnt:
            #     raise e
            # else:
            #     time.sleep(60)
            # continue
    if fdf is None:
        fdf = pd.DataFrame(columns=('ts_code', 'trade_date'))
    if len(fdf) > 0:
        fdf = fdf.fillna(0)
    return fdf


def fetchdata():
    for ind in __mwd:
        fetchdataone(ind)


def main():
    fetchdata()


# def test():
#     # idxsdd = {'1': '20180101'}
#     # print('1===>', getIdxSdate(idxsdd, '1'))
#     # print('2===>', getIdxSdate(idxsdd, '2'))
#     # print('3===>', getIdxSdate(idxsdd, '1', True))
#     # print(not __qdfcmap['m'])
#     # print('w'[0:1].upper(), '   ', 'weekly'[0:1].upper())
#     # __logmap['mlog'].info('ddddddddddddd')
#     #
#     # qlist = ['aa', 'bb', 'cc']
#     # print('c' in qlist)
#     # print('bb' in qlist)
#     fdf = fetchtudata(tuh.tuApi, 'd', '19910404', '19910404', '000001.SZ')
#     print(fdf.columns.values)
#     rowvs = []
#     for index, row in fdf.iterrows():
#         rowv = []
#         for col in fdf.columns.values:
#             rowv.append(row[col])
#         rowvs.append(rowv)
#     print(rowvs)
#     fcts = tuh.tuApi.adj_factor(ts_code='000001.SZ', start_date='20190416', end_date='20190416')
#     print(fcts)
#     fdf = fetchtudata(tuh.tuApi, 'd', '19910404', '19910404', '000001.SZ')
#     print(fdf)


if __name__ == '__main__':
    main()
