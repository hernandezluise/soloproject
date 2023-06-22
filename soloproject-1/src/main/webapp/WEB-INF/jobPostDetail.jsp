<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<title>Job Post Detail</title>
</head>
<body>
	<div class="container">
	<div class="my-4 p-2">
	
		<h1 class="my-4">
			<c:out value="${jobPosts.name }" />
			, with
			<c:out value="${jobPosts.customerName }" />
		</h1>
		<h3 class="my-4">
			Date:
			<c:out value="${jobPosts.dayOfWeek }" />
		</h3>
		<h3 class="my-4">
			Cost: $<c:out value="${jobPosts.amount }" />
		</h3>
		<h3 class="my-4">
			Description: <c:out value="${jobPosts.description }" />
		</h3>

	<p>
		<a href="/home">Back to Dashboard</a>
	</p>
	</div>
	</div>
</body>
</html>