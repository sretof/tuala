#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import os

import numpy as np
import pandas as pd
import pymysql
import tushare as ts

import cache.datas as cdatas
import conf.db as dbc
import conf.tables as tbsc
import util.caldate as cd

tuMarkets = ('MSCI', 'CSI', 'SSE', 'SZSE', 'CICC', 'SW', 'OTH')
tuApi = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')
tuMaxLen = 5000
tspro = ts

tumaxexcnt = 4

tuSdate = '19901219'

tuSqlMaxL = 2000

mySqlKey = ['open', 'close', 'change', 'new']


def getMysqlConn():
    conn = pymysql.connect(dbc.DBHOST, dbc.DBUNAME, dbc.DBPWD, dbc.DBSCHEMA)
    return conn


def closeMysqlConn(conn):
    try:
        conn.close()
    except:
        pass


# 检查table是否存在,不存在新建
def cctable(conn, tab):
    csql = "SELECT count(*) FROM information_schema.tables WHERE table_name = '%s' and table_schema='%s'" % (tab, dbc.DBSCHEMA)
    cursor = conn.cursor()
    cursor.execute(csql)
    cnt = cursor.fetchone()[0]
    print(cnt)
    if cnt < 1:
        if not cdatas.CSQLMAP:
            initcsql()
        if tab in cdatas.CSQLMAP:
            cursor.execute(cdatas.CSQLMAP[tab])
    cursor.close()


# 初始化CSQLMAP
def initcsql():
    flist = os.listdir(dbc.CSQLDIR)
    for i in range(0, len(flist)):
        cuts = flist[i].index('_')
        if cuts > 0:
            tabn = flist[i][(cuts + 1):]
        cute = tabn.index('.')
        if cute > 0:
            tabn = tabn[0:cute]
        path = os.path.join(dbc.CSQLDIR, flist[i])
        if os.path.isfile(path):
            with open(path, 'r', encoding='UTF-8') as f:
                csql = f.read().encode('utf-8').decode('utf-8-sig')
                csql = csql.replace('CHARACTER SET utf8 COLLATE utf8_general_ci', '')
                csql = csql.replace('DEFAULT CHARSET=utf8', '')
                cdatas.CSQLMAP[tabn] = csql


# 传入clo和tab,生成sql
def geninssql(cols, tab, isql=''):
    if not isql and len(cols) > 0:
        isql = "insert into " + tab + "("
        isqlv = ""
        for col in cols:
            if len(col) > 3 and col.find('is_', 0, 3) == 0:
                col = col[3:]
            if col in mySqlKey:
                col = '`' + col + '`'
            isql = isql + col + ","
            isqlv = isqlv + "%s" + ","
        isql = isql[:len(isql) - 1]
        isqlv = isqlv[:len(isqlv) - 1]
        isql = isql + ") values(" + isqlv + ")"
    return isql


# 传入clo/tab/wherec,生成update sql
def genupdsql(cols, tab, wherec, usql=''):
    if not usql and len(cols) > 0:
        usql = "update " + tab + " set"
        for col in cols:
            if len(col) > 3 and col.find('is_', 0, 3) == 0:
                col = col[3:]
            if col in mySqlKey:
                col = '`' + col + '`'
            usql = usql + " " + col + "=%s,"
        usql = usql[:len(usql) - 1]
        usql = usql + " where 1=1"
        for wc in wherec:
            usql = usql + " and " + wc + "=%s"
    return usql


def cutTuData(df, cutidx, maxLen=tuMaxLen):
    # print('maxL======>', maxLen)
    # while len(df) > 0 and len(df) >= maxLen and len(df.groupby([cutidx])) > 1:
    #     print('=====>', df[cutidx].min())
    #     df = df[df[cutidx] > df[cutidx].min()]
    # return df
    gc = df.groupby([cutidx]).size().sort_index(ascending=False)
    tcnt = 0
    tcidx = ''
    for gci in gc.index:
        tcnt += gc[gci]
        if tcnt >= maxLen:
            tcidx = gci
            break
    if tcidx:
        df = df[df[cutidx] >= tcidx]
    return df


def listToDict(datas, keyn, valn):
    dict = {}
    for data in datas:
        if valn == '_all_':
            dict[data[keyn]] = data
        else:
            dict[data[keyn]] = data[valn]
    return dict


def getsdate(stkmtdd, stkc, force=False):
    sdate = stkmtdd.get(stkc, tuSdate)
    if sdate > tuSdate:
        dsdate = cd.ymd2date(sdate)
        dsdate = cd.preday(dsdate, -1)
        sdate = dsdate.strftime('%Y%m%d')
    if force or sdate < tuSdate:
        sdate = tuSdate
    return sdate


# to class
def saveorupdateone(conn, cursor, sql, val):
    emsg = {}
    try:
        cursor.execute(sql, val)
        conn.commit()
    except Exception as e:
        emsg['e'] = e
        emsg['sql'] = sql
        emsg['val'] = val
    return emsg


def saveorupdate(datas, batch=True, cursor=None):
    emsgs = []
    nclose = False
    if cursor is None:
        nclose = True
        conn = getMysqlConn()
        cursor = conn.cursor()
    if not batch:
        if not datas['sql']:
            for data in datas:
                emsg = saveorupdateone(conn, cursor, data['sql'], data['val'])
                if emsg:
                    emsgs.append(emsg)
        else:
            for val in datas['vals']:
                emsg = saveorupdateone(conn, cursor, datas['sql'], val)
                if emsg:
                    emsgs.append(emsg)
        cursor.close()
        closeMysqlConn(conn)
        return emsgs

    if not datas['sql'] or not datas['vals'] or len(datas['vals']) < 1:
        cursor.close()
        closeMysqlConn(conn)
        return emsgs

    vals = datas['vals']
    vlen = len(vals)
    sidx = 0
    eidx = min(tuSqlMaxL, vlen)
    eidxds = []
    while sidx < eidx:
        try:
            cursor.executemany(datas['sql'], vals[sidx:eidx])
            conn.commit()
        except Exception as e:
            print('batchSave Err===>', e)
            eidxds.append({'s': sidx, 'e': eidx})
            conn.rollback()
        finally:
            sidx = eidx
            eidx = min(eidx + tuSqlMaxL, vlen)
    for eidxd in eidxds:
        pemsgs = saveorupdate({'sql': datas['sql'], 'vals': vals[eidxd['s']:eidxd['e']]}, batch=False)
        if pemsgs:
            emsgs.extend(pemsgs)
    if nclose:
        cursor.close()
        closeMysqlConn(conn)
    return emsgs


def getstktcs(fav=2):
    conn = getMysqlConn()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    if fav == 0 or fav == 1:
        cursor.execute(
            "select t.ts_code from stk_basic t where t.del<>1 and t.fav=" + str(fav) + " order by t.ts_code;")
    else:
        cursor.execute("select t.ts_code from stk_basic t where t.del<>1 order by t.ts_code;")
    stktcs = cursor.fetchall()
    cursor.close()
    closeMysqlConn(conn)
    return stktcs


def cleandf(fdf, clos=('ts_code', 'trade_date')):
    if fdf is None:
        fdf = pd.DataFrame(columns=clos)
    if len(fdf) > 0:
        fdf = fdf.fillna(0)
        fdf.replace(np.inf, 0, inplace=True)
    return fdf


def getstkmtdm(table):
    conn = getMysqlConn()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("select t.ts_code as stktc,max(t.trade_date) as md from " + table + " t group by t.ts_code;")
    stkmtdm = listToDict(cursor.fetchall(), 'stktc', 'md')
    cursor.close()
    closeMysqlConn(conn)
    return stkmtdm


def main():
    # cols = ('Michael', 'Bob', 'Tracy')
    # print("=====>", genInsSql(cols, 'idx_w'))
    # log = tlog.TuLog('tlogimptest').getlog()
    # data={}
    # data['sql']='insert into idx_w(Michael,Bob,Tracy) values(%s,%s,%s)'
    # data['val']=['1','2','3']
    # log.info(data)

    # dl = ['1', '2', '3', '4', '5', '6']
    # d2 = dl[0:3]
    # d3 = dl[3:6]
    # d4 = dl[1:]
    #
    # print(dl)
    # print(d2)
    # print(d3)
    # print(d4)
    # print(min(4, 5, 8))
    #
    # a = 3
    # b = 4
    # d1 = {'a': a, 'b': b}
    # print('d1-1==>', d1)
    # a = 30
    # b = 40
    # print('d1-2==>', d1)

    # isql = genInsSql(('trade_date', 'index_code', 'con_code', 'weight'), 'idx_weight')
    #
    # vals1 = [('20190102', '003', '1', '0'), ('20190102', '001', '1', '0'), ('20190202', '001', '1', '0'),
    #          ('20190202', '002', '1', '0'), ('20190202', '003', '1', '0'), ('20190803', '001', '1', '0'),
    #          ('20190104', '001', '1', '0'), ('20190704', '001', '1', '0'), ('20190304', '001', '1', '0'),
    #          ('20190605', '001', '1', '0'), ('20190604', '001', '1', '0'), ('20190304', '001', '1', '0'),
    #          ('20190507', '001', '1', '0'), ('20190508', '001', '1', '0'), ('20190509', '001', '1', '0')]
    #
    # # print(vals1[2:])
    #
    # emsgs = insertDatas({'sql': isql, 'vals': vals1})
    # logger = tlog.TuLog('thhtest').getlog()
    # for emsg in emsgs:
    #     logger.error(emsg)
    # strt = 'open'
    # if strt in mySqlKey:
    #     strt = '`' + strt + '`'
    # print(strt)
    #
    # stra = 'opena'
    # if stra in mySqlKey:
    #     stra = '`' + stra + '`'
    # print(stra)
    # cols = ('Michael', 'Bob', 'Tracy')
    # wcs = ('c1', 'c2')
    # print("=====>", genupdsql(cols, 'idx_w', wcs))
    # dates = {
    #     'sql': 'insert into stk_daily(ts_code,trade_date,ori_open,ori_high,ori_low,ori_close,ori_pre_close,ori_change,ori_pct_chg,vol,amount,`open`,high,low,`close`,pre_close,`change`,pct_chg) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
    #     'vals': [['600601.SH', '19901219', 185.3, 185.3, 185.3, 185.3, 1.0, 184.3, 18430.0, 50.0, 37.0, 0.03, 0.03, 0.03, 0.03, 0.0, 0.03, 0.0],
    #              ['600602.SH', '19901219', 365.7, 384.0, 365.7, 384.0, 1.0, 383.0, 38300.0, 1160.0, 443.0, 0.7, 0.73, 0.7, 0.73, 0.0, 0.73, 0.0]]
    # }
    # saveorupdate(dates)
    conn = getMysqlConn()
    for tab in tbsc.STKDAILYTABLES:
        cctable(conn, tab)
    conn.close()
    # initcsql()


if __name__ == '__main__':
    main()
