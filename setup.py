#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import shutil
import time
from uuid import uuid4

HOME_DIR = os.environ.get('HOME', None)
BACKUP_DIR = os.path.join(HOME_DIR, '.backup')
CURRENT_DIR = os.path.dirname(os.path.realpath(__file__))
CONFIG_FILE_DIR = os.path.join(CURRENT_DIR, 'configs')
SEEDS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
CURRENT_DATE = time.strftime('%Y%m%d')
CURRENT_TIME = "%s-%s" % (time.strftime('%H%M%S'), str(time.clock()).strip('0.'))

if HOME_DIR is None:
    sys.exit('Home dir is not set')
if not os.path.isdir(BACKUP_DIR):
    os.mkdir(BACKUP_DIR)


def log(string):
    sys.stdout.write("%s\n" % string)


def mklink(target=None, link_name=None):
    if target is None or link_name is None:
        return False
    command = 'ln -s %s %s 2> /dev/null' % (target, link_name)
    log(command)
    ret = os.system(command)
    if ret != 0:
        log('Error %s' % command)
    return True


def get_random_str(length=8):
    return ''.join([random.choice(SEEDS) for _ in range(length)])


def get_current_date():
    return time.strftime('%Y%m%d')


def get_current_time():
    return "%s-%s" % (time.strftime('%H%M%S'), str(time.clock()).strip('0.'))


def backup(file_path):
    file_struct = os.path.split(file_path)
    filename = file_struct[1]
    if not filename:
        return None
    # file is hidden
    if filename.startswith('.'):
        filename = filename.lstrip('.')
    top_dir = CURRENT_DATE
    sub_dir = CURRENT_TIME
    real_backup_dir = os.path.join(BACKUP_DIR, top_dir, sub_dir)
    if not os.path.exists(real_backup_dir):
        os.makedirs(real_backup_dir)
    shutil.move(file_path, os.path.join(real_backup_dir, filename))

if __name__ == '__main__':
    for config_file in os.listdir(CONFIG_FILE_DIR):
        config_file_path = os.path.join(CONFIG_FILE_DIR, config_file)
        real_config_file_path = os.path.join(HOME_DIR, '.%s' % config_file)
        if os.path.exists(real_config_file_path):
            backup(real_config_file_path)
        if os.path.isfile(config_file_path):
            mklink(config_file_path, os.path.join(HOME_DIR, '.%s' % config_file))
        elif os.path.isdir(config_file_path):
            mklink(config_file_path, os.path.join(HOME_DIR, '.%s' % config_file))

