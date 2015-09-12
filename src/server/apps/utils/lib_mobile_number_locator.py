#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib
import json

API = 'http://virtual.paipai.com/extinfo/GetMobileProductInfo?mobile=%s&amount=10000&callname=getPhoneNumInfoExtCallback'

def mobile_number_locator(mobile_number):
    ''' Locate mobile number
    '''
    data = urllib.urlopen(API % mobile_number).read().decode('gbk')
    ''' Return data is
        getPhoneNumInfoExtCallback({mobile:'15850781443',province:'江苏',isp:'中国移动',stock:'1',amount:'10000',maxprice:'0',minprice:'0',cityname:'南京'});
    '''
    # Extract carrier
    province = data.split("province:'")[-1].split("'")[0]
    isp = data.split("isp:'")[-1].split("'")[0]
    cityname = data.split("cityname:'")[-1].split("'")[0]
    return { 'province' : province, 'isp': isp, 'cityname': cityname }

if __name__ == '__main__':
    print mobile_number_locator('15651938001')