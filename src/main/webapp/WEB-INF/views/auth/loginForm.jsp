<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">
	<div class="input-field col s12">
		<input type="text" name="login" id="login" length="30" maxlength="30" required="required" />
		<label for="login">Nazwa użytkownika</label>
	</div>
</div>
<div class="row">
	<div class="input-field col s12">
		<input type="password" name="password" id="password" length="30" maxlength="30" required="required" pattern=".{6,}" />
		<label for="password">Hasło</label>
	</div>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">