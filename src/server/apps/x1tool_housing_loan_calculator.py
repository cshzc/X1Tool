#!/usr/bin/env python
# -*- coding: utf-8 -*-

from x1tool import *
from utils.lib_housing_loan import *


class X1ToolHousingLoanCalculator(X1Tool):
    'appid: 34bcca9028f2fbed7bc55e534f9296f04ee7b0553104dc80c690cfa1'
    DEFAULT_METADATA = {'name': "Housing Loan Calculator", 'author': "Ken", 'comments': "Enjoy it.", 'template': 'finance/housing_loan.tpl', 'route': '/finance/housing_loan/', 'category': X1Category.FINANCE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        commercial_loan = 0
        commercial_rate = 0
        housing_loan = 0
        housing_rate = 0
        years = 0

        print args
        if ("commercial_loan" in args) and (args["commercial_loan"] != ""):
            commercial_loan  = float(args["commercial_loan"])

        if ("commercial_rate" in args) and (args["commercial_rate"] != ""):
            commercial_rate = float(args["commercial_rate"])

        if ("housing_rate" in args) and (args["housing_rate"] != ""):
            housing_rate = float(args["housing_rate"])

        if ("housing_loan" in args) and (args["housing_loan"] != ""):
            housing_loan = float(args["housing_loan"])

        if ("years" in args) and (args["years"] != ""):
            years = int(args["years"])

            return cal_housing_loan(commercial_loan, housing_loan, commercial_rate, housing_rate, years)

if __name__ == '__main__':
    inputs = {'commercial_loan': 8554.699, 'commercial_rate': 0, 'housing_loan': 0, 'housing_rate': 0, 'years': 20}
    app = X1ToolHousingLoanCalculator()
    print app.appid()
    print app.metadata()
    print app.run(inputs)

