import ipdb
from queries.employee import *
import sqlparams

from entities.serializers.employeeserializers import (
	EmployeeListSerializer,
	EmployeeSerializer,
	EmployeePositionsSerializer
)

from common.decorators import serialize

def get_connection():	
	from app import app
	return app.databaseconnector.get_connection()

@serialize(serializer_class=EmployeeListSerializer, many=True)
def _db_get_employees():
	dbconn = get_connection().cursor()
	cursor = dbconn.execute(query_all_employees)
	return cursor

@serialize(serializer_class=EmployeeSerializer)
def _db_get_employee_by_id(id):
	dbconn = get_connection().cursor()
	cursor = dbconn.execute(query_employee_by_id, id) 
	return cursor

def _db_update_employee(employee_data):	
	query = sqlparams.SQLParams('named', 'qmark')
	sql, params = query.format(query_update_employee, employee_data)
	dbconn = get_connection().cursor()
	dbconn.execute(sql, params)

@serialize(serializer_class=EmployeePositionsSerializer, many=True)
def _db_get_employee_positions(employee_id):	
	query = sqlparams.SQLParams('named', 'qmark')
	sql, params = query.format(query_get_employee_positions, {'employeeid': employee_id})
	dbconn = get_connection().cursor()	
	cursor = dbconn.execute(sql, params)
	return cursor

