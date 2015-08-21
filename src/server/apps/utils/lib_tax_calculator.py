#!/usr/bin/env python
# coding:utf-8

'''????=??????? - ??? - �????�?� ???? - ?????, ????????????'''
TAXABLE_BASE = 3500


def get_tax_rate_table_by_taxable(taxable):
    if taxable > 80000:
        return 0.45, 13505
    elif 80000 >= taxable > 55000:
        return 0.35, 5505
    elif 55000 >= taxable > 35000:
        return 0.3, 2775
    elif 35000 >= taxable > 9000:
        return 0.25, 1005
    elif 9000 >= taxable > 4500:
        return 0.2, 555
    elif 4500 >= taxable > 1500:
        return 0.1, 105
    elif 1500 >= taxable > 0:
        return 0.03, 0
    else:
        return 0, 0


def __calculate_tax(taxable):
    tax_table = get_tax_rate_table_by_taxable(taxable)
    return taxable * tax_table[0] - tax_table[1]


def __calculate_after_tax_income(taxable):
    return taxable + TAXABLE_BASE - __calculate_tax(taxable)


def calculate_after_tax_income(x):
    return __calculate_after_tax_income(x - TAXABLE_BASE)


def get_tax_rate_table_by_tax(x):
    if x > __calculate_tax(80000):
        return get_tax_rate_table_by_taxable(80001)
    if __calculate_tax(80000) >= x > __calculate_tax(55000):
        return get_tax_rate_table_by_taxable(80000)
    elif __calculate_tax(55000) >= x > __calculate_tax(35000):
        return get_tax_rate_table_by_taxable(55000)
    elif __calculate_tax(35000) >= x > __calculate_tax(9000):
        return get_tax_rate_table_by_taxable(35000)
    elif __calculate_tax(9000) >= x > __calculate_tax(4500):
        return get_tax_rate_table_by_taxable(9000)
    elif __calculate_tax(4500) >= x > __calculate_tax(1500):
        return get_tax_rate_table_by_taxable(4500)
    elif __calculate_tax(1500) >= x > __calculate_tax(0):
        return get_tax_rate_table_by_taxable(1500)
    else:
        return get_tax_rate_table_by_taxable(0)


def calculate_income_by_tax(x):
    tax_table = get_tax_rate_table_by_tax(x)
    if tax_table[0] <= 0:
        return 0

    return (x + tax_table[1])/tax_table[0] + TAXABLE_BASE


def get_tax_rate_table_by_after_tax_income(x):
    if x > __calculate_after_tax_income(80000):
        return get_tax_rate_table_by_taxable(80001)
    if __calculate_after_tax_income(80000) >= x > __calculate_after_tax_income(55000):
        return get_tax_rate_table_by_taxable(80000)
    elif __calculate_after_tax_income(55000) >= x > __calculate_after_tax_income(35000):
        return get_tax_rate_table_by_taxable(55000)
    elif __calculate_after_tax_income(35000) >= x > __calculate_after_tax_income(9000):
        return get_tax_rate_table_by_taxable(35000)
    elif __calculate_after_tax_income(9000) >= x > __calculate_after_tax_income(4500):
        return get_tax_rate_table_by_taxable(9000)
    elif __calculate_after_tax_income(4500) >= x > __calculate_after_tax_income(1500):
        return get_tax_rate_table_by_taxable(4500)
    elif __calculate_after_tax_income(1500) >= x > __calculate_after_tax_income(0):
        return get_tax_rate_table_by_taxable(1500)
    else:
        return get_tax_rate_table_by_taxable(0)


def calculate_income_by_after_tax_income(x):
    tax_table = get_tax_rate_table_by_after_tax_income(x)

    return (x - TAXABLE_BASE * tax_table[0] - tax_table[1])/(1 - tax_table[0])

