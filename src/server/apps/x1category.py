#!/usr/bin/env python
# -*- coding: utf-8 -*-
import logging


class X1Category(object):
    DEFAULT = 'F60009DD-FC28-4D2B-9DE0-8CDC69645AFC'
    FINANCE = 'C388A79C-8F88-4A0C-9E1C-4D73434E79AA'
    LIFE = '60AE8F8B-CE6F-4E70-AC38-B096396612E8'
    PROGRAMMER = 'C388A79C-8F88-4A0C-9E1C-4D73434E79AA'

    __id = DEFAULT
    __metadata = {'name': 'default', 'icon': 'fa-desktop'}

    def __init__(self, uid=None, metadata=None):
        if uid is not None:
            self.__id = uid
        if metadata is not None:
            self.__metadata = metadata

    def category_id(self):
        return self.__id

    def metadata(self):
        return self.__metadata

DEFAULT_X1_CATEGORY = {X1Category.DEFAULT: {'name': 'default', 'icon': 'fa-desktop'},
                       X1Category.PROGRAMMER: {'name': 'programmer', 'icon': 'fa-desktop'},
                       X1Category.FINANCE: {'name': 'finance', 'icon': 'fa-bank'},
                       X1Category.LIFE: {'name': 'life', 'icon': 'fa-coffee'}}


def get_category(uuid):
    try:
        return DEFAULT_X1_CATEGORY[uuid]
    except Exception, e:
        logging.error(str(e))

    return None

if __name__ == '__main__':
    print DEFAULT_X1_CATEGORY
    print get_category(X1Category.FINANCE)

