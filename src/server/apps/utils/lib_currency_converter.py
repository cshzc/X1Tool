#!/usr/bin/env python
# -*- coding: utf-8 -*-
import urllib2, urllib, logging


def currency_query(from_tkc, to_tkc, amount):
    #handler = urllib2.HTTPHandler(debuglevel=1)
    #opener = urllib2.build_opener(handler)
    #urllib2.install_opener(opener)
    query_url = 'http://download.finance.yahoo.com/d/quotes.csv?s=%s%s=X&f=nl1d1t1' % (from_tkc, to_tkc)
    req = urllib2.Request(query_url)
    req.add_header("Accept", "text/html,application/xhtml+xml,application/xml")
    req.add_header("Connection", "keep-alive")
    req.add_header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36")
    timeout = 5 
    print query_url
    try:
        resp = urllib2.urlopen(req, None, timeout)
        content = resp.read()
        print content
        if content:
            try:
            	result = content.split(',')
            	rate = float(result[1])
            	converted = amount * rate
            	return {'result': converted, 'rate': rate, 'time': '%s %s' % (eval(result[2]), eval(result[3]))}
            except Exception, e:
            	logging.error(str(e))
    except Exception, e:
        logging.error(str(e))   

    return {'redirect': query_url}


if __name__ == '__main__':
    print currency_query('USD', 'CNY', 100)
    print currency_query('JPY', 'CNY', 11000)




