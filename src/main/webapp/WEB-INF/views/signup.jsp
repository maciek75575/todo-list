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
	<form:form method="POST" modelAttribute="formSignUp">
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
					<td>Login:</td>
					<td><form:input type="text" path="login" name="login" /></td>
				</tr>
				<tr>
					<td>Hasło:</td>
					<td><form:input type="password" path="password" name="password" /></td>
				</tr>
				<tr>
					<td>Powtórz hasło:</td>
					<td><form:input type="password" path="repeatPassword" name="repeatPassword" /></td>
				</tr>
				<tr>
					<td>E-mail:</td>
					<td><form:input type="text" path="email" name="email" /></td>
				</tr>
				<tr>
					<td>Powtórz e-mail:</td>
					<td><form:input type="text" path="repeatEmail" name="repeatEmail" /></td>
				</tr>
				<tr>
					<td>Telefon:</td>
					<td><form:input type="text" path="phoneNumber" name="phoneNumber" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Zarejestruj" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>