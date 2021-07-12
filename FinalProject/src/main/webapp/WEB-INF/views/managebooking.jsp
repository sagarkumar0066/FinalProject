<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<head><title>Managing Booking</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700')
	;

@import
	url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css")
	;

.row-section h2 {
	float: left;
	width: 100%;
	color: #fff;
	margin-bottom: 30px;
	font-size: 14px;
}

.row-section h2 span {
	font-family: 'Libre Baskerville', serif;
	display: block;
	font-size: 45px;
	text-transform: none;
	margin-bottom: 20px;
	margin-top: 30px;
	font-weight: 700;
}

.row-section h2 a {
	color: #d2abce;
}

.row-section .row-block ul {
	margin: 0;
	padding: 0;
}

.row-section .row-block ul li {
	list-style: none;
	margin-bottom: 20px;
}

.row-section .row-block ul li:last-child {
	margin-bottom: 0;
}

.row-section .row-block ul li:hover {
	cursor: grabbing;
}

.row-section .row-block .media {
	border: 1px solid #d5dbdd;
	padding: 5px 20px;
	border-radius: 5px;
	box-shadow: 0px 2px 1px rgba(0, 0, 0, 0.04);
	background-color: white;
	opacity: 80%;
}

.row-section .media .media-left img {
	width: 75px;
}

.row-section .media .media-body p {
	padding: 0 15px;
	font-size: 14px;
}

.row-section .media .media-body h4 {
	color: #6b456a;
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 0;
	padding-left: 14px;
	margin-top: 12px;
}

.btn-default {
	background: #6B456A;
	color: #fff;
	border-radius: 30px;
	border: none;
	font-size: 16px;
}

body {
	background-image: linear-gradient(to top,#ffd89b,#19547b
 );
	/* fallback for old browsers */
}

.content-span {
	margin-left: 15px;
}
</style>
</head>

<body>
<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: white; text-align: center;"
						href="hotels" data-toggle="tooltip" title="Flora hotels"
						data-placement="bottom"> &nbsp;Flora Hotels
						</a>
				<c:set var="user" scope="session" value="${sessionScope.curUser}" />
                <c:if test="${user == null}">
					<a class="navbar-brand" href="register" style="color:white;text-align:center;" data-toggle="tooltip" title="Registeration" data-placement="bottom"><i class="fa fa-registered"></i>&nbsp;Register</a>
					<a class="navbar-brand" href="login" style="color:white;text-align:center;" data-toggle="tooltip" title="Login" data-placement="bottom"><i class="fa fa-sign-in"></i>&nbsp;Login</a>
				</c:if>
				<c:if test="${user != null}">
					<a class="navbar-brand" style="color:white;text-align:center;" > <i class="fa fa-fw fa-user" ></i>Logged in as <c:out value="${user.getUserEmail()}" /></a>
					<c:if test="${user.getType() == 'User'}">
					<a class="navbar-brand" style="color:white;text-align:center;" href="viewbooking" data-toggle="tooltip" title="ViewBooking" data-placement="bottom"><i class="fa fa-eye"></i>&nbsp;View Booking</a>
					</c:if>
					<c:if test="${user.getType() == 'Admin'}">
						<a class="navbar-brand" href="managebooking" style="color:white;text-align:center;" data-toggle="tooltip" title="ManageBooking" data-placement="bottom"><i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;Manage Booking</a>
					</c:if>
					<a class="navbar-brand" href="logout" style="color:white;text-align:center;" data-toggle="tooltip" title="logout" data-placement="bottom"><i class="fa fa-sign-out"></i> Logout</a>
				</c:if>
			</div>
		</div>
	</nav>
	<section class="row-section">
	<form action="cancelbooking" >
		<div class="container">
			<div class="row">
				<h2 class="text-center">
					<span>Manage Booking</span></h2>
			</div>
			<c:if test="${requestScope.bookings != null}">
				<div class="col-md-10 offset-md-1 row-block">
					<ul id="sortable">
						<c:forEach var="booking" items="${requestScope.bookings}">
							<li><div class="media">
									<div class="media-left align-self-center">
										<img class="rounded-circle"
											src="https://cdn0.iconfinder.com/data/icons/cosmo-finance/40/room-4096.png">
									</div>
									<div class="media-body">
										<h4>
									${booking.getFirstName()}  
									${booking.getLastName()}
									</h4>
										<span class="content-span">${booking.getDate()}</span>
										<span class="content-span">${booking.getPhone()}</span><br>
										
										<span class="content-span"><b>${booking.getHotelName()}</b></span>
										<p>

											<sql:setDataSource var="snapshot"
												driver="com.mysql.jdbc.Driver"
												url="jdbc:mysql://localhost:3306/final" user="root"
												password="1234" />

											<sql:query dataSource="${snapshot}" var="result">
         										Select description from hotel where hotelName= ? 
         											<sql:param value="${booking.getHotelName()}" />

											</sql:query>

											<c:forEach var="row" items="${result.rows}">
												<i><c:out value="${row.description}" /></i>
											</c:forEach>

										</p>

									</div>
									
									<div  class="media-right align-self-center">
									    
									    <input type="text" name="id" value="${booking.getId()}"  hidden/>
										<input class="btn btn-default" type="submit" value="Cancel">
										
									</div>
									
								</div></li>
						</c:forEach>
						</ul>
				</div>
			</c:if>
		</div>
		</form>
	</section>
</body>
<script>
	$(function() {
		$("#sortable").sortable();
		$("#sortable").disableSelection();
	});
</script>

</html>