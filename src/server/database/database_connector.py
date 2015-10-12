#!/usr/bin/env python
# coding:utf-8

from models.application_info import *
from models.session_log import *
from models.application_usage_log import *
from models.use_visity_log import *
from models.application_category import *
from models.donate_record import *
from models.comments import *

from datetime import *
from sqlalchemy import *
from sqlalchemy.orm import *
from json import *
import logging


class DBConnector(object):
    __session_maker = None
    __scope_session = None
    __model = None
    __engine = None

    def __init__(self, connect_string):
        """initialize"""
        """self._engine = engine.create_engine(url, pool_size=pool_size, pool_recycle=3600,
                    max_overflow=sys.maxsize)"""

        self.__engine = create_engine(connect_string, echo=False)
        self.__session_maker = sessionmaker()
        self.__session_maker.configure(bind=self.__engine)
        self.__scope_session = self.__session_maker()

    def create_db(self):
        Model.metadata.create_all(self.__engine)

    def drop_db(self):
        Model.metadata.drop_all(self.__engine)

    def get_record(self, classname, format_method=None, **conditions):
        items = None
        try:
            items = self.__scope_session.query(classname).filter_by(**conditions).all()

            if format_method is None:
                return items

            item_list = list()
            for item in items:
                try:
                    item_list.append(format_method(item))
                except:
                    pass

            return item_list
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

        return items

    def get_application(self, **filter_condition):
        return self.get_record(ApplicationInfo, lambda app: app.serialize(),  **filter_condition)

    def get_application_category(self, **filter_condition):
        return self.get_record(ApplicationCategory, lambda category: category.serialize(), **filter_condition)

    def register_category(self, category_id, metadata):
        try:
            category = self.__scope_session.query(ApplicationCategory).filter_by(id=category_id).first()

            if category is None:
                category = ApplicationCategory()
                self.__scope_session.add(category)

            category.id = category_id
            category.name = metadata.pop('name')
            if category is not None:
                category.resource = JSONEncoder().encode(metadata)

            self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

    #registry or update
    def register_application(self, appid, metadata):
        try:
            app = self.__scope_session.query(ApplicationInfo).filter_by(id=appid).first()

            if app is None:
                app = ApplicationInfo()
                self.__scope_session.add(app)

            app.id = appid
            app.name = metadata.pop('name')
            app.author = metadata.pop('author')
            app.comments = metadata.pop('comments')
            app.category_id = metadata.pop('category')
            if metadata is not None:
                app.resource = JSONEncoder().encode(metadata)

            self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

    def log_application_usage(self, application_id, session_id, user_id, start_time, end_time, args, results):
        try:
            application_usage_log = ApplicationUsageLog(appid=application_id, sid=session_id, uid=user_id, stime=start_time, etime=end_time, inputs=args, outputs=results)
            self.__scope_session.add(application_usage_log)

            self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

    def log_user_login(self, user_id, session_id, ip, address):
        try:
            utc_time = datetime.utcnow()
            login_info = self.__scope_session.query(UserVisitLog).filter_by(uid=user_id, sid=session_id, logout_time=None).order_by(desc(UserVisitLog.login_time)).first()
            if login_info is not None:
                #print login_info
                diff = utc_time - login_info.login_time
                if diff.total_seconds() < (12 * 3600):
                    return

            user_visit_log = UserVisitLog(uid=user_id, sid=session_id, srcip=ip, location=address, login_time=utc_time)
            self.__scope_session.add(user_visit_log)

            self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

    def log_user_logout(self, user_id, session_id):
        try:
            user_visit_log = self.__scope_session.query(UserVisitLog).filter_by(uid=user_id, sid=session_id).one()
            utc_time = datetime.utcnow()
            user_visit_log.logout_time = utc_time

            self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

    def log_session(self, session_id):
        try:
            session_log = self.__scope_session.query(SessionLog).filter_by(id=session_id).first()

            if session_log is None:
                start_time = datetime.utcnow()
                session_log = SessionLog(id=session_id, stime=start_time, atime=start_time)
                self.__scope_session.add(session_log)
            else:
                active_time = datetime.utcnow()
                session_log.atime = active_time

            self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()

    def log_comment(self, name, app_id, comment):
        try:
            commnet_log = Comments(name=name, time=datetime.utcnow(), appid=app_id, comment=comment)
            self.__scope_session.add(commnet_log)
            self.__try_commit()
        except Exception, e:
            print e
            logging.error(str(e))
            self.__scope_session.rollback()

    def log_donate(self, real_name, donate_amount, session_id, user_id, cur_status=0):
        print real_name
    
        try:
            record_time = datetime.utcnow()
            max_records_per_period = 5
            donate_interval = 1 * 3600
            donate_records = self.__scope_session.query(DonateRecord).filter_by(uid=user_id, sid=session_id).order_by(desc(DonateRecord.time)).limit(max_records_per_period).all()
                print donate_records
            override = False
            count = len(donate_records)
            if (donate_records is not None) and (count > 0):
               count = len(donate_records)
               donate_record = donate_records[0]
               diff = (record_time - donate_record.time).total_seconds()
               if (diff < donate_interval):
              if diff <= 20:
                 override = True
              else:
                  if (count >= max_records_per_period):
                 donate_record = donate_records[-1]
                     if (record_time - donate_record.time).total_seconds() < donate_interval:
                        override = True
    
            print override          
            if override:
               donate_record.name = real_name
               donate_record.amount = donate_amount
               donate_record.time = record_time    
                   donate_record.status = cur_status
            else:
                   donate_record = DonateRecord(name=real_name, amount=donate_amount, time=record_time, sid=session_id, uid=user_id, status=cur_status)
                   self.__scope_session.add(donate_record)
            
                self.__try_commit()
        except Exception, e:
            logging.error(str(e))
            self.__scope_session.rollback()
                
    def execute(self, sql_commands):
        return self.__session_maker().execute(sql_commands).fetchall()

    def __try_commit(self):
        try:
            self.__scope_session.flush()
            self.__scope_session.commit()
        except Exception, e:
            logging.error('Database: %s' % str(e))
            self.__scope_session.rollback()


if __name__ == '__main__':
    mysql_db_config = {
        'host': 'localhost',
        'user': 'root',
        'passwd': '',
        'db': 'TestX1Tool',
        'charset': 'utf8'
    }
    MYSQL_DATABASE_URI = 'mysql://%s:%s@%s/%s?charset=%s'%(mysql_db_config['user'],
                                                         mysql_db_config['passwd'],
                                                         mysql_db_config['host'],
                                                         mysql_db_config['db'],
                                                         mysql_db_config['charset'])
    import sys
    SRCROOT = '/root'
    sys.path.append(SRCROOT)
    from server.apps.x1tool_income_tax_calculator import *
    from server.apps.x1tool import *
    db_connector = DBConnector(MYSQL_DATABASE_URI)
    #db_connector.drop_db()
    db_connector.create_db()

    print db_connector.execute('select * from tb_session_log')


    from server.apps.x1category import *
    db_connector.register_category(X1Category.FINANCE, get_category(X1Category.FINANCE))

    db_connector.register_category(X1Category.DEFAULT, get_category(X1Category.DEFAULT))

    print db_connector.get_application_category()

    db_connector.register_application(X1Tool.appid(), X1Tool.DEFAULT_METADATA)
    db_connector.register_application(X1Tool_d524bbf3215305aa5c0cd189955a760f7258fe5a.appid(), X1Tool_d524bbf3215305aa5c0cd189955a760f7258fe5a.DEFAULT_METADATA)


    print db_connector.get_application(id=X1Tool.appid())
    print db_connector.get_application(category_id=X1Category.FINANCE)
    print db_connector.get_application(category_id=X1Category.DEFAULT)
    print db_connector.get_application()
    session_id = "00-000-00000-00000000"
    user_id = "anony_007"
    ip = '192.168.1.1'
    address = 'nanjing'

    db_connector.log_session(session_id)

    db_connector.log_user_login(user_id, session_id, ip, address)

    #db_connector.log_user_logout(user_id, session_id)

    db_connector.log_application_usage(X1Tool.appid(), session_id, user_id, datetime.utcnow(), datetime.utcnow(), "{income:20000}", "{tax:3000}")
    
    db_connector.log_donate("Tom", "100", session_id, user_id)
    
