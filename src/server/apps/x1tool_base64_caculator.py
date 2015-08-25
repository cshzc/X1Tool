#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *

class X1ToolBase64Calculator(X1Tool):
    ''' Front end application
        APPID: 1e4e5a201cfc248b65d5ca4eaa26a24b45d7858fadcbc163713c46c8927e4c58
    '''
    DEFAULT_METADATA = {'name': "Base64 Calculator", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/base64.tpl', 'route': '/programmer/base64/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return None

if __name__ == '__main__':
    pass
