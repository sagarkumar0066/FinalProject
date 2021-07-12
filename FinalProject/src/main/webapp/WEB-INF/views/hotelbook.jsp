<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Booking</title>
<!-- Latest compiled and minified CSS -->

	<link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <style>

body {

 background: url("https://cdn.pixabay.com/photo/2016/11/30/08/48/bedroom-1872196_960_720.jpg") no-repeat center center fixed; 
 background-color: #cccccc;
 background-size: cover

}
h1 {
  color:#453d3d;
}

input{
opacity:0.7;
}
#bordering{
text-align: center;
margin: auto;
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
                
				<c:if test="${user != null}">
					<a class="navbar-brand" style="color:white;text-align:center;" > <i class="fa fa-fw fa-user" ></i>Logged in as <c:out value="${user.getUserEmail()}" /></a>
					
					<c:if test="${user.getType() == 'User'}">
					<a class="navbar-brand" style="color:white;text-align:center;" href="viewbooking" data-toggle="tooltip" title="ViewBooking" data-placement="bottom"><i class="fa fa-eye"></i>&nbsp;View Booking</a>
					<a class="navbar-brand" href="contactus"
						style="color: white; text-align: center;" data-toggle="tooltip"
						title="Contact us" data-placement="bottom"><i
						class="fa fa-phone"></i> Contact Us</a> 
					</c:if>
					<c:if test="${user.getType() == 'Admin'}">
						<a class="navbar-brand" href="managebooking" style="color:white;text-align:center;" data-toggle="tooltip" title="ManageBooking" data-placement="bottom"><i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;Manage Booking</a>
					</c:if>
					<a class="navbar-brand" href="logout" style="color:white;text-align:center;" data-toggle="tooltip" title="logout" data-placement="bottom"><i class="fa fa-sign-out"></i> Logout</a>
				</c:if>
			</div>
		</div>
	</nav>
<br><br><br>
<div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
	<div class="container">
		<div class="row">
			<h1 id="bordering">Book Room : ${requestScope.hotel.getHotelName()}</h1>
			<div style="width: 50%; margin:auto; padding: 30px;">
				<form action="/floraHotel/hotelbook.htm" method="post">
					<h3 >No. of Room Available : ${requestScope.hotel.getRoomAvailable()}</h3>
					<div class="form-group">
						<input class="form-control" name="hotelName"
							value="${requestScope.hotel.getHotelName()}" type="text"
							readonly="true" placeholder="${requestScope.hotel.getHotelName()}"
							>
					</div>
					<div class="form-group">
						<input class="form-control" name="firstName" type="text"
							placeholder="First Name" required>
					</div>
					<div class="form-group">
						<input class="form-control" name="lastName" type="text"
							placeholder="Last Name" required>
					</div>
					<div class="form-group">
						<input class="form-control" name="phone" type="text"
							placeholder="Mobile No." pattern="[0-9]{10}" required>
					</div>
					<div class="form-group">
						<input class="form-control" name="date" type="date"
							placeholder="Booking Date" required>
					</div>
					<div class="form-group">
						<button class="btn btn-lg btn-primary btn-block">Confirm Booking</button>
					</div>
				</form>
				<a href="/floraHotel/hotels" style="color:Blue;font-weight: bold; font-size: 20px; text-decoration:none;">Go Back</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>