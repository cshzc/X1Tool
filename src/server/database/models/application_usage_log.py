#!/usr/bin/env python
# coding:utf-8

from sqlalchemy import *
from base_model import *


class ApplicationUsageLog(Model):
    __tablename__ = 'tb_application_usage_log'

    '''session recording'''
    id = Column(Integer, primary_key=True)
    sid = Column(String(255), ForeignKey("tb_session_log.id"))
    appid = Column(String(255), ForeignKey("tb_application_info.id"))
    uid = Column(String(255))
    inputs = Column(String(1024), default=None)
    outputs = Column(String(1024), nullable=False)
    stime = Column(DateTime, nullable=False)
    etime = Column(DateTime, nullable=False)
