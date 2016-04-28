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
	
	
	<form action="" ng-click="form = true">
			<input type="button" value="Create User">
			<br>
			<br>
		</form>
		<form ng-show="form">
			First name:<br> <input type="text" name="firstname"
				value="" ng-model="User.name"> <br> 
			email:<br> <input type="text"
				name="emailId" value="" ng-model="User.emailId"> 
				<br>
				<br> 
			<input type="button" value="Submit" ng-click="addUser()">
		</form>
</div>
	<script>
		angular.module("myapp", []).controller('UserController', ['$scope','$http','$log', function($scope,$http,$log) {
					$scope.show = true;
					$scope.form = false;
					$log.debug("getting user");
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
					$scope.addUser = function() {
					console.log($scope.User);
					var formPost = $http.post('http://localhost:8080/AngularDynWeb/rest/user', $scope.User)
				.success(function(data) {
						console.log(data);
						$scope.Users.push($scope.User);
						$scope.form = false;
					});
					};
				}]);
	</script>
</body>
</html>