<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../mainHeader.jsp"%>

<div class="row">
	<div class="col s12 m10 offset-m1 l8 offset-l2 center-align">
		<table class="highlight">
			<thead>
				<tr>
					<th>Nazwa</th>
					<th colspan=2>Kolory</th>
					<th style="width:100px">
						<a class="btn-floating right blue waves-effect waves-light" href="/category/add">
							<i class="large material-icons">add</i>
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${categories}">
					<tr>
						<td>${category.name}</td>
						<td><div class="btn-floating ${category.categoryColor.primaryColor}" style="cursor:default;"></div> ${category.categoryColor.primaryColor}</td>
						<td><div class="btn-floating ${category.categoryColor.secondaryColor}" style="cursor:default;"></div> ${category.categoryColor.secondaryColor}</td>
						<td class="right-align">
							<a class="btn-floating green waves-effect waves-light" href="/category/edit-${category.id}"><i class="material-icons">mode_edit</i></a>
							<a class="btn-floating red waves-effect waves-light" href="/category/remove-${category.id}"><i class="material-icons">delete_forever</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="waves-effect waves-light btn" href="/">Strona główna<i class="material-icons right">subdirectory_arrow_left</i></a>
	</div>
</div>

<%@include file="../mainFooter.jsp"%>