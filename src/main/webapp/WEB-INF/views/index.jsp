<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo List</title>
</head>

<body>
	<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
		<a href="signup">Zarejestruj</a><br>
		<a href="login">Zaloguj</a>
	</sec:authorize>
	<c:url value="/logout" var="logoutUrl" />
	<form id="logout" action="${logoutUrl}" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<a href="javascript:document.getElementById('logout').submit()">Wyloguj</a><br>
	</c:if>
	<a href="users">Lista użytkowników</a>
</body>
</html>