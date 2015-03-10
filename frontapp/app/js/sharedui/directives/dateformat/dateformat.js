angular.module('PGApp.sharedUI')
.directive('dateFormat', function($filter){
	var dateFilter = $filter('date');

	return {
		require: 'ngModel',
		link: function(scope, elememnt, attr, ngModelCtrl){
			ngModelCtrl.$formatters.unshift(function(value){
				if(!value)
					return;
				return dateFilter(value, 'dd-MM-yyyy');
			});
			ngModelCtrl.$parsers.push(function(value){
				if(!value) return null;
				var regex = /(\d{1,2})[\-/](\d{1,2})[\-/](\d{4})/.exec(value);
				if(regex){
					var day = regex[1];
					var month = regex[2] - 1;
					var year = regex[3];

					var newDate = new Date(year, month, day);
					return newDate;
				}
				else{
					return 'invaliddate';
				}
			});
		}
	};
});