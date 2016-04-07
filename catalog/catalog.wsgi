# Uses code from http://stackoverflow.com/questions/13329354/flask-mod-wsgi-and-apache-importerror

import sys

sys.path.insert(0, '/var/www/html/fsndp5/catalog')
sys.path.insert(0, '/var/www/html/fsndp5')

from catalog import app as application

app.secret_key = "not_so_secret"
app.debug = True
app.config["SESSION_TYPE"] = "filesystem"
