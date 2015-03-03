import ipdb
from flask import Flask, send_from_directory
from flask.ext import restful
from resources.employees import Employee
import config
import ipdb
from database import DatabaseConnector
from flask_cors import CORS


app = Flask(__name__, static_url_path='/../../frontapp/app/')
CORS(app, resources={r'/api/*':{"origins": '*'}}, allow_headers='Content-Type')

# TODO This should be put in the environment variable
app.config.from_object(config.DevelopmentConfig)
app.databaseconnector = DatabaseConnector(app.config)

api = restful.Api(app)

api.add_resource(Employee, '/api/employees/', '/api/employees/<int:id>')

if __name__ == '__main__':
    app.run(debug=True)
