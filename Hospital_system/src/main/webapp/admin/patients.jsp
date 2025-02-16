<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../conponent/css.jsp"%>
<style type="text/css">
.card {
    box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
} 

</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container-fluid p-3">

		<div class="row">
			
			<div class="col-offset-md-10 ">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Patients Details</p>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						<c:if test="${not empty errMsg }">
						<p class="text-center text-success fs-3">${errorMsg }</p>
						<c:remove var="errorMsg"/>
						</c:if>
						
						<table class="table">
							<thead>
								<tr>
									
									<th scope="col">Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appo Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mobno</th>
									<th scope="col">Disease</th>
									<th scope="col">Doctor</th>
									<th scope="col"> Address</th>
									<th scope="col">Status</th>
									
									<th scope="col">Action</th>


								</tr>

							</thead>
							<tbody>
								<%
								AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
								List<Appointment> list=dao.getAllAppointment();
								DoctorDao dao2=new DoctorDao(DBconnect.getConnection());
								for(Appointment app:list)
								{
								Doctor d=dao2.getDoctorById(app.getDoctorId());
								%>
									<tr>
								
									
									<td><%=app.getName() %></td>
									<td><%=app.getGender() %></td>
									<td><%=app.getAge() %></td>
									<td><%=app.getAppodate() %></td>
										
									<td><%=app.getEmail() %></td>		
									<td><%=app.getMobno() %>
								</td>
									
									<td><%=app.getDisease() %></td>
									<td><%=d.getName() %></td>	
									<td><%=app.getAddress() %></td>		
									<td><%=app.getStatus() %></td>	
									<td><a href=""
										class="btn btn-5m btn-primary">Edit</a> <a href=""
										class="btn btn-5m btn-danger">Delete</a></td>
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