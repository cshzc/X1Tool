#!/usr/bin/env python
# coding:utf-8
PERSONAL_INSURANCE_RATE= {'pension': 0.08, #养老
                          'medical': 0.02, #医疗
                          'unemployment': 0.01, #失业
                          'occupational': 0, #工伤
                          'maternity': 0.01, #生育
                          'housing': 0.12, #公积金
                          'subsidy': 0.09}   #机关、事业单位住房补贴


def calculate_insurance(salary, rate_table=None):
    salary = float(salary)
    if rate_table is None:
        rate_table = PERSONAL_INSURANCE_RATE
    result = dict()
    total = 0
    for item in PERSONAL_INSURANCE_RATE:
        print item
        result[item] = PERSONAL_INSURANCE_RATE[item] * salary
        if item in rate_table:
            rate = float(rate_table[item])
            print rate
            if (rate >= 0) and (rate < 1):
                result[item] = rate * salary

        total += result[item]

    result['total'] = total
    print result

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

'''
{
bc_provident_fund_spread: 0
fertility_company_spread: 0.8
fertility_max: 12648
fertility_min: 2530
fertility_spread: 0
injury_company_spread: 0
injury_max: 12648
injury_min: 2530
injury_spread: 0
instruction: ""
instruction_url: ""
major_medical_company_spread: 0
major_medical_max: 0
major_medical_min: 0
major_medical_spread: 0
medical_company_spread: 6
medical_max: 12648
medical_min: 2530
medical_sh_company_spread: 0
medical_sh_max: 0
medical_sh_min: 0
medical_sh_spread: 0
medical_spread: 2
medical_value_added: 0
min_wave: 1390
new_data: 0
pension_company_spread: 20
pension_max: 11556
pension_min: 2312
pension_sh_company_spread: 0
pension_sh_max: 0
pension_sh_min: 0
pension_sh_spread: 0
pension_spread: 8
provident_fund_2_company_spread: 0
provident_fund_2_max: 0
provident_fund_2_min: 0
provident_fund_2_spread: 0
provident_fund_company_spread: 12
provident_fund_max: 16000
provident_fund_min: 1083
provident_fund_spread: 12
unemployment_company_spread: 1.5
unemployment_max: 11556
unemployment_min: 2312
unemployment_spread: 0.5
}
'''