angular.module('PGApp.employees')
.controller('EmployeeBasic', ['Employee', '$scope', '$state', '$rootScope', '$stateParams', '$q', function(Employee, $scope, $state, $rootScope, $stateParams, $q){
	$scope.employeeId = $stateParams.employeeId;

	if(!$scope.employeeId){
		$state.go('employees');
	}

	$scope.populateEmployeeBasicInfo = function (){		
		$scope.employeeBasicPromise = $q.defer();
		Employee.getEmployeeBasicInfo($scope.employeeId)
		.then(function(response){
			$scope.employee = response.data;
			$scope.employeeBasicPromise.resolve();
		}, function(reason){
			$scope.employeeBasicPromise.resolve();
		});
	}

	$scope.editEmployeeBasic = function(){
		// Make backup
		$scope.backupEmployee = angular.copy($scope.employee);
		$scope.editorEnabled = true;
	}

	$scope.editEmployeeBasicSave = function(){
		$scope.editorEnabled = false;
		$scope.employeeBasicPromise = $q.defer();
		Employee.updateEmployeeBasicInfo($scope.employee)
		.then(function(response){
			$scope.employeeBasicPromise.resolve();
		}, function(reason){
			$scope.employeeBasicPromise.resolve();
		});
	}

	$scope.editEmployeeBasicCancel = function(){
		$scope.editorEnabled = false;
		// Add guard if backupEmployee is undefined for some reason, then get employee again.
		$scope.employee = angular.copy($scope.backupEmployee);
	}

	function init(){
		$scope.populateEmployeeBasicInfo($scope.employeeId);
	}
	init();
}]);