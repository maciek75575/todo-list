<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo List</title>
</head>

<body>
	<form:form method="POST" modelAttribute="formUserChangePassword">
		<table style="text-align: right;">
			<tbody>
				<tr>
					<td>Stare hasło:</td>
					<td><form:input type="password" path="oldPassword" name="oldPassword" /></td>
				</tr>
				<tr>
					<td>Nowe hasło:</td>
					<td><form:input type="password" path="newPassword" name="newPassword" /></td>
				</tr>
				<tr>
					<td>Powtórz nowe hasło:</td>
					<td><form:input type="password" path="repeatPassword" name="repeatPassword" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Zmień" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>