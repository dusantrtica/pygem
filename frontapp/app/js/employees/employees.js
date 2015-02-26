angular.module('PGApp.employees')
.config(['$stateProvider', function($stateProvider){
	$stateProvider
		.state('employees', {
			url: '/employees/',
			templateUrl: 'partials/employees/employees.html',
			controller: 'ListEmployees'

		})
		.state('employee', {});
		// TODO: add more states, one per each of the section.
}]);