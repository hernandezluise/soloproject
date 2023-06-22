<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<title>Auto Repair Trackers</title>
</head>
<body>
	<nav class="navbar justify-content-around mb-1 my-4">
	
	<h1>
		Welcome, <c:out value="${user.name }" />
	</h1>
	<p>
		<a href="/logout">log out</a>
	</p>
	</nav>
	
	<div class="container">
	<h2 class="my-4">Job Schedule</h2>


	<table class="table table-hover">
		<thead class="table-success">
			<tr>
				<th>Job Name</th>
				<th>Customer</th>
				<th>Date</th>
				<th>Price</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="jobPosts" items="${jobPosts}">
				<tr>
					<td>
					<a href="<c:url value='/post/${jobPosts.id }#jobPostId' /> ">${jobPosts.name }</a>
							
					<c:if test="${user.name == jobPosts.user.name }">
						<form action="/posts/${jobPosts.id}/edit">
							<input type="submit" value="edit"/>
						</form>
					</c:if>
						
						</td>
					<td>${jobPosts.customerName }</td>
					<td><c:out value="${jobPosts.dayOfWeek }" /></td>
					<td>$<c:out value="${jobPosts.amount }" /></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="/post/new">+ new job post </a>
	</p>
	</div>
</body>
</html>