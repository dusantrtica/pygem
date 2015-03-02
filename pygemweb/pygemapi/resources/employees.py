import ipdb
from flask import request
from flask.ext import restful
from entities.models.employee import *


class Employee(restful.Resource):
    def get(self, id=None):    	
    	if id:
    		result = get_employee_by_id(id)
    	else:
    		result = get_employees()    	

    	return result

    
    def post(self, **params):
    	id = params.get('id')
    	if not id:
    		return None

    	req_dict = request.data

        print(req_dict)
