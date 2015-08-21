#!/usr/bin/env python
# coding:utf-8
from sqlalchemy import *
from base_model import *


class UserVisitLog(Model):
    __tablename__ = 'tb_user_visit_log'

    id = Column(Integer, primary_key=True)
    #for UV(user visit): anonymous:userid=sessionid
    uid = Column(String(256), nullable=False)
    login_time = Column(DateTime, nullable=False)
    logout_time = Column(DateTime, default=None)
    sid = Column(String(256), nullable=False)
    srcip = Column(String(128), nullable=False)
    location = Column(String(256), default=None)
