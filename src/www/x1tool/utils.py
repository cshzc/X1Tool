# -*- coding: utf-8 -*-
import sys
from json import *
import logging
import datetime

#sys.path.append('/opt/x1tool')
from server.x1server import *
from server.database.database_connector import *
from flask import session
from dateutil import tz
from dateutil.tz import tzlocal

db = DBConnector(MYSQL_DATABASE_URI)

class Utils(object):
    """docstring for Utils"""
    def __init__(self):
        self._strings = {
            'finance' : u'金融',
            'programmer' : u'程序员',
            'travel' : u'旅行',
            'life' : u'生活',
            'women' : u'女性',
            'Hash Calculator' : u'Hash 计算器',
            'Base64 Calculator' : u'Base64 编解码',
            'Unix Timestamp' : u'Unix 时间戳',
            'Crypto': u'字符串加密解密',
            'Tax Calculator': u'个税计算器',
            'Express Query': u'快递查询',
            'Qrcode Generator': u'QRCode 生成器',
            'IP Locator': u'国内 IP 定位',
            'Tiny URL Generator': u'短地址生成器',
            'Code Lint': u'代码格式化',
            'Social Insurance Calculator': u'五险一金计算器',
            'Car Purchase Calculator': u'购车预算计算器',
            'Currency Convertor': u'汇率转换器',
            'Mobile Number Locator': u'手机号码归属地查询',
            'Housing Loan Calculator': u'房贷计算器',
    }

    def get_default_apps(self):

        registered_category = db.get_application_category()
        '''
        print registered_category
        [{u'60AE8F8B-CE6F-4E70-AC38-B096396612E8': {'name': u'life', u'icon': u'fa-coffee'}}, {u'C388A79C-8F88-4A0C-9E1C-4D73434E79AA': {'name': u'finance', u'icon': u'fa-bank'}}, {u'F60009DD-FC28-4D2B-9DE0-8CDC69645AFC': {'name': u'default', u'icon': u'fa-desktop'}}]
        '''
        categories = []
        applications = {}

        for category_info in registered_category:
            for category_id in category_info:
                categories.append(category_info[category_id])

                registered_apps = db.get_application(category_id=category_id)
                '''
                print registered_apps
                [{u'84ea691f390ef32b6e9c9ca5e4ce95b6f740ddd5a449229d63b28b5a1504fbc3': {'category': u'60AE8F8B-CE6F-4E70-AC38-B096396612E8', u'template': u'default/index.html', 'name': u'Express Query', 'comments': u'Enjoy it.', 'author': u'Admin'}}, {u'94f1ff870b4eb648e30a8b4f27937f986da3bc0acb79d5174cc6b69e9a7f18d0': {'category': u'60AE8F8B-CE6F-4E70-AC38-B096396612E8', u'template': u'default/index.html', 'name': u'IP Locator', 'comments': u'Enjoy it.', 'author': u'Admin'}}]
                '''
                apps_group_by_category = []
                for app_info in registered_apps:
                    for app_id in app_info:
                        apps_group_by_category.append(app_info[app_id])

                applications[category_info[category_id]['name']] = apps_group_by_category

        return [categories, applications]

    def get_customize_apps(self, app_info):
        app_list = app_info.split(';')
        for app in app_list:
            # print app
            category_id, app_id = app.split('-')
            ''' Validate category_id and app_id
                Then convert ID to string and get its template url
            '''
            # TODO
            category = category_id
            app_name = app_id
            template = 'programmer/hash.tpl'

    def get_text(self, orignal_string):
        ''' This method should be replaced by a l10n framework
        '''
        # print orignal_string
        # return orignal_string
        try:
            return self._strings[orignal_string]
        except:
            return orignal_string

    def get_result(self, app_id, args):
        return X1Server.process_request(app_id, args)

    def get_all_comments(self, app_id):
        raw_out = db.execute('SELECT name, time, comment FROM tb_comments WHERE appid = "%s" ORDER BY time DESC' % app_id)
        # UTC Zone
        from_zone = tz.gettz('UTC')
        # China Zone
        to_zone = tz.gettz('CST')
        dict_out = {}
        for i in xrange(len(raw_out)):
            row_item = []
            for item in raw_out[i]:
                # Convert datatime.datetime to date string
                if type(item) == datetime:
                    item = item.replace(tzinfo=from_zone)
                    # Convert time zone
                    local = item.astimezone(to_zone)
                    row_item.append(datetime.strftime(local, "%Y-%m-%d %H:%M:%S"))
                else:
                    row_item.append(item)
            dict_out[i] = row_item
        return JSONEncoder().encode(dict_out)

    def add_a_comment(self, app_id, comment):
        db.log_comment(app_id, comment)
        return self.get_all_comments(app_id)

    def add_donate_record(self, name, amount):
        try:
            db.log_donate(name, amount, session.sid, session['uid'])
            return '{response: success}'
        except Exception, e:
            return '{error: {0}}' % str(e)

    def get_donate_records(self):
        raw_out = db.execute('SELECT name, amount, time, status FROM tb_donate_record where (status=\'1\') or (sid=\'%s\' and uid=\'%s\')' % (session.sid, session['uid']))
        selected_data = []
        # UTC Zone
        from_zone = tz.gettz('UTC')
        # China Zone
        to_zone = tz.gettz('CST')
        STATUS_DESCRIPTION = [u"等待确认", u"打赏成功", u"打赏失败"]
        for i in xrange(len(raw_out)):
            row_item = []
            for k in xrange(len(raw_out[i])):
                item = raw_out[i][k]
        if k == 3:
            item = STATUS_DESCRIPTION[int(item)]

        # Convert datatime.datetime to date string
        if type(item) == datetime:
            item = item.replace(tzinfo=from_zone)
            # Convert time zone
            local = item.astimezone(to_zone)
            row_item.append(datetime.strftime(local, "%Y-%m-%d %H:%M:%S"))
        else:
            row_item.append(item)

            selected_data.append(row_item)

        return JSONEncoder().encode(selected_data)

    def get_admin_result(self, admin_type):
        raw_out = db.execute('SELECT * FROM tb_%s' % admin_type)
        dict_out = {}
        for i in xrange(len(raw_out)):
            row_item = []
            for item in raw_out[i]:
                # Convert datatime.datetime to date string
                if type(item) == datetime:
                    row_item.append(item.ctime())
                else:
                    row_item.append(item)
            dict_out[i] = row_item
        return JSONEncoder().encode(dict_out)

if __name__ == "__main__":
    utils = Utils()
    utils.get_donate_records()
