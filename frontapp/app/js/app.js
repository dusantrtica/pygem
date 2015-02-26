angular.module('PGApp.auth', []); // TODO Create auth module

// API services shared between modules.
angular.module('PGApp.services', []);

// Employees module
angular.module('PGApp.employees', [
	'ui.router'
	]);
// Courses module
angular.module('PGApp.courses', [
	'ui.router'
	]);
// Positions module
angular.module('PGApp.positions', [
	'ui.router'
	]);
// Education module
angular.module('PGApp.education', [
	'ui.router'
	]);

angular.module('PGApp',[
	'ui.router',
	'PGApp.services',
	'PGApp.employees',
	'PGApp.courses',
	'PGApp.positions',
	'PGApp.education'])
.controller('MainCtrl', [function(){

}])
.factory('jsonStubInterceptor', [function(){
	return{
		'request': function(config){
			config.headers['JsonStub-User-Key'] = '6a8a2c47-7b76-43eb-af7e-ef479059b248';
			config.headers['JsonStub-Project-Key'] = 'de496122-2c55-42ed-bb65-5d56a4f7b48b';
			config.headers['Content-Type'] = 'application/json'
			return config;
		}
	}
}])
.config(['$httpProvider', function($httpProvider){
	$httpProvider.interceptors.push('jsonStubInterceptor');
}]);