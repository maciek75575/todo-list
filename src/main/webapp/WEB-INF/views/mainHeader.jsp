<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo List</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body class="grey lighten-4">

	<header>
		<c:url value="/logout" var="logoutUrl" />
		<form id="logout" action="${logoutUrl}" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<ul id="dropdown1" class="dropdown-content">
		  <li><a href="#!">one</a></li>
		  <li><a href="#!">two</a></li>
		  <li class="divider"></li>
		  <li><a href="#!">three</a></li>
		</ul>
	
		<div class="navbar-fixed">
			<nav>
				<div class="nav-wrapper light-green darken-1">
					<a href="/" class="brand-logo center">ToDo-List</a>
					<ul class="left hide-on-small-only">
						<sec:authorize access="hasRole('ROLE_USER')">
							<li><a href="/task"><i class="material-icons left">assignment_turned_in</i>Zadania</a></li>
							<li><a href="/category"><i class="material-icons left">local_offer</i>Kategorie</a></li>
						</sec:authorize>
					</ul>
					<ul class="right hide-on-small-only">
						<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
							<li><a href="/signup">Rejestracja</a></li>
							<li><a href="/login">Logowanie</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li><a class="dropdown-button" data-activates="dropdown1"><i class="material-icons left">settings</i>Admin<i class="material-icons right">arrow_drop_down</i></a></li>
						</sec:authorize>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<li><a href="/user/profile"><i class="material-icons left">account_circle</i>Profil</a></li>
							<li><a href="javascript:document.getElementById('logout').submit()"><i class="material-icons left">power_settings_new</i>Wyloguj</a></li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</header>
	
	<main style="height:100%;">