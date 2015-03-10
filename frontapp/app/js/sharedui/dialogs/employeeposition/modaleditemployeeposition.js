angular.module('PGApp.sharedUI')
.controller('ModalEditEmployeePosition', ['Employee', '$scope', '$rootScope','employeeposition', '$modalInstance', '$q', function(Employee, $scope, $rootScope, employeeposition, $modalInstance, $q){
	$scope.employeeposition = employeeposition;
	
	// Convert employeejobtypeactive to true or false
	var eJobTypeActive = $scope.employeeposition.employeejobtypeactive;
	$scope.employeeposition.employeejobtypeactive = (eJobTypeActive == 1 || eJobTypeActive == '1') ? true : false;

	$scope.cancel = function(){
		$modalInstance.close('cancel');
	}

	$scope.updateEmployeePosition = function(){	
		$scope.saveEmployeePosition = $q.defer();	
		Employee.updateEmployeePosition($scope.employeeposition)
		.then(function(response){
			$scope.saveEmployeePosition.resolve();
			$modalInstance.close('ok');
			$rootScope.$broadcast('employeeposition-modified');
		}, function(reason){
			$scope.saveEmployeePosition.resolve();
		});
	}

	$scope.deleteEmployeePosition = function(){

	}
}]);