import ipdb
from flask import request
from flask.ext import restful
from flask.ext.cors import cross_origin
from entities.models.employee import *


class Employee(restful.Resource):    
    def get(self, id=None):    	
    	if id:
    		result = get_employee_by_id(id)
    	else:
            # TODO: here goes pagination
    		result = {'results': get_employees()}

    	return result

    
    def post(self, **params):
    	id = params.get('id')
    	if not id:
    		return None

    	req_dict = request.data

        print(req_dict)
