#!/usr/bin/env python
# coding:utf-8

from x1tool import *
from utils.lib_tax_calculator import *
from utils.lib_social_insurance_calculator import *

class X1ToolTaxCalculator(X1Tool):
    'appid: cb23bd0b08857ab32418cb5bf82381b70831cb90e183b5f62162ebd0e787c390'
    DEFAULT_METADATA = {'name': "Tax Calculator", 'author': "Ken", 'comments': "Enjoy it.", 'template': 'finance/income_tax.tpl', 'route': '/finance/income_tax/', 'category': X1Category.FINANCE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        social_insurance_enable = False
        insurance_rate_table = None
        if 'include_social_insurance' in args:
            social_insurance_enable = (args['include_social_insurance'] == '1')
            if social_insurance_enable:
                if ('rate_table' in args) and (args['rate_table'] != ""):
                    insurance_rate_table = eval(args['rate_table'])

        if 'pre_tax_income' in args:
            pre_tax_income = int(args['pre_tax_income'])
            net_income = pre_tax_income
            if social_insurance_enable:
                social_insurance_result = calculate_insurance(pre_tax_income, insurance_rate_table)
                net_income = pre_tax_income - social_insurance_result['total']

            after_tax_income = calculate_after_tax_income(net_income)
            income_tax = net_income - after_tax_income
        else:
            if 'after_tax_income' in args:
                after_tax_income = int(args['after_tax_income'])
                pre_tax_income = net_income = calculate_income_by_after_tax_income(after_tax_income)
                if social_insurance_enable:
                    social_insurance_result = calculate_insurance_by_net_income(net_income, insurance_rate_table)
                    pre_tax_income += social_insurance_result['total']

                income_tax = net_income - after_tax_income

            elif 'income_tax' in args:
                income_tax = int(args['income_tax'])
                pre_tax_income = net_income = calculate_income_by_tax(income_tax)
                if social_insurance_enable:
                    social_insurance_result = calculate_insurance_by_net_income(net_income, insurance_rate_table)
                    pre_tax_income += social_insurance_result['total']

                after_tax_income = net_income - income_tax
            else:
                return None

        if social_insurance_enable:
            return [{'pre_tax_income': pre_tax_income, 'income_tax': income_tax, 'after_tax_income': after_tax_income}, social_insurance_result]

        return [{'pre_tax_income': pre_tax_income, 'income_tax': income_tax, 'after_tax_income': after_tax_income}]


if __name__ == '__main__':
    app = X1ToolTaxCalculator()
    print app.appid()
    print app.metadata()
    inputs1 = {'pre_tax_income': 10000}
    inputs2 = {'income_tax': 745}
    inputs3 = {'after_tax_income': 9255}
    inputs4 = {'pre_tax_income':10000, 'include_social_insurance': True}
    inputs5 = {'pre_tax_income':10000, 'include_social_insurance': True, 'social_insurance_rate_table': {'subsidy': 0}}
    print app.run(inputs1)
    print app.run(inputs2)
    print app.run(inputs3)
    print app.run(inputs4)
    print app.run(inputs5)

