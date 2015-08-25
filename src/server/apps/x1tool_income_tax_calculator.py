#!/usr/bin/env python
# coding:utf-8

from x1tool import *
from utils.lib_tax_calculator import *


class X1ToolTaxCalculator(X1Tool):
    'appid: cb23bd0b08857ab32418cb5bf82381b70831cb90e183b5f62162ebd0e787c390'
    DEFAULT_METADATA = {'name': "Tax Calculator", 'author': "Ken", 'comments': "Enjoy it.", 'template': 'finance/income_tax.tpl', 'route': '/finance/income_tax/', 'category': X1Category.FINANCE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        if 'pre_tax_income' in args:
            pre_tax_income = args['pre_tax_income']
            after_tax_income = calculate_after_tax_income(pre_tax_income)
            income_tax = pre_tax_income - after_tax_income
        elif 'after_tax_income' in args:
            after_tax_income = args['after_tax_income']
            pre_tax_income = calculate_income_by_after_tax_income(after_tax_income)
            income_tax = pre_tax_income - after_tax_income
        elif 'income_tax' in args:
            income_tax = args['income_tax']
            pre_tax_income = calculate_income_by_tax(income_tax)
            after_tax_income = pre_tax_income - income_tax
        else:
            return None

        return {'pre_tax_income': pre_tax_income, 'income_tax': income_tax, 'after_tax_income': after_tax_income}


if __name__ == '__main__':
    inputs1 = {'pre_tax_income': 10000}
    inputs2 = {'income_tax': 745}
    inputs3 = {'after_tax_income': 9255}
    app = X1ToolTaxCalculator()

    print app.appid()
    print app.metadata()

    results = app.run(inputs1)
    if results is not None:
        for key in results.keys():
            print 'key=%s, value=%s' %(key, results[key])

    results = app.run(inputs2)
    if results is not None:
        for key in results.keys():
            print 'key=%s, value=%s' %(key, results[key])

    results = app.run(inputs3)
    if results is not None:
        for key in results.keys():
            print 'key=%s, value=%s' %(key, results[key])