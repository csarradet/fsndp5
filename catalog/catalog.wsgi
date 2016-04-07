# Uses code from http://stackoverflow.com/questions/13329354/flask-mod-wsgi-and-apache-importerror

import sys

sys.path.insert(0, '/var/www/html/fsndp5/catalog')
sys.path.insert(0, '/var/www/html/fsndp5')

from catalog import app as application

application.secret_key = "not_so_secret"
application.debug = True
application.config["SESSION_TYPE"] = "filesystem"
