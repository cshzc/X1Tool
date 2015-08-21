# -*- coding: utf-8 -*-
from flask import Flask, render_template, request, redirect, url_for
from utils import Utils

import sys
#windows
#sys.path.append('../..')
#linux
sys.path.append('/root')

from server.x1server import *

app = Flask('X1Tool')
utils = Utils()

app.debug = True
app.static_folder = 'static'

#init x1tool server
X1Server.init_server(app)
category_list, app_list = utils.get_default_apps()

def write_log(string):
    log = open('flask.log', 'a')
    log.write(string + '\n')
    log.close()

@app.route('/')
def default():
    #return 'hello world'
    return render_template('index.tpl', utils = utils, category_list = category_list, app_list = app_list)

@app.route('/customize/', methods=['GET', 'POST'])
def customize():
    if request.method == 'GET':
        return render_template('customize.tpl')
    elif request.method == 'POST':
        if request.form['app_info']:
            ''' Parse the customize information '''
            app_info = request.form['app_info']

            ''' app should be formatted as [category_id]-[app_id] '''
            category_list, app_list = utils.get_customize_apps(app_info)

            return render_template('index.tpl', utils = utils, category_list = category_list, app_list = app_list)
        else:
            redirect(url_for('/'))

@app.route('/finance/income_tax/', methods=['GET', 'POST'])
def finance_income_tax():
    if request.method == 'GET':
        return render_template('finance/income_tax.tpl', utils = utils, category_list = category_list, app_list = app_list)
    elif request.method == 'POST':
        app_id, type, value = request.form['app_id'], request.form['type'], request.form['value']
        return utils.get_result(app_id, {str(type) : float(value)})
    else:
        redirect(url_for('/finance/income_tax/'))

@app.route('/programmer/hash/')
def programmer_hash():
    return render_template('programmer/hash.tpl', utils = utils, category_list = category_list, app_list = app_list)

@app.route('/programmer/base64/')
def programmer_base64():
    return render_template('programmer/base64.tpl', utils = utils, category_list = category_list, app_list = app_list)

@app.route('/programmer/timestamp/')
def programmer_timestamp():
    return render_template('programmer/timestamp.tpl', utils = utils, category_list = category_list, app_list = app_list)

@app.route('/programmer/crypto/')
def programmer_crypto():
    return render_template('programmer/crypto.tpl', utils = utils, category_list = category_list, app_list = app_list)

@app.route('/programmer/qrcode/', methods=['GET', 'POST'])
def programmer_qrcode():
    if request.method == 'GET':
        return render_template('programmer/qrcode.tpl', utils = utils, category_list = category_list, app_list = app_list)
    elif request.method == 'POST':
        app_id, raw = request.form['app_id'], request.form['raw']
        return utils.get_result(app_id, {'raw': raw})
    else:
        redirect(url_for('/programmer/qrcode/'))

@app.route('/life/express/', methods=['GET', 'POST'])
def life_express():
    if request.method == 'GET':
        return render_template('life/express.tpl', utils = utils, category_list = category_list, app_list = app_list)
    elif request.method == 'POST':
        app_id, com, no = request.form['app_id'], request.form['com'], request.form['no']
        return utils.get_result(app_id, {'com': str(com), 'no': str(no)})
    else:
        redirect(url_for('/life/express/'))

@app.url_value_preprocessor
def session_preprocessor(endpoint, values):
    X1Server.pre_process(request)

if __name__ == '__main__':
    app.run('0.0.0.0', 8888)
