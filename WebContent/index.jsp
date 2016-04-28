<!DOCTYPE html>
<html long="en">
<head>
<script src="scripts/angular.js"></script>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body ng-app="myapp">
	<div ng-controller="UserController" ng-show="noshow"> /*remove ng-show to show this div*/
		<h2 ng-repeat="u in Users">{{u}}</h2>
	</div>
	<br>
	<div ng-controller="UserController">
		<div ng-show="show"><img src="images/loading.gif"/></div>
		<table>
			<tr>
				<th>Firstname</th>
				<th>email</th>
			</tr>
			<tr ng-repeat="u in Users">
				<td>{{u.name}}</td>
				<td>{{u.emailId}}</td>
			</tr>
		</table>
		<br>
		<div ng-show=noshow>
		Showing {{Users.length}} Users
		</div>
	</div>
	<script>
		angular.module("myapp", []).controller('UserController', ['$scope','$http','$log', function($scope,$http,$log) {
					$scope.show = true;
					$scope.noshow = false;
					$log.error("getting user");
					var result = $http.get('http://localhost:8080/AngularDynWeb/rest/user');
					result.success(function(data, status, headers, config) {
						console.log(data);
						$scope.Users = data;
						$scope.show = false;
					}).error(function(data, status, headers, config) {
						alert(error);
						$scope.show = false;
						$scope.error = status;
					});
				}]);
	</script>
</body>
</html>