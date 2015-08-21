#!/usr/bin/env python
# -*- coding: utf-8 -*-
#python chk_ip.py www.google.com |python chk_ip.py 8.8.8.8 |python chk_ip.py ip.txt
 
import signal
import urllib
import json
import sys,os,re
import socket
 
  
URL = "http://ip.taobao.com/service/getIpInfo.php?ip="
 
def ip_location(ip):
    data = urllib.urlopen(URL + ip).read()
    datadict=json.loads(data)
 
    for oneinfo in datadict:
        if "code" == oneinfo:
            if datadict[oneinfo] == 0:
                return datadict


if __name__ == '__main__':
    pass