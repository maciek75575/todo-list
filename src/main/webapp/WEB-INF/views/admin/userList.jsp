<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m10 offset-m1 l8 offset-l2 center-align">
		<table class="highlight">
			<thead>
				<tr>
					<th>Id</th>
					<th>Imię</th>
					<th>Login</th>
					<th style="width:150px"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td>${user.id}</td>
						<td>${user.firstName}</td>
						<td>${user.login}</td>
						<td class="right-align">
							<a class="btn-floating waves-effect waves-light" href="userDetails-${user.id}"><i class="material-icons blue">account_circle</i></a>
							<a class="btn-floating waves-effect waves-light" href="userEdit-${user.id}"><i class="material-icons green">mode_edit</i></a>
							<a class="btn-floating waves-effect waves-light" href="userRemove-${user.id}"><i class="material-icons red">delete_forever</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="waves-effect waves-light btn" href="..">Strona główna<i class="material-icons right">subdirectory_arrow_left</i></a>
	</div>
</div>

<%@include file="../mainFooter.jsp"%>