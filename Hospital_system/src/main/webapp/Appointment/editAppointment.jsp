<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Appointment</title>
<%@include file="../conponent/css.jsp"%>
<style>
.card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../conponent/navbar.jsp"%>
	<c:if test="${empty userObj }">
	<c:redirect url="../user.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid p-3">
		<div class="row g-3">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-2">Edit Appointment</p>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						<c:if test="${not empty errMsg }">
						<p class="text-center text-danger fs-3">${errMsg }</p>
						<c:remove var="errMsg"/>
						</c:if>
						<%
						DoctorDao dao2 = new DoctorDao(DBconnect.getConnection());
						List<Doctor> ll = dao2.getAllDoctor();
						AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
						int id=Integer.parseInt(request.getParameter("id"));
						Appointment app=dao.getAppointmentbyId(id);
						int did=app.getDoctorId();
						DoctorDao dd=new DoctorDao(DBconnect.getConnection());
						Doctor d=dd.getDoctorById(did);
						
						%>
						<form action="../editAppointment" method="post">

							<!-- Input fields in a single row -->
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Patient's Name</label> <input
										required name="name" type="text" value="<%=app.getName() %> " class="form-control">
								</div>
								<div class="col-md-6">
									<label class="form-label">Gender</label> <select required
										name="gender" value="<%=app.getGender() %>" class="form-control">
										
										<option>Male</option>
										<option>Female</option>
										<option>Other</option>

									</select>
								</div>
							</div>
							
							<!-- Qualification field -->
							<input type="hidden" name="uId" value="${userObj.id }">
							<input type="text" name="appId" value="<%=app.getId()%>">

							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Age</label> <input required
										name="age" value="<%=app.getAge() %>" type="text" class="form-control">
								</div>
								<div class="col-md-6">
									<label class="form-label">Appointment Date</label> <input
										required name="appodate" value="<%=app.getAppodate() %>" type="date" class="form-control">
								</div>
							</div>
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Email Address</label> <input required
										name="email" value="<%=app.getEmail() %>" type="email" class="form-control">
								</div>
								<div class="col-md-6">
									<label class="form-label">Mobile Number</label> <input required
										name="mobno" value="<%=app.getMobno() %>" type="text" class="form-control">
								</div>
							</div>
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Disease</label> <input required
										name="disease" value="<%=app.getDisease() %>" type="text" class="form-control">
								</div>
								<input type="text" value="<%=d.getId()%>">
								<!-- Specialist field -->
								<div class="col-md-6">
									<label class="form-label">Doctor</label> <select required
										name="doctorname" class="form-control">
										
										<option>select</option>
										 <%
											
										for (Doctor doct : ll) {
										%>
										<option value="<%=doct.getId()%>"> <%=doct.getName()%> (<%=doct.getSpecialist()%>)
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
									name="address" type="text" value="<%=app.getAddress() %>" class="form-control">
							</div>
							
							<!-- Submit Button -->
							<c:if test="${not empty userObj }">
								<button type="submit" class="btn btn-primary bg-success">Update</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>