#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_tinyurl import *

class X1ToolTinyUrlGenerator(X1Tool):
    'appid: 57587330fd11a1f14cd1a2bb1022638d7c66427ae7102b453ae27385fce6d396'
    DEFAULT_METADATA = {'name': "Tiny URL Generator", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/tinyurl.tpl', 'route': '/programmer/tinyurl/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return gen_tinyurl(args['type'], args['raw_url'])

if __name__ == '__main__':
    inputs = {'type': 'baidu', 'raw_url': 'www.x1tool.com'}
    app = X1ToolTinyUrlGenerator()
    print app.appid()
    print app.metadata()
    print app.run(inputs)