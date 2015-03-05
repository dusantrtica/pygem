angular.module('PGApp.employees')
.controller('ListEmployees', ['Employee', '$scope', '$state', '$q', function(Employee, $scope, $state, $q){

	var pageSize = 20;
	$scope.first = '/api/employees/';

	$scope.employees = undefined;

	$scope.goToEmployee = function(employeeId){
		$state.go('employee', {employeeId:employeeId});
	}

	$scope.populateEmployeesFromServer = function(){
		$scope.employeeListPromise = $q.defer();
		Employee.getAll()
		.then(function(response){
			$scope.employeeListPromise.resolve();
			$scope.employees = response.data;
			var div = Math.floor(response.data.count / pageSize);
			var rem = response.data.count % pageSize;
			var last_page = div;
			if(rem){ last_page += 1;}
			$scope.last = '/api/companies/?page=' + last_page;

		},function(reason){
			$scope.employeeListPromise.resolve();
			console.log(reason);
		});
	}

	function init(){
		if(!$scope.employees){
			$scope.populateEmployeesFromServer();
		}
	}

	init();
}]);