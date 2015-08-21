#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, urllib, urllib2, json, logging

APPKEY = 'feb5045020173b7bfa22ecb1ce965d93'

def express_query(com, no):
    '''
    '''
    queryUrl = 'http://v.juhe.cn/exp/index'
    
    paramsData = {'dtype': 'json', 'com': com, 'no': no, 'key': APPKEY}
    params = urllib.urlencode(paramsData)
    
    req = urllib2.Request(queryUrl, params)
    req.add_header('Content-Type', "application/x-www-form-urlencoded")
    resp = urllib2.urlopen(req)
    content = resp.read()
    if(content):
        result = json.loads(content, 'utf-8')
        error_code = result['error_code']
        if(error_code == 0):
            return result['result']
        else:
            errorinfo = str(error_code)+":"+result['reason']
            logging.error(errorinfo)

def express_com_query():
    '''
    '''
    comUrl = 'http://v.juhe.cn/exp/com'

    paramsData = {'dtype': 'json', 'key': APPKEY}
    params = urllib.urlencode(paramsData)
    
    req = urllib2.Request(queryUrl, params)
    req.add_header('Content-Type', "application/x-www-form-urlencoded")
    resp = urllib2.urlopen(req)
    content = resp.read()
    if(content):
        result = json.loads(content, 'utf-8')
        error_code = result['error_code']
        if(error_code == 0):
            return result['result']
        else:
            errorinfo = str(error_code)+":"+result['reason']
            logging.error(errorinfo)

if __name__ == '__main__':
    print express_com_query()
    print express_query('zto', '718862510570')
