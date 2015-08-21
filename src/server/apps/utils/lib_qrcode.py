#!/usr/bin/env python
# -*- coding: utf-8 -*-

import uuid
import logging
import qrcode
from qrcode.image.pure import PymagingImage

def gen_qrcode(raw_data):
    ''' Generate QRCode and save PNG image to /var/www/x1tool/static/tmp folder
        Return file path to the generated QRCode image
    '''
    img = qrcode.make(raw_data, image_factory=PymagingImage)
    img_file_path = '/var/www/x1tool/static/tmp/%s.png' % uuid.uuid1().hex
    try:
        img_file = open(img_file_path, 'w')
        img.save(img_file)
        img_file.close()
    except Exception, e:
        logging.error(e)
        return None
    return {'path': img_file_path.split('x1tool')[1]}

if __name__ == '__main__':
    print gen_qrcode('http://x1tool.com')
