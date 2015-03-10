import ipdb
from flask import request
from flask.ext import restful
from flask.ext.cors import cross_origin
from entities.models.employee import *


class Employee(restful.Resource):    
    def get(self, id=None, page=None):    	
    	if id:    
            result = get_employee_by_id(id)
    	else:
            # TODO: here goes pagination
    		result = {'results': get_employees()}

    	return result

    
    def post(self, **params):    	
    	req_dict = request.json
        # TODO: create new employee

        print(req_dict)

    def put(self, **params):            
        data = request.json

        result, err = update_employee(data)

        if result:
            # Everything is okay
            return data
        else:
            return None

class EmployeePositions(restful.Resource):
    def get(self, employee_id):        
        result = get_employee_positions(employee_id)

        return result        

    def put(self, **params):
        data = request.json
        result = update_employee_position(data)        
        if result:
            return 200
        else:
            return 500

    def delete(self, **params):
        pass

    def post(self, **params):
        pass    