<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<form:form class="col s12 m12 l10 offset-l1" method="POST"
		modelAttribute="formUserEdit">
		<div class="col s12">
			<div class="input-field col s12 m6 offset-m3">
				<i class="material-icons prefix">face</i>
				<form:input type="text" path="firstName" name="firstName"
					id="firstName" autocomplete="off" length="40" maxlength="40"
					required="required" />
				<label for="firstName">Imię *</label>
			</div>
		</div>
		<div class="col s12">
			<div class="input-field col s12 m6 offset-m3">
				<i class="material-icons prefix">face</i>
				<form:input type="text" path="lastName" name="lastName"
					id="lastName" autocomplete="off" length="40" maxlength="40" />
				<label for="lastName">Nazwisko</label>
			</div>
		</div>
		<div class="col s12">
			<div class="input-field col s12 m6 offset-m3">
				<i class="material-icons prefix">account_circle</i>
				<form:input type="text" path="login" name="login" id="login"
					autocomplete="off" length="30" maxlength="30" pattern="\w+"
					required="required" />
				<label for="login">Nazwa użytkownika *</label>
			</div>
		</div>
		<div class="col s12">
			<div class="input-field col s12 m6 offset-m3">
				<i class="material-icons prefix">email</i>
				<form:input type="email" path="email" name="email" id="email"
					autocomplete="off" length="254" maxlength="254" required="required" />
				<label for="email">E-mail *</label>
			</div>
		</div>
		<div class="col s12">
			<div class="input-field col s12 m6 offset-m3">
				<i class="material-icons prefix">phone</i>
				<form:input type="tel" path="phoneNumber" name="phoneNumber"
					id="phoneNumber" autocomplete="off" length="11" maxlength="11"
					pattern="(?=.*\d).{9,}" />
				<label for="phoneNumber">Numer telefonu</label>
			</div>
		</div>
		<div class="col s12">
			<div class="col s12 m6 offset-m3">
				<div class="checkbox_wrapper">
					<form:checkbox path="enabled" name="enabled" id="enabled" />
					<label for="enabled" style="color:black;">Aktywny</label>
				</div>
			</div>
		</div>

		<div class="row center-align">
			<div class="col s12">
				<button class="btn btn-flat waves-effect waves-green" type="submit"
					name="submit">
					Zapisz<i class="material-icons right">send</i>
				</button>
			</div>
		</div>
	</form:form>
</div>


<script>
	$(document).ready(function() {
		$('.checkbox_wrapper').each(function() {
			$(':checkbox', this).after($('label', this));
		});
	});
</script>

<%@include file="../mainFooter.jsp"%>