<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m10 offset-m1 l8 offset-l2 center-align">
		<table class="highlight">
			<thead>
				<tr>
					<th>Tytuł</th>
					<th>Opis</th>
					<th>Data</th>
					<th>Ukończono</th>
					<th style="width:140px">
						<a class="btn-floating right blue waves-effect waves-light" href="/task/add">
							<i class="large material-icons">add</i>
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="task" items="${tasks}">
					<tr>
						<td>${task.title}</td>
						<td>${task.description}</td>
						<td><fmt:formatDate value="${task.taskDate}" pattern="dd.MM.yyyy" /></td>
						<td>${task.completed}</td>
						<td class="right-align">
							<a class="btn-floating light-green waves-effect waves-light" href="/task/complete-${task.id}"><i class="material-icons">check</i></a>
							<a class="btn-floating green waves-effect waves-light" href="/task/edit-${task.id}"><i class="material-icons">mode_edit</i></a>
							<a class="btn-floating red waves-effect waves-light" href="/task/remove-${task.id}"><i class="material-icons">delete_forever</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="waves-effect waves-light btn" href="/">Strona główna<i class="material-icons right">subdirectory_arrow_left</i></a>
	</div>
</div>

<%@include file="../mainFooter.jsp"%>