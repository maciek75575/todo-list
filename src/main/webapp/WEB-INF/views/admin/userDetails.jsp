<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m10 offset-m1 l8 offset-l2 center-align">
		<table class="bordered striped">
			<tbody>
				<tr>
					<th class="right-align">Id:</th>
					<td>${user.id}</td>
				</tr>
				<tr>
					<th class="right-align">Imie</th>
					<td>${user.firstName}</td>
				</tr>
				<tr>
					<th class="right-align">Nazwisko:</th>
					<td>${user.lastName}</td>
				</tr>
				<tr>
					<th class="right-align">Login:</th>
					<td>${user.login}</td>
				</tr>
				<tr>
					<th class="right-align">Hasło:</th>
					<td>${user.password}</td>
				</tr>
				<tr>
					<th class="right-align">E-Mail:</th>
					<td>${user.email}</td>
				</tr>
				<tr>
					<th class="right-align">Telefon:</th>
					<td>${user.phoneNumber}</td>
				</tr>
				<tr>
					<th class="right-align">Aktywny:</th>
					<td>${user.enabled}</td>
				</tr>
				<tr>
					<th class="right-align">Poziom uprawnień:</th>
					<td><c:if test="${roleUser != null}">ROLE_USER <a
								href="authorityRemove-${user.id}-${roleUser.id}">Usuń</a>
							<br />
						</c:if> <c:if test="${roleAdmin != null}">ROLE_ADMIN <a
								href="authorityRemove-${user.id}-${roleAdmin.id}">Usuń</a>
						</c:if></td>
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