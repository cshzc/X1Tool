#!/usr/bin/env python
# coding:utf-8

mysql_db_config = {
    'host': 'localhost',
    'user': 'root',
    'passwd': 'trend#100',
    'db':'X1ToolDatabase',
    'charset':'utf8'
}

MYSQL_DATABASE_URI = 'mysql://%s:%s@%s/%s?charset=%s'%(mysql_db_config['user'],
                                                         mysql_db_config['passwd'],
                                                         mysql_db_config['host'],
                                                         mysql_db_config['db'],
                                                         mysql_db_config['charset'])