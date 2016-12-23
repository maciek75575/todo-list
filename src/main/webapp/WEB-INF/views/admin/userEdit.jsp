<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../mainHeader.jsp"%>

	<form:form method="POST" modelAttribute="formUserEdit">
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
					<td>E-mail:</td>
					<td><form:input type="text" path="email" name="email" /></td>
				</tr>
				<tr>
					<td>Telefon:</td>
					<td><form:input type="text" path="phoneNumber" name="phoneNumber" /></td>
				</tr>
				<tr>
					<td>Aktywny</td>
					<td><form:checkbox path="enabled" name="enabled" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Zapisz" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>

<%@include file="../mainFooter.jsp"%>