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
	<form:form method="POST" modelAttribute="formUserUpdate">
		<table style="text-align: right;">
			<tbody>
				<tr>
					<td>Imię:</td>
					<td><form:input type="text" path="firstName" name="firstName" /></td>
				</tr>
				<tr>
					<td>Nazwisko:</td>
					<td><form:input type="text" path="lastName" name="lastName" /></td>
				</tr>
				<tr>
					<td>Telefon:</td>
					<td><form:input type="text" path="phoneNumber" name="phoneNumber" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Zmień" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>