angular.module('PGApp.sharedUI')
.controller('ModalEditEmployeePosition', ['Employee', '$scope', '$rootScope','employeeposition', function(Employee, $scope, $rootScope, employeeposition){
	$scope.employeeposition = employeeposition;

	$scope.cancel = function(){
	}

	$scope.updateEmployeePosition = function(){
		
	}
}]);