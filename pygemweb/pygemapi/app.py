import pdb
from flask import Flask
from flask.ext import restful
from resources.employees import Employee
import config
import ipdb
from database import DatabaseConnector


app = Flask(__name__)
# TODO This should be put in the environment variable
app.config.from_object(config.DevelopmentConfig)
app.databaseconnector = DatabaseConnector(app.config)

api = restful.Api(app)

api.add_resource(Employee, '/api/employees/', '/api/employees/<int:id>')

if __name__ == '__main__':
    app.run(debug=True)
