<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp" %>

<div class="row">
	<form:form class="col s12" method="POST" modelAttribute="formAuthorityAdd">
      	<div class="row">
			<div class="input-field col s12 m8 offset-m2 l4 offset-l4">
				<form:input type="text" path="authority" name="authority" id="authority" length="100" maxlength="100" required="required" />
				<label for="name">Uprawnienie</label>
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

<script src="/script/catColorPicker.js"></script>

<%@include file="../mainFooter.jsp" %>