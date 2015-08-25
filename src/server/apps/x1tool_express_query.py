#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_express_query import *

class X1ToolExpressQuery(X1Tool):
    'appid: b2f405a9ebadca776037a1de44d741596823ea91540c24a534e38cacd45b68e7'
    DEFAULT_METADATA = {'name': "Express Query", 'author': "Admin", 'comments': "Enjoy it.", 'template': 'life/express.tpl', 'route': '/life/express/', 'category': X1Category.LIFE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        return express_query(args['com'], args['no'])


if __name__ == '__main__':
    inputs = {'com': 'zto', 'no': '718862510570'}
    app = X1ToolExpressQuery()
    print app.appid()
    print app.metadata()
    print app.run(inputs)

