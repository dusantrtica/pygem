angular.module('PGApp.services')
.service('Employee', ['$http', function($http){
	var baseUrl = 'http://jsonstub.com';
	baseUrl = 'http://localhost:5000'
	return {		

		getAll: function(page){
			if(page){
				return $http.get(page);
			}
			else{
				return $http.get(baseUrl + '/api/employees/');
				/*
				return $http({
    				url: 'http://jsonstub.com/api/employees/',
    				method: 'GET',
    				dataType: 'json', 
    				data: '',         
				    headers: {
				        'Content-Type': 'application/json',
				        'JsonStub-User-Key': '6a8a2c47-7b76-43eb-af7e-ef479059b248',
				        'JsonStub-Project-Key': 'de496122-2c55-42ed-bb65-5d56a4f7b48b'
				    }
				});
*/
			}
		},

		getById: function(id){
			return $http.get(baseUrl + '/api/employees/' + id + '/');
		},

		getEmployeeBasicInfo: function(employeeId){
			return $http.get(baseUrl + '/api/employees/' + employeeId + '/');
		},

		updateEmployeeBasicInfo: function(employee){
			return $http.put(baseUrl + '/api/employees/', employee);
		},

		getEmployeePositions: function(employeeId){
			return $http.get(baseUrl + '/api/employeepositions/' + employeeId + '/')
		},

		updateEmployeePosition: function(position){
			return $http.put(baseUrl +  '/api/employeepositions/', position);
		}
	};
}]);