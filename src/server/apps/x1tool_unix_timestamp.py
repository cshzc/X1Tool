#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *

class X1ToolUnixTimestamp(X1Tool):
    ''' Front end application
        ID: 7b738768ecb599379a095e96f270f7a826e8f81b95b201e6b8654e5f829c648b
    '''
    DEFAULT_METADATA = {'name': "Unix Timestamp", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/timestamp.tpl', 'route': '/programmer/timestamp/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return None

if __name__ == '__main__':
    pass
