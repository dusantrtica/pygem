angular.module('PGApp.sharedUI')
.directive('editableFormItem', [function(){
	return {		
		restrict: 'E',		
		templateUrl: 'js/sharedui/directives/editableformitem/editableformitem.html',
		scope: {
			'label': '@',
			'emodel': '='
		}
	}
}]);