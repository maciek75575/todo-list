<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m12 l8 offset-l2">
		<div class="card horizontal">
			<div class="card-image hide-on-small-only">
				<img src="/img/main_card.gif">
				<span class="card-title">Witaj</span>
			</div>
      		<div class="card-stacked">
				<div class="card-content">
					<p>I am a very simple card. I am good at containing small bits
						of information. I am convenient because I require little markup to
						use effectively.</p>
						
				<%@include file="../auth/loginForm.jsp"%>
				</div>
				<div class="card-action">
					<a href="#">This is a link</a>
					<a href="#">This is a link</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../mainFooter.jsp"%>