import ipdb

import json

from flask import (
	Flask,
	send_from_directory,
	make_response
)

from flask_cors import CORS
from flask.ext import restful

from resources.employees import *
import config
from database import DatabaseConnector
from common.utils import convert_date



app = Flask(__name__, static_url_path='/../../frontapp/app/')
CORS(app, resources={r'/api/*':{"origins": '*'}}, allow_headers='Content-Type')

# TODO This should be put in the environment variable
app.config.from_object(config.DevelopmentConfig)
app.databaseconnector = DatabaseConnector(app.config)

api = restful.Api(app)

@api.representation('application/json')
def output_json(data, code, headers=None):
	resp = make_response(json.dumps(data, default=convert_date), code)
	resp.headers.extend(headers or {})
	return resp

api.add_resource(Employee, '/api/employees/', '/api/employees/<int:id>/')
api.add_resource(EmployeePositions, '/api/employeepositions/', '/api/employeepositions/<int:employee_id>/')

if __name__ == '__main__':
    app.run(debug=True)
