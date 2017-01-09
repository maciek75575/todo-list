<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<form class="col s12 m8 offset-m2 l6 offset-l3" method="POST" action="/login">
	
		<%@include file="loginForm.jsp"%>

		<div class="row center-align">
			<button class="btn btn-flat waves-effect waves-green" type="submit" name="submit">
				Zaloguj<i class="material-icons right">send</i>
  			</button>
		</div>
	</form>
</div>

<%@include file="../mainFooter.jsp"%>