#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import json
import urllib, urllib2

def baidu_tinyurl(raw_url):
    api = 'http://dwz.cn/create.php'
    paramsData = {'url': raw_url.encode('utf-8')}
    params = urllib.urlencode(paramsData)

    req = urllib2.Request(api, params)
    req.add_header('Content-Type', "application/x-www-form-urlencoded")
    resp = urllib2.urlopen(req)
    content = resp.read()
    if(content):
        result = json.loads(content, 'utf-8')
        status = result[u'status']
        if status == 0:
            return {'tinyurl': result[u'tinyurl']}
        else:
            errorinfo = str(status)+":"+result[u'err_msg']
            logging.error(errorinfo)

def gen_tinyurl(type, raw_url):
    if type == 'baidu':
        return baidu_tinyurl(raw_url)
    else:
        return None

if __name__ == '__main__':
    print baidu_tinyurl('http://x1tool.com')
