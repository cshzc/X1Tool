#!/usr/bin/env python
# coding:utf-8

from x1tool import *
from utils.lib_social_insurance_calculator import *


class X1ToolSocialInsuranceCalculator(X1Tool):
    'appid: cb23bd0b08857ab32418cb5bf82381b70831cb90e183b5f62162ebd0e787c390'
    DEFAULT_METADATA = {'name': "Social Insurance Calculator", 'author': "Ken", 'comments': "Enjoy it.", 'template': 'finance/social_insurance.tpl', 'route': '/finance/social_insurance/', 'category': X1Category.FINANCE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        if 'salary' in args:
            salary = args['salary']
            rate_table = None
            if ('rate_table' in args) and (args['rate_table'] != ""):
                rate_table = eval(args['rate_table'])

            personal = calculate_insurance(salary, rate_table)
            company = calculate_insurance_company(salary, rate_table)
            return dict(personal, **company)

        return None

if __name__ == '__main__':
    inputs1 = {'salary': 7500}
    inputs2 = {'salary': 10000, 'rate_table': "{'provident': 0.08, 'subsidy': 0}"}
    app = X1ToolSocialInsuranceCalculator()
    print app.appid()
    print app.metadata()
    print app.run(inputs1)
    print app.run(inputs2)
