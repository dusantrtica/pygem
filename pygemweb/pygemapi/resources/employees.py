import pdb
from flask import request
from flask.ext import restful


class Employee(restful.Resource):
    def get(self, id=None):
        print(id)
        return {'employeefirstname': 'Petar','employeesurname':'Petrovic'}
    
    def post(self, **params):
    	id = params.get('id')
    	if not id:
    		return None

    	req_dict = request.data

        print(req_dict)
