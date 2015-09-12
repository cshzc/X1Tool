#!/usr/bin/env python
# -*- coding: utf-8 -*-

NEWEST_RATE_COMMERCIAL = [[1, 4.6],
                          [5, 5],
                          [30, 5.15], ]

NEWEST_RATE_HOUSING_FUND = [[1, 2.75],
                            [5, 2.75],
                            [30, 3.25], ]


#等额本金
def cal_average_capital_month(loan, rate, months, cur_month=0):
    rate_month = rate/12.0 #月利率
    per_month = loan/months

    return (loan - per_month * cur_month) * rate_month + per_month


#等额本息
def cal_average_capital_interest_month(loan, rate, months):
    rate_month = rate/12.0 #月利率

    return loan * rate_month * (1 + rate_month) ** months / ((1 + rate_month) ** months - 1)


def cal_average_capital_interest(loan, rate, years):
    months = years * 12.0
    first_month = cal_average_capital_interest_month(loan, rate, months)
    diff = 0
    total = months * first_month

    return {"total": total, "first_month": first_month, "diff": diff}


def cal_average_capital_diff(loan, rate, months):
    rate_month = rate/12.0 #月利率
    per_month = loan / months

    return per_month * rate_month


def cal_average_capital(loan, rate, years):
    months = years * 12.0
    diff = cal_average_capital_diff(loan, rate, months)
    first_month = cal_average_capital_month(loan, rate, months)
    total = (2 * first_month - diff * (months - 1)) * months / 2

    return {"total": total, "first_month": first_month, "diff": diff}


def cal_housing_loan(commercial_loan, housing_loan, commercial_rate, housing_rate, years):
    commercial_details = []
    if commercial_loan > 0:
        if commercial_rate <= 0:
            commercial_rate = 0
            for item in NEWEST_RATE_COMMERCIAL:
                if years <= item[0]:
                    commercial_rate = item[1]
        commercial_rate /= 100.0
        commercial_details.append(cal_average_capital_interest(commercial_loan, commercial_rate, years))
        commercial_details.append(cal_average_capital(commercial_loan, commercial_rate, years))

    housing_details = []
    if housing_loan > 0:
        if housing_rate <= 0:
            housing_rate = 0
            for item in NEWEST_RATE_HOUSING_FUND:
                if years <= item[0]:
                    housing_rate = item[1]
        housing_rate /= 100.0
        housing_details.append(cal_average_capital_interest(housing_loan, housing_rate, years))
        housing_details.append(cal_average_capital(housing_loan, housing_rate, years))

    total_details = []
    if len(commercial_details) == 0:
        total_details = housing_details
    elif len(housing_details) == 0:
        total_details = commercial_details
    else:
        for i in range(0, 2):
            merged = dict()
            for item in commercial_details[i]:
                merged[item] = commercial_details[i][item] + housing_details[i][item]

            total_details.append(merged)

    return total_details

if __name__ == "__main__":
    print cal_housing_loan(10000, 0, 5.15, 0, 10)
    print cal_housing_loan(0, 10000, 0, 3.25, 10)
    print cal_housing_loan(1500000, 1500000, 5.15, 3.25, 10)
