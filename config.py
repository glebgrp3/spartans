from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '12345'
app.config['MYSQL_DATABASE_DB'] = 'fitness'
app.config['MYSQL_DATABASE_HOST'] = '77.79.191.161'
mysql.init_app(app)
