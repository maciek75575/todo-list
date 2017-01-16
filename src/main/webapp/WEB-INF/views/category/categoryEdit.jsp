<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp" %>

<div class="row">
	<form:form class="col s12 m8 offset-m2 l6 offset-l3" method="POST" modelAttribute="formCategory">
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="text" path="name" name="name" id="name" length="100" maxlength="100" class="validate" required="required" />
				<label for="name">Nazwa</label>
			</div>
		</div>
      	<div class="row">
			<div class="col s12 center_align">
				<c:forEach var="color" items="${colors}">
					<div class="col s4 m4 l3 pad-only colpicd">
	      				<form:radiobutton path="categoryColor" name="categoryColor" id="color${color.id}" value="${color.id}" />
	      				<label class="colpic no-space center-align z-depth-3 waves-effect waves-circle waves-light" style="background: linear-gradient(to bottom, ${color.primaryCode} 50%, ${color.secondaryCode} 50%);" for="color${color.id}">
	      					<i class="material-icons valign colpicd white-text">done</i>
	      				</label>
      				</div>
      			</c:forEach>
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

<script>
$(document).ready(function() {
	$('#color${formCategory.categoryColor.id}').attr('checked','checked');
});
</script>
<script src="/script/catColorPicker.js"></script>

<%@include file="../mainFooter.jsp" %>