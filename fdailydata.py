#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import pandas as pd

import conf.tables as tbsc
import util.caldate as cd
import util.tuhelper as tuh
import util.tulog as tul

GLOGGER = tul.TuLog('fstkdailydata', '/log', True).getlog()
TABLOGMAP = {}
TABMAXVAL = {}
BASICTABDATA = {}


# 1.每日新增,有开始结束时间 loop=true
# 2.每日新增,有开始结束时间,需要裁剪 loop=true,cut=true
# 3.每日新增,无需时间 loop=false
def fhdatas(kf, kfv, tabn, tabc):
    tuapi = tabc['tuapi']
    dfield = tabc['dfield']
    GLOGGER.debug('==S==> table:%s tc:%s tuapi:%s dfield:%s' % (tabn, kfv, tuapi, dfield))
    conn = tuh.getMysqlConn()
    cursor = conn.cursor()
    rdf = None
    maxdate = tuh.getmaxdate(TABMAXVAL[tabn], kfv, tabc.get('sdate', tuh.TUSDATE))
    if tabc['loop']:
        sdate = cd.ymd2date(maxdate)
        edate = cd.preday()
        edatestr = tabc.get('edate', '')
        if edatestr:
            edate = cd.ymd2date(edatestr)
        while edate >= sdate:
            kwargs = {kf: kfv, 'start_date': sdate.strftime('%Y%m%d'), 'end_date': edate.strftime('%Y%m%d')}
            cut = tabc.get('cut', False)
            cfield = tabc.get('cfield', '')
            clen = tabc.get('clen', tuh.CUTMAXLEN)
            df = tuh.gettudf(tuapi, tabc['fields'], kwargs, spm=tabc['spm'], cut=cut, cfield=cfield, clen=clen)
            GLOGGER.debug('====LOOP DATAS==> sdate:%s edate:%s dflen:%s' % (sdate, edate, len(df)))
            if len(df) > 0:
                if rdf is None:
                    rdf = df
                else:
                    rdf = rdf.append(df)
            if len(df) < 1 or pd.isnull(df[dfield].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df[dfield].min()))
    else:
        kwargs = {kf: kfv}
        df = tuh.gettudf(tuapi, tabc['fields'], kwargs, spm=tabc['spm'])
        df = df[df[dfield] >= maxdate]
        if len(df) > 0:
            rdf = df
        GLOGGER.debug('====DATAS==> dflen:%s' % (len(df)))
    if rdf is None:
        rdf = pd.DataFrame(columns=(kf,))
    emsgs = tuh.savedialydf(tabn, rdf)
    for emsg in emsgs:
        GLOGGER.error(emsg)
    GLOGGER.debug('==E==> table:%s tc:%s tuapi:%s rdflen:%s' % (tabn, kfv, tuapi, len(rdf)))
    cursor.close()
    conn.close()
    return rdf


def fhstkdaily(fav=2):
    btabn = 'stk_basic'
    bkf = 'ts_code'
    tcs = tuh.getallbasics(btabn, bkf, fav)
    for tc in tcs:
        for tabn in tbsc.STKDAILYTABLES:
            if not tbsc.STKDAILYTABLES[tabn]['enable']:
                continue
            kf = tbsc.STKDAILYTABLES[tabn]['kfield']
            if tabn not in TABMAXVAL:
                TABMAXVAL[tabn] = tuh.getkfmvmap(tabn, kf, tbsc.STKDAILYTABLES[tabn]['dfield'])
            fhdatas(tc[kf], tabn, tbsc.STKDAILYTABLES[tabn])


def fhfunddaily(fav=2):
    btabn = 'fund_basic'
    bkf = 'ts_code'
    tcs = tuh.getallbasics(btabn, bkf, fav)
    for tc in tcs:
        for tabn in tbsc.FUNDDAILYTABLES:
            if not tbsc.FUNDDAILYTABLES[tabn]['enable']:
                continue
            kf = tbsc.FUNDDAILYTABLES[tabn]['kfield']
            if tabn not in TABMAXVAL:
                TABMAXVAL[tabn] = tuh.getkfmvmap(tabn, kf, tbsc.FUNDDAILYTABLES[tabn]['dfield'])
            fhdatas(kf, tc[bkf], tabn, tbsc.FUNDDAILYTABLES[tabn])


def fhidxdaily(fav=2):
    btabn = 'idx_basic'
    bkf = 'ts_code'
    tcs = tuh.getallbasics(btabn, bkf, fav)
    for tc in tcs:
        for tabn in tbsc.IDXDAILYTABLES:
            if not tbsc.IDXDAILYTABLES[tabn]['enable']:
                continue
            if tbsc.IDXDAILYTABLES[tabn].get('freq', 'D') == 'M' and int(cd.today().strftime('%Y%m%d')[6:8]) != 5:
                continue
            kf = tbsc.IDXDAILYTABLES[tabn]['kfield']
            if tabn not in TABMAXVAL:
                TABMAXVAL[tabn] = tuh.getkfmvmap(tabn, kf, tbsc.IDXDAILYTABLES[tabn]['dfield'])
            fhdatas(kf, tc[bkf], tabn, tbsc.IDXDAILYTABLES[tabn])


def main():
    fhstkdaily(1)
    # fhfunddaily()
    # fhidxdaily(1)


if __name__ == '__main__':
    main()
