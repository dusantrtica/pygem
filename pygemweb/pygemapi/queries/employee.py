query_all_employees = """
SELECT e.*, ejt.EmployeeJobTypeActive,GROUP_CONCAT(jt.JobTypeTitle SEPARATOR ', ') as EmployeeJobTypes from employee e 
	LEFT OUTER JOIN employeejobtype ejt on ejt.EmployeeID=e.EmployeeID AND ejt.EmployeeJobTypeActive='1' 
	LEFT OUTER JOIN jobtype jt ON jt.JobTypeID=ejt.JobTypeID
	LEFT OUTER JOIN job j ON j.JobID=jt.JobID
	GROUP BY e.EmployeeID ORDER BY j.JobTitle, jt.JobTypeTitle, e.EmployeeSurname, e.EmployeeFirstName	
"""

query_employee_by_id = 'SELECT * FROM employee WHERE employeeid=?'

query_update_employee = """
	UPDATE employee SET 
		EmployeeFirstName=:employeefirstname,
		EmployeeMidName=:employeemidname,
		EmployeeSurname=:employeesurname
	WHERE EmployeeID=:employeeid
"""

query_get_employee_positions = """
	SELECT ejt.*, jt.JobTypeTitle, j.JobTitle from employee e
		LEFT JOIN employeejobtype ejt on e.EmployeeID=ejt.EmployeeID
		LEFT JOIN jobtype jt ON ejt.JobTypeID=jt.JobTypeID
		LEFT JOIN job j ON j.JobID = jt.JobID
		WHERE e.EmployeeID=:employeeid
"""