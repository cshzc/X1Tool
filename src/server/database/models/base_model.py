#!/usr/bin/env python
# coding:utf-8
from sqlalchemy.ext.declarative import declarative_base

Model = declarative_base()
'''
class ModelTableNameDescriptor(object):
    def __get__(self, obj, type):
        tablename = type.__dict__.get('__tablename__')
        if not tablename:
            tablename = _get_table_name(type.__name__)
            setattr(type, '__tablename__', tablename)
        return tablename

class Model(object):
    """Baseclass for custom user models.
    """
    __tablename__ = ModelTableNameDescriptor()

    def __iter__(self):
        """Returns an iterable that supports .next()
        so we can do dict(sa_instance).
        """
        for k in self.__dict__.keys():
            if not k.startswith('_'):
                yield (k, getattr(self, k))

    def __repr__(self):
        return '<%s>' % self.__class__.__name__


def _get_table_name(classname):
    return inflection.pluralize(inflection.underscore(classname))
'''