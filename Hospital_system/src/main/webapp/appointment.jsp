<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../conponent/css.jsp"%>
<style>
.card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../conponent/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row g-3">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-2">Appointment</p>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						<c:if test="${not empty errMsg }">
						<p class="text-center text-danger fs-3">${errMsg }</p>
						<c:remove var="errMsg"/>
						</c:if>
						<form action="bookAppointment" method="post">

							<!-- Input fields in a single row -->
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Patient's Name</label> <input
										required name="name" type="text" class="form-control">
								</div>
								<div class="col-md-6">
									<label class="form-label">Gender</label> <select required
										name="gender" class="form-control">
										<option>select</option>
										<option>Male</option>
										<option>Female</option>
										<option>Other</option>

									</select>
								</div>
							</div>
							<!-- Qualification field -->
							<input type="hidden" name="userId" value="${userObj.id }">

							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Age</label> <input required
										name="age" type="text" class="form-control">
								</div>
								<div class="col-md-6">
									<label class="form-label">Appointment Date</label> <input
										required name="appodate" type="date" class="form-control">
								</div>
							</div>
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Email Address</label> <input required
										name="email" type="email" class="form-control">
								</div>
								<div class="col-md-6">
									<label class="form-label">Mobile Number</label> <input required
										name="mobno" type="text" class="form-control">
								</div>
							</div>
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Disease</label> <input required
										name="disease" type="text" class="form-control">
								</div>
								<!-- Specialist field -->
								<div class="col-md-6">
									<label class="form-label">Doctor</label> <select required
										name="docname" class="form-control">
										<option>select</option>
										<%
											DoctorDao dao = new DoctorDao(DBconnect.getConnection());

										List<Doctor> list = dao.getAllDoctor();
										for (Doctor d : list) {
										%>
										<option value="<%=d.getId()%>"><%=d.getName()%> (<%=d.getSpecialist()%>)
										</option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<!-- Email and Mobile Number fields in a single row -->


							<!-- Password field -->
							<div class="mb-3">
								<label class="form-label">Address</label> <input required
									name="address" type="text" class="form-control">
							</div>
							<c:if test="${empty userObj }">

								<a href="user.jsp" class="btn btn-primary bg-success">Submit</a>
							</c:if>
							<!-- Submit Button -->
							<c:if test="${not empty userObj }">
								<button type="submit" class="btn btn-primary bg-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>