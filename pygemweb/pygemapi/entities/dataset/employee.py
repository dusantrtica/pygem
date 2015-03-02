import ipdb
from queries.employee import *

from entities.serializers.employeeserializers import (
	EmployeeListSerializer,
	EmployeeSerializer
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