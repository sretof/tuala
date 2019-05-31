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


def fhdatas(tc, tabn, tabc):
    tuapi = tabc['tuapi']
    dfield = tabc['dfield']
    GLOGGER.debug('==S==> table:%s tc:%s tuapi:%s dfield:%s' % (tabn, tc, tuapi, dfield))
    conn = tuh.getMysqlConn()
    cursor = conn.cursor()
    rdf = None
    maxdate = tuh.getmaxdate(TABMAXVAL[tabn], tc)
    if tabc['loop']:
        sdate = cd.ymd2date(maxdate)
        edate = cd.preday()
        while edate >= sdate:
            kwargs = {'ts_code': tc, 'start_date': sdate.strftime('%Y%m%d'), 'end_date': edate.strftime('%Y%m%d')}
            df = tuh.gettudf(tuapi, tabc['fields'], kwargs, spm=tabc['spm'])
            if len(df) > 0:
                if rdf is None:
                    rdf = df
                else:
                    rdf = rdf.append(df)
            GLOGGER.debug('====LOOP DATAS==> sdate:%s edate:%s dflen:%s' % (sdate, edate, len(df)))
            if len(df) < 1 or pd.isnull(df[dfield].min()):
                edate = cd.preday(sdate)
            else:
                edate = cd.preday(cd.ymd2date(df[dfield].min()))
    else:
        kwargs = {'ts_code': tc}
        df = tuh.gettudf(tuapi, tabc['fields'], kwargs, spm=tabc['spm'])
        df = df[df[dfield] >= maxdate]
        if len(df) > 0:
            rdf = df
        GLOGGER.debug('====DATAS==> dflen:%s' % (len(df)))
    if rdf is None:
        rdf = pd.DataFrame(columns=('ts_code', 'trade_date'))
    emsgs = tuh.savedialydf(tabn, rdf)
    for emsg in emsgs:
        GLOGGER.error(emsg)
    GLOGGER.debug('==E==> table:%s tc:%s tuapi:%s rdflen:%s' % (tabn, tc, tuapi, len(rdf)))
    cursor.close()
    conn.close()
    return rdf


def main():
    tcs = tuh.getallstktc()
    for tc in tcs:
        for tabn in tbsc.STKDAILYTABLES:
            if not tbsc.STKDAILYTABLES[tabn]['enable']:
                continue
            if tabn not in TABMAXVAL:
                TABMAXVAL[tabn] = tuh.getkfmvmap(tabn, 'ts_code', tbsc.STKDAILYTABLES[tabn]['dfield'])
            fhdatas(tc['ts_code'], tabn, tbsc.STKDAILYTABLES[tabn])


if __name__ == '__main__':
    main()
