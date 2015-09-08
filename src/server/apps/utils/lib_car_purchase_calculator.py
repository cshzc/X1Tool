#!/usr/bin/env python
# -*- coding: utf-8 -*-
PURCHASE_TAX_RATE = 11.7
DEFAULT_LPR_INSTALLATION = 500

#车船税
MAX_VEHICLE_VESSEL_TAX = [3600, 5400]
VEHICLE_VESSEL_TAX = [[0, 0, 0],
                      [1, 60, 360],
                      [1.6, 300, 450],
                      [2.0, 360, 660],
                      [2.5, 660, 1200],
                      [3.0, 1200, 2400],
                      [4.0, 2400, 3600], ]

#车损险
MAX_DAMAGE_INSURANCE_RATE = [0.0095, 357]
CAR_DAMAGE_INSURANCE_RATE = [[6, 0.0095, 285],
                             [10, 0.0090, 342],
                             [20, 0.0095, 342], ]

#三责险
MAX_TPL_INSURANCE_FEE = [1963, 2242]
TPL_INSURANCE_FEE = [[50000, 659, 710],
                     [100000, 928, 1026],
                     [200000, 1131, 1270],
                     [500000, 1507, 1721],
                     [1000000, 1963, 2242], ]

#盗抢险
MAX_THEFT_INSURANCE_RATE = [10, 0.0044, 140]
CAR_THEFT_INSURANCE_RATE = [[6, 0.0049, 120],
                            [10, 0.0044, 140], ]


#玻璃破碎险
MAX_GLASS_BREAKAGE_INSURANCE_RATE = [0.0019, 0.0030]
GLASS_BREAKAGE_INSURANCE_RATE = [[6, 0.0019, 0.0031],
                                 [10, 0.0019, 0.0030], ]


#划痕险
MAX_CAR_DAMAGE_DW_FEE = [[2000, 850], [5000, 1100], [10000, 1500], [20000, 2250]]
CAR_DAMAGE_DW_FEE = [[300000, [[2000, 400], [5000, 570], [10000, 760], [20000, 1140]]],
                     [500000, [[2000, 585], [5000, 900], [10000, 1170], [20000, 1780]]], ]


#购置税
def calculate_purchase_tax(basic_info, args=None):
    car_price = float(basic_info['car_price'])

    return car_price/PURCHASE_TAX_RATE


#车船税
def calculate_vehicle_vessel_tax(basic_info, args=None):
    if "vehicle_vessel_tax" in basic_info:
        tax = float(basic_info["vehicle_vessel_tax"])
        if tax > 0:
            return tax

    displacement = float(basic_info['displacement'])

    for item in VEHICLE_VESSEL_TAX:
        if displacement <= item[0]:
            return item[1]

    return MAX_VEHICLE_VESSEL_TAX[0]


#交强险
def calculate_compulsory_insurance(basic_info, args=None):
    seat_count = int(basic_info['seat_count'])

    if seat_count >= 6:
        return 1100

    return 950

#商业保险计算
#三责险
def calculate_tpl_insurance(basic_info, insurance_coverage):
    seat_count = int(basic_info['seat_count'])

    index = 1 if seat_count >= 6 else 2
    price = MAX_TPL_INSURANCE_FEE[index - 1]

    if seat_count >= 6:
        for item in TPL_INSURANCE_FEE:
            if insurance_coverage == item[0]:
                price = item[index]
                break

    return price


#车损险
def calculate_car_damage_insurance(basic_info, args=None):
    car_price = float(basic_info['car_price'])
    seat_count = int(basic_info['seat_count'])

    rate = MAX_DAMAGE_INSURANCE_RATE
    for item in CAR_DAMAGE_INSURANCE_RATE:
        if seat_count < item[0]:
            rate = item[-2:]
            break

    return car_price * rate[0] + rate[1]


#盗抢险
def calculate_car_theft_insurance(basic_info, args=None):
    car_price = float(basic_info['car_price'])
    seat_count = int(basic_info['seat_count'])

    rate = MAX_THEFT_INSURANCE_RATE
    for item in CAR_THEFT_INSURANCE_RATE:
        if seat_count < item[0]:
            rate = item[-2:]
            break

    return car_price * rate[0] + rate[1]


#玻璃破碎险
def calculate_glass_breakage_insurance(basic_info, imported=False):
    car_price = float(basic_info['car_price'])
    seat_count = int(basic_info['seat_count'])

    index = 2 if imported else 1
    rate = MAX_GLASS_BREAKAGE_INSURANCE_RATE[index - 1]

    for item in GLASS_BREAKAGE_INSURANCE_RATE:
        if seat_count < item[0]:
            rate = item[index]
            break

    return car_price * rate


#自燃险
def calculate_combustion_insurance(basic_info, args=None):
    car_price = float(basic_info['car_price'])
    return car_price * 0.0015


#划痕险
def calculate_car_damage_dw(basic_info, insurance_coverage):
    car_price = float(basic_info['car_price'])
    damage_dw_fee = MAX_CAR_DAMAGE_DW_FEE

    for item in CAR_DAMAGE_DW_FEE:
        if car_price < item[0]:
            damage_dw_fee = item[1]
            break

    price = damage_dw_fee[0][1]
    for item in damage_dw_fee:
        if insurance_coverage == item[0]:
            price = item[1]
            break

    return price


#乘客座位险
def calculate_passenger_insurance(basic_info, insurance_coverage):
    seat_count = int(basic_info['seat_count'])

    cal_count = 4
    if seat_count >= 4:
        cal_count = seat_count - 1

    if seat_count < 6:
        return insurance_coverage * cal_count * 0.0027
    else:
        return insurance_coverage * cal_count * 0.0026


#司机座位险
def calculate_driver_insurance(basic_info, insurance_coverage):
    seat_count = int(basic_info['seat_count'])

    if seat_count < 6:
        return insurance_coverage * 0.0042
    else:
        return insurance_coverage * 0.004


#涉水险/发动机特别险
def calculate_engine_damage_insurance(car_damage_insurance):
    return car_damage_insurance * 0.05


#不计免赔险
def calculate_iop_insurance(car_damage_insurance, tpl_insurance):
    return (car_damage_insurance + tpl_insurance) * 0.2


def calculate_basic_cost(args):
    basic_cost = {'vehicle_vessel_tax': calculate_vehicle_vessel_tax,
                  'compulsory_insurance': calculate_compulsory_insurance,
                  'purchase_tax': calculate_purchase_tax, }

    total_fee = 0
    basic_fee = dict()
    for key in basic_cost:
        basic_fee[key] = basic_cost[key](args)
        total_fee += basic_fee[key]

    lpr_installation = DEFAULT_LPR_INSTALLATION
    if 'lpr_installation' in args:
        lpr_installation = float(args['lpr_installation'])

    basic_fee['lpr_installation'] = lpr_installation
    total_fee += lpr_installation
    basic_fee['total_basic'] = total_fee

    return basic_fee


def calculate_commercial_insurance_cost(args):
    commercial_insurance = {'tpl': calculate_tpl_insurance,
                            'car_damage': calculate_car_damage_insurance,
                            'car_theft': calculate_car_theft_insurance,
                            'glass_breakage': calculate_glass_breakage_insurance,
                            'car_damage_dw': calculate_car_damage_dw,
                            'combustion': calculate_combustion_insurance,
                            'driver': calculate_driver_insurance,
                            'passenger': calculate_passenger_insurance, }
    total_fee = 0
    commercial_insurance_fee = dict()
    for key in commercial_insurance:
        if key in args:
            commercial_insurance_fee[key] = (commercial_insurance[key](args, int(args[key])))
            total_fee += commercial_insurance_fee[key]
        else:
            commercial_insurance_fee[key] = 0

    if 'iop' in args:
        commercial_insurance_fee['iop'] = (calculate_iop_insurance(commercial_insurance_fee['car_damage'], commercial_insurance_fee['tpl']))
        total_fee += commercial_insurance_fee['iop']
    else:
        commercial_insurance_fee['iop'] = 0

    if 'engine_damage' in args:
        commercial_insurance_fee['engine_damage'] = calculate_engine_damage_insurance(commercial_insurance_fee['car_damage'])
    else:
        commercial_insurance_fee['engine_damage'] = 0

    commercial_insurance_fee['total_commercial'] = total_fee

    return commercial_insurance_fee


if __name__ == '__main__':
    basic_info = {'seat_count': 5, 'car_price': 230000, 'displacement': 2.4}

    imported = True
    passenger_coverage = 10000
    driver_coverage = 10000
    damage_dw_coverage = 10000
    tpl_coverage = 1000000

    print "=========== Basic Fee ==========="
    print "purchase tax: %s" % calculate_purchase_tax(basic_info)
    print "vehicle and vessel tax: %s" % calculate_vehicle_vessel_tax(basic_info)
    print "compulsory insurance: %s" % calculate_compulsory_insurance(basic_info)

    print "=========== Commercial Insurance ==========="
    print "driver insurance: %s" % calculate_driver_insurance(basic_info, driver_coverage)
    print "passenger insurance: %s" % calculate_passenger_insurance(basic_info, passenger_coverage)
    print "car damage DW: %s" % calculate_car_damage_dw(basic_info, damage_dw_coverage)
    print "car damage: %s" % calculate_car_damage_insurance(basic_info)
    print "TPL: %s" % calculate_tpl_insurance(basic_info, tpl_coverage)
    print "IOP: %s" % calculate_iop_insurance(calculate_car_damage_insurance(basic_info), calculate_tpl_insurance(basic_info, tpl_coverage))
    print "engine damage: %s" % calculate_engine_damage_insurance(calculate_car_damage_insurance(basic_info))
    print "combustion: %s" % calculate_combustion_insurance(basic_info)
    print "glass breakage: %s" % calculate_glass_breakage_insurance(basic_info, imported)
    print "car theft insurance %s" % calculate_car_theft_insurance(basic_info)




