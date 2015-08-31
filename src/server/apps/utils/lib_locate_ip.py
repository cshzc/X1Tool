#!/usr/bin/env python
# -*- coding: utf-8 -*-
#python chk_ip.py www.google.com |python chk_ip.py 8.8.8.8 |python chk_ip.py ip.txt
 
import signal
import urllib
import json
import sys,os,re
import socket
import logging
  
URL = "http://ip.taobao.com/service/getIpInfo.php?ip="


def ip_location(ip):
    data = urllib.urlopen(URL + ip).read()
    datadict=json.loads(data)
 
    for oneinfo in datadict:
        if "code" == oneinfo:
            if datadict[oneinfo] == 0:
                return datadict


def get_formatted_location(ip):
    location = ''
    information = ip_location(ip)
    keys = ['city', 'area', 'country', 'isp']
    for key in keys:
        try:
            value = information['data'][key]
            if value != '':
                location += '[%s]' % value
        except Exception, e:
            logging.error('%s', str(e))

    return location


if __name__ == '__main__':
    print ip_location('103.14.252.249')
    print get_formatted_location('103.14.252.249')

    print ip_location('180.102.105.228')
    print get_formatted_location('180.102.105.228')


