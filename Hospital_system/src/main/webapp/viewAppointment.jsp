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
	<%@include file="conponent/navbar.jsp"%>
	<c:if test="${empty userObj }">
	<c:redirect url="user.jsp"></c:redirect>
	</c:if> 
	<div class="container-fluid p-3">

		<div class="row">
			
			<div class="col-offset-md-10 ">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Appointment</p>
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
									
									<th scope="col">Disease</th>
									<th scope="col">Doctor</th>
									
									<th scope="col">Status</th>
									<th scope="col">Action</th>


								</tr>

							</thead>
							<tbody>
								<%
									DoctorDao dao2 = new DoctorDao(DBconnect.getConnection());
								List<Doctor> ll = dao2.getAllDoctor();
								AppointmentDao dao=new AppointmentDao(DBconnect.getConnection());
								
								User u=(User)session.getAttribute("userObj");
								int id=u.getId();
								
								List<Appointment> list=dao.viewAppointment(id);
								;
								
								for(Appointment app:list)
								{%>
									<tr>
								
									
									<td><%=app.getName()%></td>
									<td><%=app.getGender()%></td>
									<td><%=app.getAge()%></td>
									<td><%=app.getAppodate()%></td>
										
									<td><%=app.getDisease()%></td>		
									<td><%int did=app.getDoctorId();
								Doctor d=dao2.getDoctorById(did);%><%=d.getName()%>(<%=d.getSpecialist() %>)</td>
									<%
									if("Pending".equals(app.getStatus()))
									{%>
									<td><a class="btn btn-5m btn-warning"><%=app.getStatus()%></a></td>
									<%}
									else{%>
										<td><a class="btn btn-5m btn-success"><%=app.getStatus()%></a></td>
									<%}
									
									
									%>
									
														
									<td><a href="Appointment/editAppointment.jsp?id=<%=app.getId() %>"
										class="btn btn-5m btn-primary">Edit</a> <a href=""
										class="btn btn-5m btn-danger">Delete</a></td>
								</tr>
							<%	}
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