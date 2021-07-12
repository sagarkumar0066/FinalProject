<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<%@page import="com.ibm.floraHotel.pojo.Hotel"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>View Rooms</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.navbar {
	color: white;
	background-color: #353839;
}
</style>
</head>

<body style="background-color: white;">
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: white; text-align: center;"
						href="hotels" data-toggle="tooltip" title="Flora hotels"
						data-placement="bottom"> &nbsp;Flora Hotels
						</a>
				<c:set var="user" scope="session" value="${sessionScope.curUser}" />
				<c:if test="${user == null}">
					<a class="navbar-brand" href="register"
						style="color: white; text-align: center;" data-toggle="tooltip"
						title="Registeration" data-placement="bottom"><i
						class="fa fa-registered"></i>&nbsp;Register</a>
					<a class="navbar-brand" href="login"
						style="color: white; text-align: center;" data-toggle="tooltip"
						title="Login" data-placement="bottom"><i class="fa fa-sign-in"></i>&nbsp;Login</a>
						<a class="navbar-brand" href="contactus"
						style="color: white; text-align: center;" data-toggle="tooltip"
						title="Contact us" data-placement="bottom"><i
						class="fa fa-phone"></i> Contact Us</a> 
				</c:if>
				<c:if test="${user != null}">
					<a class="navbar-brand" style="color: white; text-align: center;">
						<i class="fa fa-fw fa-user"></i> Logged in as <c:out
							value="${user.getUserEmail()}" />
					</a>
					
					<c:if test="${user.getType() == 'User'}">
						<a class="navbar-brand" style="color: white; text-align: center;"
							href="viewbooking" data-toggle="tooltip" title="ViewBooking"
							data-placement="bottom"><i class="fa fa-eye"></i>&nbsp;View
							Booking</a>
							
							<a class="navbar-brand" href="contactus"
						style="color: white; text-align: center;" data-toggle="tooltip"
						title="Contact us" data-placement="bottom"><i
						class="fa fa-phone"></i> Contact Us</a> 
					</c:if>
					<c:if test="${user.getType() == 'Admin'}">
						<a class="navbar-brand" href="managebooking"
							style="color: white; text-align: center;" data-toggle="tooltip"
							title="ManageBooking" data-placement="bottom"><i
							class="fa fa-tasks" aria-hidden="true"></i>&nbsp;Manage Booking</a>
					</c:if>
					<a class="navbar-brand" href="logout"
						style="color: white; text-align: center;" data-toggle="tooltip"
						title="logout" data-placement="bottom"><i
						class="fa fa-sign-out"></i> Logout</a>
				</c:if>
			</div>
		</div>
	</nav>
	<header class="jumbotron" style="background-image:linear-gradient(to bottom,#ffa69e,#861657);">
		<div class="container">
			<h1>Flora Hotels</h1>
			<p>Search For Room</p>
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<form action="/floraHotel/hotelsearch" method="POST" id="search-form">
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<input type="text" class="form-control search-slt"
									placeholder="Search By Name" name="searchName" size="120" />
							</div>
							<button class="btn btn-danger wrn-btn">Search</button>
							<c:if test="${user.getType() == 'Admin'}">
								<a class="btn btn-primary btn-large" href="/floraHotel/hoteladddetails">
									Add New Room Category</a>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div style="background-color: white;">
		<div class="row">
			<div class="col-lg-12">
				<h3>View Our Room Categories</h3>
			</div>
		</div>

		<div class="row text-center" style="display: flex; flex-wrap: wrap; ">
			<c:forEach var="hotel" items="${requestScope.hotels}">
				<div class="col-md-3 col-sm-6">
					<div class="thumbnail" >
						<img src="${hotel.getImage()}" style=" width:1100px; height:200px;">
						<div class="caption">
							<h4>
								<c:out value="${hotel.getHotelName()}" />
							</h4>
						</div>
						<p>
							<a class="btn btn-primary"
								href="/floraHotel/hoteldetail/?id='${hotel.getId()}'">More
								Information</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>