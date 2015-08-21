#!/usr/bin/env python
# -*- coding: utf-8 -*-
import logging

from apps.x1tool import *
from apps import *


def get_tool(appid, metadata=None):
    instance = X1Tool()
    try:
        for subclass in X1Tool.__subclasses__():
            if subclass.appid() == appid:
                instance = subclass(metadata)
                break
    except Exception, e:
        logging.error('Error:%s, invalid appid:%s' % (e, appid))

    return instance

if __name__ == '__main__':
    tool = get_tool("default")
    print tool.metadata()

    tool2 = get_tool('54d26c064ed5d2763b9ff3035ac5d0c9972d2a32f821a1bd7203cf3eb1d94ef4')
    print tool2.metadata()
    tool2.metadata('aaa', 'bbb')
    print tool2.metadata('category')
    print tool2.metadata()

    tool3 = get_tool('94f1ff870b4eb648e30a8b4f27937f986da3bc0acb79d5174cc6b69e9a7f18d0')
    print tool3.metadata()

    tool4 = get_tool('84ea691f390ef32b6e9c9ca5e4ce95b6f740ddd5a449229d63b28b5a1504fbc3', {'name': "xyz"})
    print tool4.metadata()
