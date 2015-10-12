#!/usr/bin/env python
# coding:utf-8
from base_model import *
from sqlalchemy import *
import logging
import json

class Comments(Model):
    __tablename__ = 'tb_comments'

    id = Column(Integer, primary_key=True, nullable=False)
    name = Column(String(255), default=None)
    time = Column(DateTime, nullable=False)
    appid = Column(String(255), ForeignKey("tb_application_info.id"), default=None)
    uid = Column(String(255), default=None)
    comment = Column(String(4095), nullable=False)