#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *

class X1ToolCrypto(X1Tool):
    ''' Front end application
        APPID: 746509fdd1845ca7f436b8567edc99fcd3cef90e44f1b29d7391c8d4e7e91eea
    '''
    DEFAULT_METADATA = {'name': "Crypto", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/crypto.tpl', 'route': '/programmer/crypto/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return None

if __name__ == '__main__':
    pass
