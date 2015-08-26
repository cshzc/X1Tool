# -*- coding: utf-8 -*-
import sys
sys.path.append('/opt/x1tool')

from flask import Flask, render_template, request, redirect, url_for
from utils import Utils

# Import server modules
from server.x1server import *

X1Tool = Flask('X1Tool')
utils = Utils()

X1Tool.debug = True
X1Tool.static_folder = 'static'

#init x1tool server
X1Server.init_server(X1Tool)
category_list, app_list = utils.get_default_apps()
# Create template data
tpl_data = {
    'category_list': category_list,
    'app_list': app_list,
    'utils': utils
}
# print category_list
# print app_list

def write_log(string):
    log = open('flask.log', 'a')
    log.write(string + '\n')
    log.close()

''' Wrapper of render_template
'''
def render_x1_template(tpl = 'index.tpl', tpl_data = tpl_data):
    return render_template(tpl, tpl_data = tpl_data)

@X1Tool.route('/')
def default():
    return render_x1_template('index.tpl')

@X1Tool.route('/customize/', methods=['GET', 'POST'])
def customize():
    if request.method == 'GET':
        return render_x1_template('customize.tpl')
    elif request.method == 'POST':
        if request.form['app_info']:
            ''' Parse the customize information '''
            app_info = request.form['app_info']

            ''' app should be formatted as [category_id]-[app_id] '''
            category_list, app_list = utils.get_customize_apps(app_info)

            return render_x1_template('index.tpl')
        else:
            redirect(url_for('/'))

def request_handler():
    request_path = request.path
    category, app = request_path.strip('/').split('/')
    if request.method == 'GET':
        return render_x1_template('/%s/%s.tpl' % (category, app))
    else:
        post_data = dict((key, request.form.getlist(key)[0]) for key in request.form.keys())
        app_id = post_data.pop('app_id')
        return utils.get_result(app_id, post_data)

for (category_name, category) in app_list.items():
    for app_info in category:
        X1Tool.add_url_rule(app_info['route'], view_func = request_handler, methods=['GET', 'POST'])

# @X1Tool.url_value_preprocessor
# def session_preprocessor(endpoint, values):
#     X1Server.pre_process(request)

if __name__ == '__main__':
    X1Tool.run('0.0.0.0', 8080)
