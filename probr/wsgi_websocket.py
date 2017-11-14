__author__ = 'ale'

import gevent.socket
import redis.connection
redis.connection.socket = gevent.socket

import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "probr.base_settings")

from ws4redis.uwsgi_runserver import uWSGIWebsocketServer
application = uWSGIWebsocketServer()