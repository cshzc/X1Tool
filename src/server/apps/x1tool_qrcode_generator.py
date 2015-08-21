#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_qrcode import *


class X1ToolQRCodeGenerator(X1Tool):
    'appid: a3fb483cda6f212a652a0751d3cdfde333317998cbc409ea9a87b0a927b0dd56'
    DEFAULT_METADATA = {'name': "Qrcode Generator", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'programmer/qrcode.tpl', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return gen_qrcode(args['raw'])


if __name__ == '__main__':
    inputs = {'raw': 'http://www.x1tool.com'}
    app = X1ToolQRCodeGenerator()
    print app.appid()
    print app.metadata()
    print app.run(inputs)
