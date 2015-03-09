console.log('loading employeeposition directive');
angular.module('PGApp.sharedUI')
.directive('employeePosition', ['$modal', function($modal){
	return {
		restrict: 'E',
		templateUrl: 'js/sharedui/directives/employeeposition/employeeposition.html',
		scope: {
			eposition: '=',
			status: '@',			
		},
		controller: function($scope){
			$scope.getClass = function(position){				
				switch(position.status){
					case "active": return "bg-success";
					case "inactive": return "bg-warning";
					case "expired": return "bg-danger";
				}
			}

			$scope.openEmployeePositionModal = function(position){				
				var modalInstance = $modal.open({
					templateUrl: 'js/sharedui/dialogs/employeeposition/modaleditemployeeposition.html',
					controller: 'ModalEditEmployeePosition',
					resolve: {
						employeeposition: function(){
							return position;
						}
					}				
				});			
			}
		}
	}
}]);
console.log('loaded employeeposition directive');