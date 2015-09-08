#!/usr/bin/env python
# coding:utf-8
PERSONAL_INSURANCE_RATE= {'pension': 0.08, #养老
                          'medical': 0.02, #医疗
                          'unemployment': 0.01, #失业
                          'occupational': 0, #工伤
                          'maternity': 0.01, #生育
                          'housing': 0.12, #公积金
                          'subsidy': 0.09}   #机关、事业单位住房补贴

COMPANY_INSURANCE_RATE = {'pension': 0.20, #养老
                          'medical': 0.10, #医疗
                          'unemployment': 0.01, #失业
                          'occupational': 0.005, #工伤
                          'maternity': 0.008, #生育
                          'housing': 0.12, #公积金
                          'subsidy': 0.09}   #机关、事业单位住房补贴


def calculate_insurance(salary, rate_table=None):
    salary = float(salary)
    if rate_table is None:
        rate_table = PERSONAL_INSURANCE_RATE
    result = dict()
    total = 0
    for item in PERSONAL_INSURANCE_RATE:
        result[item] = PERSONAL_INSURANCE_RATE[item] * salary
        if item in rate_table:
            rate = float(rate_table[item])
            if (rate >= 0) and (rate < 1):
                result[item] = rate * salary

        total += result[item]

    result['total'] = total

    return result


def calculate_insurance_company(salary, rate_table=None):
    salary = float(salary)
    if rate_table is None:
        rate_table = COMPANY_INSURANCE_RATE
    result = dict()
    total = 0

    for item in COMPANY_INSURANCE_RATE:
        company_item = "%s_%s" % ("company", item)
        result[company_item] = COMPANY_INSURANCE_RATE[item] * salary
        if company_item in rate_table:
            rate = float(rate_table[company_item])
            if (rate >= 0) and (rate < 1):
                result[company_item] = rate * salary

        total += result[company_item]

    result['company_total'] = total

    return result


def calculate_insurance_by_net_income(net_income, rate_table=None):
    if rate_table is None:
        rate_table = PERSONAL_INSURANCE_RATE
    total_rate = 0.0
    for item in PERSONAL_INSURANCE_RATE:
        rate = PERSONAL_INSURANCE_RATE[item]
        if item in rate_table:
            if rate_table[item] >= 0:
                 rate = rate_table[item]

        total_rate += rate
    salary = net_income/(1 - total_rate)

    return calculate_insurance(salary, rate_table)


