#!/usr/bin/env python
# coding:utf-8
import hashlib
import logging
from x1category import X1Category
TOOL_PREFIX = 'X1Tool'


class X1Tool(object):
    'appid:6376477c731a89e3280657eb88422645f2d1e2a684541222e21371f3110110d2'
    DEFAULT_METADATA = {'name': "X1Tool", 'author': "admin", 'comments': "default", 'template': "default/index.html", 'category': X1Category.DEFAULT}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA

        self.__metadata = metadata

    @classmethod
    def appid(cls):
        """per tool GUID"""
        try:
            return hashlib.sha224(cls.__name__).hexdigest()
        except Exception, e:
            logging.error('Fail to get appid: %s' % e)
            return "0000000000"

    def run(self, args):
        return args

    def metadata(self, attr_key=None, attr_value=None):
        try:
            if attr_key is None:
                return self.__metadata

            if attr_value is not None:
                self.__metadata[attr_key] = attr_value

            return self.__metadata[attr_key]

        except Exception, e:
            logging.error('Fail to set attr: %s(%s)' % (attr_key, e))

if __name__ == '__main__':
    app = X1Tool()
    print app.appid()
    print app.metadata()

