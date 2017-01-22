<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp" %>

<div class="row">
	<form:form class="col s12" method="POST" modelAttribute="formAuthorityAdd">
      	<div class="row">
			<div class="input-field col s12 m8 offset-m2 l4 offset-l4">
			    <select path="authority" name="authority" id="authority" required="required">
			        <option value="" disabled="disabled" selected="selected">Wybierz uprawnienie</option>
			        <option value="ROLE_USER">Użytkownik</option>
			        <option value="ROLE_ADMIN">Administrator</option>
			    </select>
			    <label>Kategoria</label>
			</div>
		</div>
      	<div class="row center-align">
			<div class="input-field col s12 offset-m2 l4 offset-l4">
				<button class="btn btn-flat waves-effect waves-green" type="submit" name="submit">
					Dodaj<i class="material-icons right">send</i>
  				</button>
			</div>
		</div>
	</form:form>
</div>

<script>
$(document).ready(function() {
    $('select').material_select();
});
</script>

<%@include file="../mainFooter.jsp" %>