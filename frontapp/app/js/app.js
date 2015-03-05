angular.module('PGApp.auth', []); // TODO Create auth module

// API services shared between modules.
angular.module('PGApp.services', []);

// Shared UI, directives and filters
angular.module('PGApp.sharedUI', []);

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
	// 3rd party libs
	'ui.router',
	'cgBusy',

	'PGApp.sharedUI',
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
			config.headers['Content-Type'] = 'application/json';				
			return config;
		}
	}
}])
.config(['$httpProvider', function($httpProvider){
	$httpProvider.interceptors.push('jsonStubInterceptor');
	$httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);