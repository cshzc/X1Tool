#!/usr/bin/env python
# coding:utf-8

import os
import re

__all__ = []
cur_path = os.path.split(os.path.realpath(__file__))[0]
for name in os.listdir(cur_path):
    if name.endswith(".py"):
        module = name[:-3]
        if re.match(r'x1tool_.*', module, re.I):
            __all__.append(module)

'''
from os.path import join, basename, splitext
import glob,imp

def importPluginModulesIn(dir):
    return dict( _load(path) for path in glob.glob(join(dir,'x1tool_*.py')) )

def test(dir):
    for name in os.listdir(dir):
        if name.endswith(".py"):
            #strip the extension
            module = name[:-3]
            # set the module name in the current global name space:
            imp.load_source(module, name)

def _load(path):
    name, ext = splitext(basename(path))
    return name, imp.load_source(name, path)

if __name__ == '__main__':
    #path = os.path.split(os.path.realpath(__file__))[0]
    #dict = importPluginModulesIn(path)
    #test(path)
'''
if __name__ == '__main__':
    print __all__
