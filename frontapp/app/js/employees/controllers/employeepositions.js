angular.module('PGApp.employees')
.controller('EmployeePositions', ['Employee', '$stateParams', '$rootScope', '$scope', '$q', function(Employee, $stateParams, $rootScope, $scope, $q){

	$scope.employeeId = $stateParams.employeeId;

	if(!$scope.employeeId){
		// Fix 
		$state.go('employees');
	}

	$scope.populateEmployeePositions = function(){
		$scope.employeePositionsPremise = $q.defer();
		
		$scope.activePositions = [];
		$scope.inactivePositions = [];
		$scope.expiredPositions = [];
	
		Employee.getEmployeePositions($scope.employeeId)
		.then(function(response){
			$scope.employeePositionsPremise.resolve();
			$scope.employeepositions = response.data;

			$.each($scope.employeepositions, function(item){
				var elem = $scope.employeepositions[item];
				var hasExpired = hasPositionExpired(elem);
				// We have 3 type of positions:
				// 1. Active - that are marked as active (current) and not expired
				// 2. Inactive but not expired - that are marked just as not active
				// 3. Expired
				if(elem.employeejobtypeactive == 1 && !hasExpired){
					elem.status="active";
					$scope.activePositions.push(elem);
				}
				else if(!hasExpired){
					elem.status="inactive";
					$scope.inactivePositions.push(elem);
				}
				else{
					elem.status="expired";
					$scope.expiredPositions.push(elem);
				}				
			});

		}, function(reason){
			$scope.employeePositionsPremise.resolve();
		});
	}

	$rootScope.$on('employeeposition-modified', function(){
		$scope.populateEmployeePositions();
	});

	function hasPositionExpired(position){
		// TODO: here we have to add comparing to the jobtype duration
		var expDate = new Date(position.employeejobtypeexpirationdate);
		return expDate < new Date();
	}

	function init(){
		if(!$scope.employeepositions){
			$scope.populateEmployeePositions();
		}
	}

	init();

}]);
