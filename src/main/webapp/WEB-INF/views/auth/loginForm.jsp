<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="loginUrl">
	<c:url value="/login" />
</c:set>

<div class="row">
	<form class="col s12" method="POST" action="${loginUrl}">
		<div class="row">
			<div class="input-field col s2 offset-s5">
				<input type="text" name="login" id="login" length="30" maxlength="30" required="required" />
				<label for="login">Nazwa użytkownika</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s2 offset-s5">
				<input type="password" name="password" id="password" length="30" maxlength="30" required="required" pattern=".{6,}" />
				<label for="password">Hasło</label>
			</div>
		</div>
		<div class="row center-align">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<button class="btn waves-effect waves-light" type="submit" name="submit">
				Zaloguj<i class="material-icons right">send</i>
  			</button>
		</div>
	</form>
</div>