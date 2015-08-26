#!/usr/bin/python
# -*- coding: utf-8 -*-
from flup.server.fcgi import WSGIServer
from x1tool import X1Tool

if __name__ == '__main__':
    WSGIServer(X1Tool).run()
