import ipdb
from entities.serializers.employeeserializers import (
		EmployeeListSerializer
	)

from entities.dataset.employee import (
	_db_get_employees,
	_db_get_employee_by_id
	)

def get_employees():	
	return _db_get_employees()

def get_employee_by_id(id):
	# TODO: cache employee
	return _db_get_employee_by_id(id)