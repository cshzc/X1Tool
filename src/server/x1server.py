#!/usr/bin/env python
# coding:utf-8

from database.database_connector import *
from json import *
from datetime import *
from tool_factory import *
from flask import session
from flask_session import *
from apps.x1category import *
from apps.utils.lib_locate_ip import *
ANONYMOUS_TAG = "anony_"

mysql_db_config = {
    'host': 'localhost',
    'user': 'root',
    'passwd': '',
    'db': 'X1ToolDatabase',
    'charset': 'utf8'
}

MYSQL_DATABASE_URI = 'mysql://%s:%s@%s/%s?charset=%s' % (mysql_db_config['user'],
                                                         mysql_db_config['passwd'],
                                                         mysql_db_config['host'],
                                                         mysql_db_config['db'],
                                                         mysql_db_config['charset'])
g_db_connector = None


class X1Server(object):
    @staticmethod
    def register_categories():
        for category_id in DEFAULT_X1_CATEGORY:
            try:
                g_db_connector.register_category(category_id, DEFAULT_X1_CATEGORY[category_id])
            except Exception, e:
                logging.error('Database: %s' % str(e))

    @staticmethod
    def auto_register_applications(cls=X1Tool):
        X1Server.register_categories()
        for subclass in cls.__subclasses__():
            try:
                instance = subclass()
                g_db_connector.register_application(instance.appid(), instance.metadata())
            except Exception, e:
                logging.error('Database: %s' % str(e))

    @staticmethod
    def process_login(user_id, ip, address=None):
        try:
            session_id = session.sid
            if user_id is None:
                #need login or annoymous
                user_id = ANONYMOUS_TAG + session_id
                session['uid'] = user_id

            if address is None:
                #get address from ip
                address = "nanjing"

            try:
                g_db_connector.log_user_login(user_id, session_id, ip, address)
            except Exception, e:
                logging.error('Database: %s' % str(e))

        except Exception, e:
            logging.error(str(e))

    @staticmethod
    def init_server(app):
        try:
            app.secret_key = 'F12Zr47j\3yX R~X@H!jmM]Lwf/,?KT'
            app.config['SESSION_TYPE'] = 'filesystem'
            Session(app)

            try:
                global g_db_connector
                g_db_connector = DBConnector(MYSQL_DATABASE_URI)
                g_db_connector.create_db()
                X1Server.auto_register_applications()
            except Exception, e:
                logging.error('Database: %s' % str(e))

        except Exception, e:
            logging.error(str(e))
            return None

    @staticmethod
    def pre_process(request):
        try:
            session_id = session.sid
            print session_id
            try:
                g_db_connector.log_session(session_id)
            except Exception, e:
                logging.error('Database: %s' % str(e))

            user_id = session.get('uid', None)
            if user_id is None:
                addr = None
                try:
                    srcip = request.remote_addr
                    addr = get_formatted_location(srcip)
                except Exception, e:
                    logging.error('Database: %s' % str(e))

                X1Server.process_login(user_id, srcip, addr)
        except Exception, e:
            logging.error(str(e))

    @staticmethod
    def process_request(appid, args):
        try:
            start_time = datetime.utcnow()
            result = get_tool(appid).run(args)
            end_time = datetime.utcnow()
            # print result
            inputs = JSONEncoder().encode(args)
            outputs = None
            if result is not None:
                outputs = JSONEncoder().encode(result)

            session_id = session.sid
            user_id = session.get('uid', None)

            try:
                g_db_connector.log_application_usage(appid, session_id, user_id, start_time, end_time, inputs, outputs)
            except Exception, e:
                logging.error(str(e))

            return outputs
        except Exception, e:
            logging.error(str(e))
            return None


if __name__ == '__main__':

    from flask import Flask
    from flask import request

    app = Flask('X1Tool')
    app.debug = True
    X1Server.init_server(app)

    @app.route('/')
    def default():
        return 'hello world'

    @app.url_value_preprocessor
    def session_preprocessor(endpoint, values):
        X1Server.pre_process(request)

    app.run('0.0.0.0', 58888)

