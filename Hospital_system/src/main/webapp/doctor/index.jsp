<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.DoctorDao" %>
    <%@page import="com.entity.Doctor" %>
    <%@page import="com.entity.Appointment" %>
    <%@page import="com.dao.AppointmentDao"%>
    <%@page import="com.conn.DBconnect" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
<c:if test="${empty doctorObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp"%>


<div class="container p-5"> 
<p class="text-center fs-3">Doctor Dashboard</p>
<c:if test="${not empty succMsg }">
      <p class="text-center text-success fs-3">${succMsg }</p>
      <c:remove var="succMsg" />
      </c:if>
      
      <c:if test="${not empty errorMsg }">
      <p class="text-center text-danger fs-3">${errorMsg }</p>
      <c:remove var="errorMsg" />
      </c:if>
      <%
      Doctor d=(Doctor)session.getAttribute("doctorObj");
      DoctorDao dao=new DoctorDao(DBconnect.getConnection());
      %>
    <div class="row">
        <div class="col-md-4 offset-md-2">
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
                    <i class="fa-solid fa-calendar-check"></i><br>
                    <p class="fs-4 text-center">Appointment<br><%=dao.countAppointmentbyDoctorid(d.getId()) %></p>
                </div>
            </div>
        </div>
        
       
    </div>
    
</div>





</body>
</html>