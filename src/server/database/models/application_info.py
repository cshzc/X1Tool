#!/usr/bin/env python
# coding:utf-8
from base_model import *
from sqlalchemy import *
import logging
import json

class ApplicationInfo(Model):
    __tablename__ = 'tb_application_info'

    id = Column(String(256), primary_key=True)
    resource = Column(String(1024), default=None)
    name = Column(String(256), default=None)
    author = Column(String(128), default=None)
    comments = Column(String(256), default=None)
    category_id = Column(String(256), ForeignKey('tb_application_category.id'))

    def serialize(self):
        try:
            metadata = {self.id: {'name': self.name, 'author': self.author, 'category': self.category_id, 'comments': self.comments}}
            if self.resource is not None:
                resource = json.loads(self.resource)
                metadata[self.id] = dict(metadata[self.id], **resource)
                return metadata
        except Exception, e:
            logging.error('%s:%s' % (self.__class__.name, str(e)))



