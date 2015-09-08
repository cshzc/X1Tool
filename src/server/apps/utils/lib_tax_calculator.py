#!/usr/bin/env python
# coding:utf-8

TAXABLE_BASE = 3500

MAX_RATE = [0.45, 13505]
MAX_TAXABLE_FLAG = 80001
TAX_RATE_TABLE = [[0, 0, 0],
                  [1500, 0.03, 0],
                  [4500, 0.1, 105],
                  [9000, 0.2, 555],
                  [35000, 0.25, 1005],
                  [55000, 0.3, 2775],
                  [80000, 0.35, 5505]]


def get_tax_rate_table_by_taxable(taxable):
    for item in TAX_RATE_TABLE:
        if taxable <= item[0]:
            return item[-2:]

    return MAX_RATE


def __calculate_tax(taxable):
    tax_table = get_tax_rate_table_by_taxable(taxable)
    return taxable * tax_table[0] - tax_table[1]


def __calculate_after_tax_income(taxable):
    return taxable + TAXABLE_BASE - __calculate_tax(taxable)


def calculate_after_tax_income(x):
    return __calculate_after_tax_income(x - TAXABLE_BASE)


def get_tax_rate_table_by_tax(x):
    for item in TAX_RATE_TABLE:
        if x < __calculate_tax(item[0]):
            return get_tax_rate_table_by_taxable(item[0])

    return MAX_RATE


def calculate_income_by_tax(x):
    tax_table = get_tax_rate_table_by_tax(x)
    if tax_table[0] <= 0:
        return 0

    return (x + tax_table[1])/tax_table[0] + TAXABLE_BASE


def get_tax_rate_table_by_after_tax_income(x):
    for item in TAX_RATE_TABLE:
        if x < __calculate_after_tax_income(item[0]):
            return get_tax_rate_table_by_taxable(item[0])

    return MAX_RATE


def calculate_income_by_after_tax_income(x):
    tax_table = get_tax_rate_table_by_after_tax_income(x)

    return (x - TAXABLE_BASE * tax_table[0] - tax_table[1])/(1 - tax_table[0])

