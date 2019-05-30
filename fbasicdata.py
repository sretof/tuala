#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import pandas as pd

import conf.tables as tbsc
import util.caldate as cd
import util.tuhelper as tuh
import util.tulog as tul

GLOGGER = tul.TuLog('fbasicdata', '/log', True).getlog()


def fhdatas(tc, tabn, tabc, save=True):
    tuapi = tabc['tuapi']
    dfield = tabc['dfield']
    GLOGGER.debug('==S==> tc:%s table:%s tuapi:%s dfield:%s' % (tc, tabn, tuapi, dfield))
    conn = tuh.getMysqlConn()
    cursor = conn.cursor()
    rdf = None
    if tabc['loop']:
        sdate = cd.ymd2date(tuh.getsdate(tuh.getmaxdate(tabn, dfield), tc, tabc['sdate']))
        edate = cd.preday()
        while edate >= sdate:
            df = tuh.gettudf(tuapi, tc, tabc['fields'], sdate.strftime('%Y%m%d'), edate.strftime('%Y%m%d'), spm=tabc['spm'])
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
        df = tuh.gettudf(tuapi, tc, tabc['fields'], spm=tabc['spm'])
        if len(df) > 0:
            rdf = df
        GLOGGER.debug('====DATAS==> dflen:%s' % (len(df)))
    if rdf is None:
        rdf = pd.DataFrame(columns=('ts_code', 'trade_date'))
    if save:
        emsgs = tuh.savedf(tabn, rdf)
        for emsg in emsgs:
            GLOGGER.error(emsg)
    GLOGGER.debug('==E==> tc:%s table:%s tuapi:%s rdflen:%s' % (tc, tabn, tuapi, len(rdf)))
    cursor.close()
    conn.close()
    return rdf


def main():
    for tabn in tbsc.BASICTABLES:
        if not tbsc.BASICTABLES[tabn]['enable']:
            continue
        fhdatas(tabn, tbsc.BASICTABLES[tabn])


if __name__ == '__main__':
    main()
