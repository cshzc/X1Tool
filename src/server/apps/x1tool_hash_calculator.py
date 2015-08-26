#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *

class X1ToolHashCalculator(X1Tool):
    ''' Front end application
        APPID: bcc3fa73061fbc8425befafb1dee1386ee244a60859d9e020095c039f70655bd
    '''
    DEFAULT_METADATA = {'name': "Hash Calculator", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/hash.tpl', 'route': '/programmer/hash/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return None

if __name__ == '__main__':
    pass
