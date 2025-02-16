<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
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
						<p class="text-center fs-2">Create Account</p>
						<c:if test="${not empty sucmsg }">
						<p class="text-center text-success fs-3">${sucmsg }</p>
						<c:remove var="sucmsg"/>
						</c:if>
						
						<c:if test="${not empty fmsg }">
						<p class="text-center text-danger fs-3">${fmsg }</p>
						<c:remove var="fmsg"/>
						</c:if>
						
						<form action="user_register" method="post">
						<div class="mb-3">
								<label  class="form-label">Full Name
								</label> <input required name="name" type="text" class="form-control"
									>
							</div>
							<div class="mb-3">
								<label  class="form-label">Email
									address</label> 
									<input required name="email" type="email" class="form-control"
									>
							</div>
							<div class="mb-3">
								<label  class="form-label">Password</label>
								<input required name="password" type="password" class="form-control"
									>
							</div>
							
							<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
							
							</form>
							
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="conponent/footer.jsp" %>
</body>
</html>