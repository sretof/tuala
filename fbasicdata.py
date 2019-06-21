#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = 'Erik YU'

import conf.tables as tbsc
import util.tuhelper as tuh
import util.tulog as tul

GLOGGER = tul.TuLog('fbasicdata', '/log', True).getlog()


def fhdatas(tabn, tabc):
    tuapi = tabc['tuapi']
    params = tabc['params']
    kfield = tabc['kfield']
    ufields = tabc['ufields']
    GLOGGER.debug('==S==> table:%s tuapi:%s params:%s' % (tabn, tuapi, params))
    bdmap = tuh.getbdmap(tabn, kfield, tabc['ufields'])
    rdf = None
    for parma in params:
        df = tuh.gettudf(tuapi, tabc['fields'], parma, spm=tabc['spm'])
        GLOGGER.debug('====PARAM DATAS==> param:%s dflen:%s' % (parma, len(df)))
        if len(df) > 0:
            if rdf is None:
                rdf = df
            else:
                rdf = rdf.append(df)
    conn = tuh.getMysqlConn()
    cursor = conn.cursor()
    emsgs = tuh.savebasicdf(tabn, rdf, bdmap, kfield, ufields, GLOGGER)
    for emsg in emsgs:
        GLOGGER.error(emsg)
    GLOGGER.debug('==E==> table:%s tuapi:%s rdflen:%s' % (tabn, tuapi, len(rdf)))
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
