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
<title>Create a Job Post</title>
</head>
<body>
	<div class="container">
	<div class="my-4">
		
	<h1>Create a Job Post</h1>
	<p><a href="/home">Back to Dashboard</a></p>
	<form:form action="/post" method="post" modelAttribute="jobPosts">
	
    <p>
        <form:label  path="name">Job Name:</form:label>
        <form:errors path="name"/>
        <form:input path="name" />
    </p>
     <p>
        <form:label path="customerName">Customer Name:</form:label>
        <form:errors path="customerName"/>
        <form:input path="customerName"/>
    </p>   
    <p>
        <form:label path="dayOfWeek">Date:</form:label>
        <form:errors path="dayOfWeek"/>
        <form:input type="date" path="dayOfWeek"/>
    </p>
    <p>
    	<form:label path="amount">Amount:$ </form:label>
		<form:errors path="amount" />
		<form:input type="number" step="0.01" path="amount"/>
    
    </p>
    <p>
        <form:label for="floatingTextArea" path="description">Description:</form:label>
        <form:errors path="description"/>     
        <form:textarea class="form-control" path="description"/>
    </p>    
    <input type="submit" value="Submit"/>			
	
	
	</form:form>
	</div>
	</div>
</body>
</body>
</html>