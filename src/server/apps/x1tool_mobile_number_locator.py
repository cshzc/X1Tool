#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_mobile_number_locator import *

class X1ToolMobileNumberLocator(X1Tool):
    '''appid = ea2b859c77d9c4c31776a2a2c6d4864b9f50ab228daa0cadc41ba9cf
    '''
    DEFAULT_METADATA = {'name': "Mobile Number Locator", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'life/mobile_number_locator.tpl', 'route': '/life/mobile_number_locator/', 'category': X1Category.LIFE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return mobile_number_locator(args['mobile_number'])

if __name__ == '__main__':
    inputs = {'mobile_number': '15651938002'}
    app = X1ToolMobileNumberLocator()
    print app.appid()
    print app.metadata()
    print app.run(inputs)
