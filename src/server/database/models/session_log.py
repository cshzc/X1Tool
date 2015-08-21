#!/usr/bin/env python
# coding:utf-8

from sqlalchemy import *
from base_model import *


class SessionLog(Model):
    __tablename__ = 'tb_session_log'

    id = Column(String(128), primary_key=True)
    #user_agent = Column(String(256), default=None)
    stime = Column(DateTime, nullable=False)
    atime = Column(DateTime, default=None)

