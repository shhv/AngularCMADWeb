
	<div ng-controller="jsonUserController">
		<br>
		<br>
		<br>
		<table>
			<tr>
				<th>id</th>
				<th>version</th>
				<th>stock</th>
				<th>productName</th>
				<th>productPrice</th>
			</tr>
			<tr ng-repeat="u in jsonData">
				<td>{{u.id}}</td>
				<td>{{u.version}}</td>
				<td>{{u.stock}}</td>
				<td>{{u.productName}}</td>
				<td>{{u.productPrice}}</td>
			</tr>
		</table>
	</div>
<!-- URL will be http://localhost:8080/AngularDynWeb/index.jsp#/route2 
Added as part of index.jsp.addAbuttonTocreateNewUser-->