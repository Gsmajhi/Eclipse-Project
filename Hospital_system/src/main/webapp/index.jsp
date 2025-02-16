<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Project</title>

<%@include file="conponent/css.jsp"%>
<style>
.card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

<body>
	<%@include file="conponent/navbar.jsp"%>
	<%
		Connection conn = DBconnect.getConnection();
	out.print(conn);
	%>
	<c:if test="${not empty succMsg }">
	<p class="text-center text-success fs-3">${succMsg }</p>
	<c:remove var="succMsg"/>
	</c:if>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/doc4.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<div class="container p-3">
		<p class="text-center fs-2">Key features</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>

							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>

							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-6 mt-2">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>

							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container p-2">
		<p class="text-center fs-2">Our team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<img src="img/doc4.jpg" class="card-img-top" alt="..."
						width="250px" height="300px">
					<div class="card-body text-center">
						<p class="fw-bold fs-5">Dr.Yogi</p>
						<p class="fs-7">CEO.</p>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<img src="img/doc3.jpg" width="250px" height="300px">
					<div class="card-body text-center">
						<p class="fw-bold fs-5">Dr.Hemlata</p>
						<p class="fs-7">MD</p>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<img src="img/doc2.jpg" class="card-img-top" alt="..."
						width="250px" height="300px">
					<div class="card-body text-center">
						<p class="fw-bold fs-5">Dr.Haripriya</p>
						<p class="fs-7">Chairman.</p>

					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<img src="img/doc1.png" class="card-img-top" alt="..."
						width="250px" height="300px">
					<div class="card-body text-center">
						<p class="fw-bold fs-5">Dr.Gs</p>
						<p class="fs-7">Chief Doctor</p>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="conponent/footer.jsp"%>
</body>
</html>