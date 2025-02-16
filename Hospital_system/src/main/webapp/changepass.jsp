<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="conponent/css.jsp"%>
<style>
.card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<c:if test="${empty userObj }">
<c:redirect url="user.jsp"></c:redirect>
</c:if>
<%@include file="conponent/navbar.jsp"%>
<div class="container p-5">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<p class="text-center fs-2">Change Password</p>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						
						<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg }</p>
						<c:remove var="errorMsg"/>
						
						</c:if>
						<form action="changePassword" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Old Password
									</label> <input name="oldpass" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">New Password</label>
								<input name="newpass" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<input type="hidden" name="uId" value="${userObj.id }">
							<button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
							
							</form>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>