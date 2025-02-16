<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor login</title>
<%@include file="conponent/css.jsp"%>
<style>
.card {
	/* Add shadows to create the "card" effect */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}
</style>
</head>
<body>
	<%@include file="conponent/navbar.jsp"%>
	<div class="container p-5">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<p class="text-center fs-2">Doctor Login</p>
						<c:if test="${not empty errMsg }">
						<p class="text-center fs-3 text-danger">${errMsg }</p>
						<c:remove var="errMsg"/>
						</c:if>
						<c:if test="${not empty succMsg }">
						<p class="text-center fs-3 text-success">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						<form action="doctorLogin" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Password</label>
								<input type="password" name ="password" class="form-control"
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