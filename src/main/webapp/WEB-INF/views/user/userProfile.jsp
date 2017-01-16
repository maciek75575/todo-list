<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m10 offset-m1 l8 offset-l2 center-align">
		<table class="bordered striped">
			<tbody>
				<tr>
					<th class="right-align">Imie:</th>
					<td>${user.firstName}<a class="btn btn-flat waves-effect waves-green right" href="/user/update"><i class="material-icons left">mode_edit</i>Edytuj</a></td>
				</tr>
				<tr>
					<th class="right-align">Nazwisko:</th>
					<td>${user.lastName}<a class="btn btn-flat waves-effect waves-green right" href="/user/update"><i class="material-icons left">mode_edit</i>Edytuj</a></td>
				</tr>
				<tr>
					<th class="right-align">Login:</th>
					<td>${user.login}</td>
				</tr>
				<tr>
					<th class="right-align">Hasło:</th>
					<td>******<a class="btn btn-flat waves-effect waves-green right" href="/user/changePassword"><i class="material-icons left">mode_edit</i>Zmień hasło</a></td>
				</tr>
				<tr>
					<th class="right-align">E-Mail:</th>
					<td>${user.email}</td>
				</tr>
				<tr>
					<th class="right-align">Telefon:</th>
					<td>${user.phoneNumber}<a class="btn btn-flat waves-effect waves-green right" href="/user/update"><i class="material-icons left">mode_edit</i>Edytuj</a></td>
				</tr>
				<tr>
					<th class="right-align">Aktywny:</th>
					<td>${user.enabled}</td>
				</tr>
				<tr>
					<th class="right-align">Poziom uprawnień:</th>
					<td><c:forEach var="auth" items="${user.authorities}">${auth.authority} </c:forEach>
					</td>
				</tr>
				<tr>
					<th class="right-align">Data rejestracji:</th>
					<td>${user.signUpDate}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<%@include file="../mainFooter.jsp"%>