#!/usr/bin/env python
# coding:utf-8

from x1tool import *
from utils.lib_car_purchase_calculator import *


class X1ToolCarPurchaseCalculator(X1Tool):
    'appid: 96da1eec94c9f3ae273d90799802f6cbe73caea5bbb6243b6d2b89ba'
    DEFAULT_METADATA = {'name': "Car Purchase Calculator", 'author': "Ken", 'comments': "Enjoy it.", 'template': 'finance/car_purchase.tpl', 'route': '/finance/car_purchase/', 'category': X1Category.FINANCE}

    def __init__(self, metadata=None):
        if metadata is None:
            metadata = self.DEFAULT_METADATA
        super(self.__class__, self).__init__(metadata)

    def run(self, args):
        print args
        basic_fee = calculate_basic_cost(args)
        commercial_fee = calculate_commercial_insurance_cost(args)

        return dict(basic_fee, **commercial_fee)

if __name__ == '__main__':
    imported = True
    passenger_coverage = 10000
    driver_coverage = 10000
    damage_dw_coverage = 10000
    tpl_coverage = 1000000

    inputs1 = {'car_price': 230000,
               'displacement': 2.4,
                'seat_count': 5,
                'lpr_installation': 500,
                'tpl': tpl_coverage,
                'car_damage': 0,
                'iop': 0,
                'car_theft': 0,
                'glass_breakage': imported,
                'car_damage_dw': damage_dw_coverage,
                'engine_damage': 0,
                'combustion': 0,
                'passenger': passenger_coverage,
                'driver': driver_coverage, }

    app = X1ToolCarPurchaseCalculator()
    print app.appid()
    print app.metadata()
    print app.run(inputs1)


