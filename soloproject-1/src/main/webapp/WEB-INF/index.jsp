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
<title>Auto Repair Tracker</title>
</head>
<body>
	<div class="container">

		<h1 class="my-4">Auto Repair Tracker</h1>

		<div class="row gx-4">
				<div class="col">
				<div class="p-3 px-6 my-4">
				
				
				
				<form:form action="/register" method="post" modelAttribute="newUser">


					<div class="form-control p-3 my-4" >
						<form:label path="name">Name: </form:label>
						<form:errors path="name" />
						<form:input path="name" />

					</div>
					<div class="form-control p-3 my-4">
						<form:label path="email">Email: </form:label>
						<form:errors path="email" />
						<form:input path="email" />

					</div>
					<div class="form-control p-2 my-4">
						<form:label path="password">Password: </form:label>
						<form:errors path="password" />
						<form:input path="password" type="password" />

					</div>
					<div class="form-control p-2 my-4">
						<form:label path="confirm">Confirm Password: </form:label>
						<form:errors path="confirm" />
						<form:input path="confirm" type="password" />

					</div>
					<div class="my-3">
						<input type="submit" value="Register" />
					</div>
				</form:form>
				</div>
			</div>


			<div class="col">
				<div class="p-3 px-6 my-4">
								
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<h2>Log in</h2>

					<div>

						<div class="form-control p-2 my-4">
							<form:label path="email">Email: </form:label>
							<form:errors path="email" />
							<form:input path="email" />

						</div>
						<div class="form-control p-2 my-4">
							<form:label path="password">Password: </form:label>
							<form:errors path="password" />
							<form:input path="password" type="password" />

						</div>
						<div class="my-3">
							<input type="submit" value="Login" />
						</div>
					</div>

				</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>