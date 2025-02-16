<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin login page</title>
<%@ include file="conponent/css.jsp" %>
<style>
.card {
	/* Add shadows to create the "card" effect */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}
</style>
</head>
<body>
<%@ include file="conponent/navbar.jsp" %>

<div class="container p-5">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<p class="text-center fs-2">Admin Login</p>
						<c:if test="${not empty succmsg}">
						<p class="text-center text-success fs-3">${succmsg}</p>
						
						<c:remove var="succmsg"/>
						</c:if>
						
						<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-3">${errmsg}</p>
						<c:remove var="errmsg"/>
						</c:if>
						
						
						
						<form action="adminLogin" method="post">
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


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>