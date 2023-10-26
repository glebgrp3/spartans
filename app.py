from flask import Flask
from flasgger import Swagger, swag_from

app = Flask(__name__)
Swagger(app)
