<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo List</title>
</head>

<body>
	<table border=1>
		<thead>
			<tr>
				<td>Id</td>
				<td>Imię</td>
				<td>Login</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.id}</td>
					<td>${user.firstName}</td>
					<td>${user.login}</td>
					<td><a href="userDetails-${user.id}">Szczegóły</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4"><a href="..">Strona główna.</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>