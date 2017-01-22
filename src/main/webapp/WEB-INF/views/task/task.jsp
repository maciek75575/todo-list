<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../mainHeader.jsp"%>

		<div class="row">
			<div class="col s6 l3">
				<a href="/task/before-${date}" class="btn btn-flat waves-effect waves-green" style="margin-top:1rem;">Poprzedni dzień</a>
			</div>
			<div class="col s6 l3 right right-align">
				<a href="/task/after-${date}" class="btn btn-flat waves-effect waves-green" style="margin-top:1rem;">Następny dzień</a>
			</div>
			<form:form method="POST" modelAttribute="formDate">
				<div class="input-field col s12 m9 l4">
					<form:input type="date" path="taskDate" name="taskDate" id="taskDate" class="datepicker" required="required" />
					<label for="taskDate">Data</label>
				</div>
				<div class="col s12 m3 l2 center-align">
					<button class="btn btn-flat waves-effect waves-green" style="margin-top:1rem;" type="submit" name="submit">
						Wybierz
		  			</button>
				</div>
			</form:form>
		</div>
<div class="row">
	<div class="col s12 m10 offset-m1 l8 offset-l2">
		<c:if test="${empty tasks}">
			<div class="center-align">Brak zaplanowanych zadań dla wybranej daty.</div>
		</c:if>
		<c:if test="${not empty tasks}">
			<ul class="collapsible" data-collapsible="accordion">
				<c:forEach var="task" items="${tasks}">
				    <li>
				        <div class="collapsible-header no-border ${task.category.categoryColor.primaryColor}">
				        	<div class="col s7"><c:if test="${task.important}"><i class="material-icons left">priority_high</i></c:if>${task.title}</div>
				        	<div class="col s5 right-align"><fmt:formatDate value="${task.taskDate}" pattern="dd.MM.yyyy" /></div>
				        </div>
				        <div class="collapsible-body no-border ${task.category.categoryColor.secondaryColor}" style="padding:0 1rem;">
					        <table>
					        	<tbody>
					        		<tr>
					        			<td>Kategoria: ${task.category.name}</td>
					        			<td class="right-align">
					        				<c:if test="${not task.completed}"><a href="/task/complete-${task.id}" class="btn btn-flat waves-effect waves-light">Zakończ</a></c:if>
					        				<c:if test="${task.completed}">Ukończono</a></c:if>
					        			</td>
					        		</tr>
					        		<tr>
					        			<td colspan=2>${task.description}</td>
					        		</tr>
					        		<tr>
					        			<td><a class="btn-floating green waves-effect waves-light" href="/task/edit-${task.id}"><i class="material-icons">mode_edit</i></a></td>
					        			<td class="right-align"><c:if test="${task.editDate != null}">Ostatnia edycja: <fmt:formatDate value="${task.editDate}" pattern="dd.MM.yyyy" /></c:if></td>
					        		</tr>
					        	</tbody>
					        </table>
						</div>
				    </li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</div>

<div class="fixed-action-btn">
	<a class="btn-floating btn-large waves-effect waves-light blue darken-2 tooltipped" href="/task/add" data-position="left" data-delay="50" data-tooltip="Dodaj">
		<i class="material-icons light-blue-text text-lighten-4" style="font-size: 40px;">add</i>
	</a>
</div>

<script src="/script/calendarInit.js"></script>
<script>
$(document).ready(function() {
	calendarInit(false);
});
</script>

<%@include file="../mainFooter.jsp"%>