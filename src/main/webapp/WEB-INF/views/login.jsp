<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo List</title>
<link rel='stylesheet' href='webjars/bootstrap/3.3.7/css/bootstrap.min.css'>
</head>

<body>
	<c:set var="loginUrl">
		<c:url value="/login" />
	</c:set>
	<form method="POST" action="${loginUrl}">
		<table style="text-align: right;">
			<tbody>
				<tr>
					<td>Login:</td>
					<td><input type="text" name="login" /></td>
				</tr>
				<tr>
					<td>Hasło:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="submit" value="Zaloguj" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>