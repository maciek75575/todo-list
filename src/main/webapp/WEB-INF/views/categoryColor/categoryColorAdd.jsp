<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../mainHeader.jsp" %>

<div class="row">
	<form:form class="col s12 m8 offset-m2 l4 offset-l4" method="POST" modelAttribute="formCategoryColor">
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="text" path="primaryColor" name="primaryColor" id="primaryColor" length="100" maxlength="100" class="validate" required="required" />
				<label for="primaryColor">Kolor podstawowy</label>
			</div>
		</div>
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="text" path="primaryCode" name="primaryCode" id="primaryCode" length="7" maxlength="7" pattern="#?[0-9A-Fa-f]{6}" class="validate" required="required" />
				<label for="primaryCode">Kod koloru</label>
			</div>
		</div>
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="text" path="secondaryColor" name="secondaryColor" id="secondaryColor" length="100" maxlength="100" class="validate" required="required" />
				<label for="secondaryColor">Kolor dodatkowy</label>
			</div>
		</div>
      	<div class="row">
			<div class="input-field col s12">
				<form:input type="text" path="secondaryCode" name="secondaryCode" id="secondaryCode" length="7" maxlength="7" pattern="#?[0-9A-Fa-f]{6}" class="validate" required="required" />
				<label for="secondaryCode">Kod koloru</label>
			</div>
		</div>
      	<div class="row center-align">
			<div class="input-field col s12">
				<button class="btn btn-flat waves-effect waves-green" type="submit" name="submit">
					Dodaj<i class="material-icons right">send</i>
  				</button>
			</div>
		</div>
	</form:form>
</div>

<%@include file="../mainFooter.jsp" %>