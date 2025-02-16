<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@page import="com.conn.DBconnect"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../conponent/css.jsp" %>
<style>
.card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
card-body i {
    font-size: 50px; /* Larger icon size */
}
.card-body p {
    font-size: 10px; /* Smaller text size */
    margin: 0;
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty doctorObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<div class="container-fluid p-3">

		<div class="row">
			
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Appointment</p>
						
						<table class="table">
							<thead>
								<tr>
									
									<th scope="col">Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appo Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob no</th>
									<th scope="col">Disease</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>


								</tr>

							</thead>
							<tbody>
							<%
						Doctor d=(Doctor)session.getAttribute("doctorObj");
						AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
						List<Appointment> list=dao.getAllAppointmentsbyDoctorId(d.getId());
						for(Appointment app:list)
						{%>
							
								<tr>
								<td><%=app.getName() %></td>
								<td><%=app.getGender() %></td>
								<td><%=app.getAge() %></td>
								<td><%=app.getAppodate() %></td>
								<td><%=app.getEmail() %></td>
								<td><%=app.getMobno() %></td>
								<td><%=app.getDisease() %></td>
								<td><%=app.getStatus() %></td>
								<td>
								<%
								if("Pending".equals(app.getStatus()))
								{%>
									<a href="../approveAppointment?id=<%=app.getId() %>" class="btn btn-5m btn-primary">Approve</a>
								
								<%}
								else{%>
									<a href="#" class="btn btn-5m btn-primary disabled">Approved</a>
								<%}
								
								
								
								%>
								</td>
								</tr>
						<%}
						
						
						%>
						
							
							
							</tbody>

						</table>
					</div>

				</div>



			</div>
		</div>

	</div>

</body>
</html>