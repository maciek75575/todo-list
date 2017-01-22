<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp" %>

<div class="row">
	<form:form class="col s12 m8 offset-m2 l6 offset-l3" method="POST" modelAttribute="formTask">
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="text" path="title" name="title" id="title" length="255" maxlength="255" class="validate" required="required" />
				<label for="title">Tytuł *</label>
			</div>
		</div>
      	<div class="row">
			<div class="input-field col s12">
				<form:textarea path="description" name="description" id="description" length="3000" maxlength="3000" class="validate materialize-textarea" />
				<label for="description">Opis</label>
			</div>
		</div>
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="date" path="taskDate" name="taskDate" id="taskDate" class="datepicker" required="required" />
				<label for="taskDate">Data *</label>
			</div>
		</div>
      	<div class="row">
			<div class="col s12">
				<div class="checkbox_wrapper">
					<form:checkbox path="important" name="important" id="important" />
					<label for="important">Pilne</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
			    <select path="category" name="category" id="category" required="required">
			        <c:forEach var="category" items="${categories}">
			        	<option id="category${category.id}" value="${category.id}" <c:if test="${formTask.category.id == category.id}">selected="selected"</c:if>>${category.name}</option>
			        </c:forEach>
			    </select>
			    <label>Kategoria *</label>
			</div>
		</div>
      	<div class="row center-align">
			<div class="input-field col s12">
				<button class="btn btn-flat waves-effect waves-green" type="submit" name="submit">
					Zapisz<i class="material-icons right">send</i>
  				</button>
			</div>
		</div>
	</form:form>
</div>
<div id="test"></div>

<script src="/script/calendarInit.js"></script>
<script>
$(document).ready(function() {
	calendarInit(true);
	
	var $input = $('.datepicker').pickadate();
	var picker = $input.pickadate('picker');
	var date = "${formTask.taskDate}";
	picker.set('select', date.substring(0,10), { format: 'yyyy-mm-dd' });
	
	$('.checkbox_wrapper').each(function() {
		$(':checkbox', this).after($('label', this));
	});
	
    $('select').material_select();
});
</script>

<%@include file="../mainFooter.jsp" %>