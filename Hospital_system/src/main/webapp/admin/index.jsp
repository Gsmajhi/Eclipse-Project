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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../conponent/css.jsp"%>
<style>
.modal-header,
.modal-footer {
    border: none;
}
 .card {
    box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
} 
.card-body i {
    font-size: 50px; /* Larger icon size */
}
.card-body p {
    font-size: 20px; /* Smaller text size */
    margin: 0;
}
.card-body i:hover {
      transform: scale(1.05);
      /* box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s, box-shadow 0.3s; */
    }
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${ empty adminObj }">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="container p-5"> 
<p class="text-center fs-3">Admin Dashboard</p>
<c:if test="${not empty succMsg }">
      <p class="text-center text-success fs-3">${succMsg }</p>
      <c:remove var="succMsg" />
      </c:if>
      
      <c:if test="${not empty errorMsg }">
      <p class="text-center text-danger fs-3">${errorMsg }</p>
      <c:remove var="errorMsg" />
      </c:if>
      <%
      DoctorDao dao=new DoctorDao(DBconnect.getConnection());
      %>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center text-success">
                    <i class="fa-solid fa-user-doctor"></i><br>
                    <p class="fs-4 text-center">Doctor<br><%=dao.countDoctor() %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center text-success">
                    <i class="fa-solid fa-circle-user"></i><br>
                    <p class="fs-4 text-center">User <br><%=dao.countUser() %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center text-success">
                    <i class="fa-solid fa-calendar-check"></i><br>
                    <p class="fs-4 text-center">Appointment<br><%=dao.countAppointment() %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-2">
            <div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body text-center text-success">
                    <i class="fa-solid fa-user-doctor"></i><br>
                    <p class="fs-4 text-center">Specialist<br><%=dao.countSpecialist() %></p>
                </div>
            </div>
        </div>
    </div>
    
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <form action="../addSpecialist" method="post">
        
								<label  class="form-label">Specialist
								</label> <input required name="specname" type="text" class="form-control"
									>
						      <div class="text-center mt-3">
						      
						      <button type="submit" class="btn btn-primary" >Add</button>
						      </div>  
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>


</body>
</html>
