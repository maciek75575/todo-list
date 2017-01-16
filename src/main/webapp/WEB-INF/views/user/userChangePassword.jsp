<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<form:form class="col s12 m12 l10 offset-l1" method="POST"
		modelAttribute="formUserChangePassword">
		<div class="col s12 m6 offset-m3">
			<div class="input-field col s12">
				<i class="material-icons prefix">lock</i>
				<form:input type="password" path="oldPassword" name="oldPassword"
					id="password" autocomplete="off" length="30" maxlength="30"
					pattern="\w{6,}" required="required" />
				<label for="password">Hasło *</label>
			</div>
		</div>
		<div class="col s12 m6 offset-m3">
			<div class="input-field col s12">
				<i class="material-icons prefix">lock</i>
				<form:input type="password" path="newPassword" name="newPassword"
					id="password" autocomplete="off" length="30" maxlength="30"
					pattern="\w{6,}" required="required" />
				<label for="password">Hasło *</label>
			</div>
		</div>
		<div class="col s12 m6 offset-m3">
			<div class="input-field col s12">
				<i class="material-icons prefix">lock</i>
				<form:input type="password" path="repeatPassword"
					name="repeatPassword" id="repeatPassword" autocomplete="off"
					length="30" maxlength="30" pattern="\w{6,}" required="required" />
				<label for="repeatPassword">Powtórz hasło *</label>
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