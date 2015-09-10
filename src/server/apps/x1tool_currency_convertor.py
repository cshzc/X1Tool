#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_currency_converter import *


class X1ToolCurrencyConvertor(X1Tool):
    'appid: b2f405a9ebadca776037a1de44d741596823ea91540c24a534e38cacd45b68e7'
    DEFAULT_METADATA = {'name': "Currency Convertor", 'author': "Ken", 'comments': "Enjoy it.", 'template': 'finance/currency_convertor.tpl', 'route': '/finance/currency_convertor/', 'category': X1Category.FINANCE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        print args
        if ('from_tkc' in args) and ('to_tkc' in args):
                if 'amount' in args:
                    return currency_query(args['from_tkc'], args['to_tkc'], float(args['amount']))

        return 0

if __name__ == '__main__':
    inputs = {'from_tkc': 'USD', 'to_tkc': 'CNY', 'amount': 100}
    app = X1ToolCurrencyConvertor()
    print app.appid()
    print app.metadata()
    print app.run(inputs)

