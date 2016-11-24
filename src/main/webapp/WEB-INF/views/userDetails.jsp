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
		<tbody>
			<tr>
				<td>Id</td>
				<td>${user.id}</td>
			</tr>
			<tr>
				<td>Imie</td>
				<td>${user.firstName}</td>
			</tr>
			<tr>
				<td>Nazwisko</td>
				<td>${user.lastName}</td>
			</tr>
			<tr>
				<td>Login</td>
				<td>${user.login}</td>
			</tr>
			<tr>
				<td>Hasło</td>
				<td>${user.password}</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>Telefon</td>
				<td>${user.phoneNumber}</td>
			</tr>
			<tr>
				<td>Aktywny</td>
				<td>${user.enabled}</td>
			</tr>
			<tr>
				<td>Poziom uprawnień</td>
				<td><c:forEach var="auth" items="${user.authorities}">${auth.authority} </c:forEach></td>
			</tr>
			<tr>
				<td>Data rejestracji</td>
				<td>${user.signUpDate}</td>
			</tr>
			<tr>
				<td colspan="2"><a href="userRemove-${user.id}">Usuń użytkownika</a></td>
			</tr>
			<tr>
				<td colspan="2"><a href="users">Lista użytkowników</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>