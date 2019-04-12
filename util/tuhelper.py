#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import pymysql
import tushare as ts

tuMarkets = ('MSCI', 'CSI', 'SSE', 'SZSE', 'CICC', 'SW', 'OTH')
tuApi = ts.pro_api('2b9cb5279a9297a6304a83c5512cccd0a274f09f01f1909f7ec28b5c')
tuMaxLen = 5000

tuSdate = '20040101'

tuSqlMaxL = 2000

mySqlKey = ['open', 'close', 'change']


def getMysqlConn():
    conn = pymysql.connect("localhost", "root", "879211Qa!", "stock")
    return conn


def closeMysqlConn(conn):
    try:
        conn.close()
    except:
        pass


# 传入clo和tab,生成sql
def genInsSql(cols, tab, isql=''):
    if not isql and len(cols) > 0:
        isql = "insert into " + tab + "("
        isqlv = ""
        for col in cols:
            if col in mySqlKey:
                col = '`' + col + '`'
            isql = isql + col + ","
            isqlv = isqlv + "%s" + ","
        isql = isql[:len(isql) - 1]
        isqlv = isqlv[:len(isqlv) - 1]
        isql = isql + ") values(" + isqlv + ")"
    return isql


def cutTuData(df, cutidx):
    while len(df) > 0 and len(df) > tuMaxLen:
        df = df[df[cutidx] > df[cutidx].min()]
    return df


def listToDict(datas, keyn, valn):
    dict = {}
    for data in datas:
        dict[data[keyn]] = data[valn]
    return dict


# to class
def insertData(conn, cursor, sql, val):
    emsg = {}
    try:
        cursor.execute(sql, val)
        conn.commit()
    except Exception as e:
        emsg['e'] = e
        emsg['sql'] = sql
        emsg['val'] = val
    return emsg


def insertDatas(datas, batch=1):
    emsgs = []
    conn = getMysqlConn()
    cursor = conn.cursor()
    if batch == 0:
        if not datas['sql']:
            for data in datas:
                emsg = insertData(conn, cursor, data['sql'], data['val'])
                if emsg:
                    emsgs.append(emsg)
        else:
            for val in datas['vals']:
                emsg = insertData(conn, cursor, datas['sql'], val)
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
        pemsgs = insertDatas({'sql': datas['sql'], 'vals': vals[eidxd['s']:eidxd['e']]}, batch=0)
        if pemsgs:
            emsgs.extend(pemsgs)
    cursor.close()
    closeMysqlConn(conn)
    return emsgs


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
    strt = 'open'
    if strt in mySqlKey:
        strt = '`' + strt + '`'
    print(strt)

    stra = 'opena'
    if stra in mySqlKey:
        stra = '`' + stra + '`'
    print(stra)


if __name__ == '__main__':
    main()
