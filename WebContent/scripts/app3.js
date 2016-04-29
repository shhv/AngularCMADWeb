(function() {
	var app = angular.module('Airlines', ['ngRoute']);

	app.config([ '$routeProvider', function($routeProvider) {
		console.log("Route provider config");
		$routeProvider.when('/route1', {
			templateUrl : 'template-1.jsp',
			controller : 'UserController'
		}).when('/route2', {
			templateUrl : 'template-2.jsp',
			controller : 'jsonUserController'
		}).otherwise({
			redirecTo : '/'
		});
	} ]);

	app.controller('UserController', function($http, $log, $scope) {
		var controller = this;
		$scope.users = [];
		$scope.loading = true;
		$log.debug("Getting users...");
		$http.get('rest/user').success(function(data, status, headers, config) {
			$scope.users = data;
			$scope.loading = false;
		}).error(function(data, status, headers, config) {
			$scope.loading = false;
			$scope.error = status;
		});

		$scope.addUser = function(){
		$http.post("rest/user",$scope.user).success(function(data, status, headers, config){
		$scope.users.push(angular.copy($scope.user));
		$scope.showUserForm=false;	
		});
		};
		
		$scope.editUser = function(user) {
			console.log(user);
			$scope.user = user;
			$scope.showEditForm = true;
			$scope.showAddForm = false;
		}

		$scope.updateUser = function(user) {
			$log.debug(user);
			$http.put('rest/user', user).success(
					function(data, status, headers, config) {
						console.log(data);
						$scope.showEditForm = false;
					}).error(function(data, status, headers, config) {
				$scope.error = status;
				$scope.showEditForm = false;
			});

		}
	});
	app.controller("jsonUserController", [ '$scope', '$http', '$log',
			function($scope, $http, $log) {
				var result = $http.get('product.json');
				result.success(function(data, status, headers, config) {
					console.log(data);
					$scope.jsonData = data;
				}).error(function(data, status, headers, config) {
					alert(status);
				});
			} ]);
})();
