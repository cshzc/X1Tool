#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_locate_ip import *


class X1ToolIPLocator(X1Tool):
    'appid: 757d3ccedd69901b0999313494224e5ffaaa0653635bd9629af0cfc03faa8c67'
    DEFAULT_METADATA = {'name': "IP Locator", 'author': "Admin", 'comments': "Enjoy it.", 'template': "index.tpl", 'route': '/programmer/ip_locator/', 'category': X1Category.PROGRAMMER}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return ip_location(args['ip'])

if __name__ == '__main__':
    inputs = {'ip': '121.40.170.183'}
    app = X1ToolIPLocator()
    print app.appid()
    print app.metadata()
    print app.run(inputs)