<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user login</title>
<%@include file="conponent/css.jsp" %>
<style>
.card {
	/* Add shadows to create the "card" effect */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

</style>
</head>
<body>
<%@include file="conponent/navbar.jsp" %>
<div class="container p-5">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<p class="text-center fs-2">User Login</p>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						
						<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg }</p>
						<c:remove var="errorMsg"/>
						
						</c:if>
						<form action="userlogin" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Password</label>
								<input name="password" type="password" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
							
							</form>
							<br>Don't have an account?<a href="signup.jsp" class="text-decoration-none">create one</a>

					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="conponent/footer.jsp" %>
</body>
</html>