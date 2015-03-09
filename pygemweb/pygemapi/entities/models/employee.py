import ipdb
from entities.serializers.employeeserializers import (
		EmployeeListSerializer
	)

from entities.dataset.employee import (
	_db_get_employees,
	_db_get_employee_by_id,
	_db_update_employee,
	_db_get_employee_positions
	)

# Gets list of employees
def get_employees():	
	return _db_get_employees()

# Get Employee's basic data
def get_employee_by_id(employee_id):
	# TODO: cache employee
	return _db_get_employee_by_id(employee_id)

# Sets employee's basic data
def update_employee(employee_data):
	try:
		_db_update_employee(employee_data)
		return True, None
	except Exception as e:
		print(e)
		# log(e)
		return False, e


# Positions
def get_employee_positions(employee_id):
	# TODO: cache employee positoins
	return _db_get_employee_positions(employee_id)
