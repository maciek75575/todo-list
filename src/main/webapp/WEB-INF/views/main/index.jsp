<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m10 offset-m1 l6 offset-l3">
		<div class="card horizontal">
			<div class="card-stacked">
				<form method="POST" action="/login">
					<div class="card-content center-align">
						<h5>Witaj na stronie internetowej listy rzeczy do zrobienia.</h5>
						Aby kontynuować zaloguj się lub załóż konto.
						<div class="row"></div>
						
						<%@include file="../auth/loginForm.jsp"%>
						
						<button class="hidden" id="submitButton" type="submit" name="submit"></button>
					</div>
					<div class="card-action">
						<a class="green-text" href="/signup">Zarejestruj</a>
						<a class="right green-text" style="margin:0px; cursor:pointer;" onclick="$('#submitButton').click();">Zaloguj</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../mainFooter.jsp"%>