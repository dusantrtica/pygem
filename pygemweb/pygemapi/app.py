from flask import Flask
from flask.ext import restful
from resources.employees import Employee

app = Flask(__name__)
api = restful.Api(app)

api.add_resource(Employee, '/api/employees/', '/api/employees/<int:id>')

if __name__ == '__main__':
    app.run(debug=True)
