#!/usr/bin/env python
# coding:utf-8
from base_model import *
from sqlalchemy import *
import json
import logging


class ApplicationCategory(Model):
    __tablename__ = 'tb_application_category'

    id = Column(String(256), primary_key=True)
    name = Column(String(256), default=None)
    ''' icon resource path'''
    resource = Column(String(1024), default=None)

    def serialize(self):
        try:
            metadata = {self.id: {'name': self.name}}
            if self.resource is not None:
                resource = json.loads(self.resource)
                metadata[self.id] = dict(metadata[self.id], **resource)
        except Exception, e:
                logging.error('%s:%s' % (self.__class__.name, str(e)))

        return metadata

