#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *

class X1ToolJSLint(X1Tool):
    ''' Front end application
        APPID: 6e6189a5c33758c0dd015228d70f0f2a8952fae9e9b44fc7db07e478b7ed0023
    '''
    DEFAULT_METADATA = {'name': "Code Lint", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/code_lint.tpl', 'route': '/programmer/code_lint/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return None

if __name__ == '__main__':
    pass
