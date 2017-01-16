<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<form:form class="col s12 m12 l10 offset-l1" id="formUserUpdate"
		method="POST" modelAttribute="formUserUpdate">
		<div class="col s12 m6 offset-m3">
			<div class="input-field col s12">
				<i class="material-icons prefix">face</i>
				<form:input type="text" path="firstName" name="firstName"
					id="firstName" autocomplete="off" length="40" maxlength="40"
					required="required" />
				<label for="firstName">Imię *</label>
			</div>
		</div>
		<div class="col s12 m6 offset-m3">
			<div class="input-field col s12">
				<i class="material-icons prefix">face</i>
				<form:input type="text" path="lastName" name="lastName"
					id="lastName" autocomplete="off" length="40" maxlength="40" />
				<label for="lastName">Nazwisko</label>
			</div>
		</div>
		<div class="col s12 m6 offset-m3">
			<div class="input-field col s12">
				<i class="material-icons prefix">phone</i>
				<form:input type="tel" path="phoneNumber" name="phoneNumber"
					id="phoneNumber" autocomplete="off" length="11" maxlength="11"
					pattern="(?=.*\d).{9,}" />
				<label for="phoneNumber">Numer telefonu</label>
			</div>
		</div>
		<div class="row center-align">
			<div class="input-field col s12">
				<button class="btn btn-flat waves-effect waves-green" type="submit"
					name="submit">
					Zapisz<i class="material-icons right">send</i>
				</button>
			</div>
		</div>
	</form:form>
</div>

<%@include file="../mainFooter.jsp"%>