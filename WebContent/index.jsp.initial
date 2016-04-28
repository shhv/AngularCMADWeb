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
		<h2 ng-repeat="u in Users">{{u}}</h2>
	</div>
	<br>

	<div ng-controller="UserController">
		<table>
			<tr>
				<th>Firstname</th>
				<th>email</th>
			</tr>
			<tr ng-repeat="u in Users">
				<td>{{u.name}}</td>
				<td>{{u.email}}</td>
			</tr>
		</table>
		<br>
		Showing {{Users.length}} Users
	</div>
	<script>
		angular.module("myapp", []).controller("UserController",
				function($scope) {
					$scope.Users = [];
					$scope.Users[0] = {
						name : "shruthi",
						email : "shhv@cisco.com"
					};
					$scope.Users[1] = {
						name : "cisco",
						email : "email@cisco.com"
					};
				});
	</script>
</body>
</html>