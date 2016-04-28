<!DOCTYPE>
<html ng-app="Airlines">
<head>
<link rel="stylesheet" href="styles/bootstrap.css" />

<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/angular.js"></script>
<script type="text/javascript" src="scripts/app3.js"></script>
</head>
<body>
	<h2>Users</h2>
	<div ng-controller="UserController as userController">
		<div ng-show="loading"><img src="images/loading.gif"></img></div>
		<table style="width: 400px">
			<tr ng-repeat="user in users">
				<td>{{user.name}}</td>
				<td>{{user.age}}</td>
				<td><a href='#' ng-click="editUser(user)">Edit</a></td>
			</tr>
		</table>
		{{error}}
		Showing {{users.length}} users
		<input type="button" value="Add User" ng-click="showAddForm=true"></input>
		<div ng-show="showAddForm || showEditForm">
			<form novalidate>
				<input type="text" ng-model="user.name"></input>
				<input type="number" ng-model="user.age"></input>
				<input type="button" value="Cancel" ng-click="showAddForm=false"></input>
				<input type="button" value="Update" ng-show="showEditForm" ng-click="updateUser(user)"></input>
				<input type="button" value="Save" ng-show="showAddForm" ng-click="addUser(user)"></input>
			</form>
		</div>
	</div>
</body>
</html>