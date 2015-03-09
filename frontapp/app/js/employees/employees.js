angular.module('PGApp.employees')
.config(['$stateProvider', function($stateProvider){
	$stateProvider
		.state('employees', {
			url: '/employees/',
			templateUrl: 'partials/employees/employees.html',
			controller: 'ListEmployees'

		})
		.state('employee', {
			url: '/employee{employeeId}/',
			views:{
				'': {templateUrl: 'partials/employees/view-employee.html'},
				'basic@employee': {
					templateUrl: 'partials/employees/view-employee-basic.html',
					controller: 'EmployeeBasic'					
				},
				'positions@employee': {
					templateUrl: 'partials/employees/view-employee-positions.html',
					controller: 'EmployeePositions'
				},

				'courses@employee': {templateUrl: 'partials/employees/view-employee-courses.html'},
				'education@employee': {templateUrl: 'partials/employees/view-employee-education.html'}
			}

		});
		// TODO: add more states, one per each of the section.
}]);