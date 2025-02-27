
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.conn.DBconnect"%>
	<%@page import="com.dao.SpecialistDao"%>
	<%@page import="com.dao.DoctorDao"%>
	<%@page import="java.util.List"%>
	<%@page import="com.entity.Specialist"%>
	<%@page import="com.entity.Doctor"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../conponent/css.jsp"%>
<style>
.card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<p class="text-center fs-2">Edit Doctor Details</p>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg }</p>
							<c:remove var="succMsg" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg }</p>
							<c:remove var="errorMsg" />
						</c:if>
						<% int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2=new DoctorDao(DBconnect.getConnection());
						Doctor d=dao2.getDoctorById(id);
						
						
						%>
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Doctor's Name </label> <input required
									name="name" type="text" value=" <%=d.getName() %>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB </label> <input required
									name="dob" type="date" value="<%=d.getDob() %>" class="form-control">
								</div>

								<div class="mb-3">
									<label class="form-label">Qualification </label> <input
										required name="qualificatin" type="text" value="<%=d.getQualif() %>" class="form-control">
								</div>

							
							<div class="mb-3">
								<label class="form-label">Specialist </label> <select required
									name="spec" class="form-control">
									<option><%=d.getSpecialist() %></option>
									<% SpecialistDao dao=new SpecialistDao(DBconnect.getConnection());
									List<Specialist> list=dao.getAllSpecialist();
									for(Specialist s:list)
									{%>
										<option><%=s.getSpecialistName()%></option>
									<%
									}
									
									
									%>
									</select>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" value="<%=d.getEmail() %>" class="form-control">
							</div>
					
					<div class="mb-3">
						<label class="form-label">Mobile Number</label> <input required
							name="mobno" type="text" value="<%=d.getMobno() %>" class="form-control">
					</div>
					
					
					<div class="mb-3">
						<label class="form-label">Password</label> <input required
							name="password" type="text" value="<%=d.getPassw() %>"  class="form-control">
					</div>
					<input type="hidden" name="id" value="<%=d.getId() %>">
					<button type="submit" class="btn btn-primary bg-success" >Update</button>

					</form>

				</div>
			</div>
		</div>
		
	</div>

	</div>

</body>
</html>
