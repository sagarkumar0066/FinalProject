<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.ibm.floraHotel.pojo.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Room Details</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
<style>
body {

 background: url(" ${ requestScope.hotel.getImage()}") no-repeat center center fixed; 
 background-color: #cccccc;
 background-size: cover

}


h1 {
text-shadow: 1px 1px 2px red, 0 0 1em blue, 0 0 0.2em blue;
  color:#010203;
}

	.thumbnail img {
  width : 100%;
}
/* select caption-full class under thumbnail, space in btw!!! */
.thumbnail .caption-full{
  padding: 9px;
}
.thumbnail{

  padding: 50px 50px 50px 50px;
    border:5px solid white;
    border-radius:30px;
    opacity: 80%;
    background-color: white;
    margin: auto;
    margin: 50px;
}
.col-centered{
    float: none;
    margin: 0 auto;
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
	<div class="container">
		<div class="row">
			
			<div class="col-md-9 col-centered">
				<div class="thumbnail">

					<img class="img-responsive" src="${requestScope.hotel.getImage()}" alt="Hotel Image">
					<div class="caption-full">
						<h4 class="pull-right">
							Rs.<c:out value="${requestScope.hotel.getPrice()}" />
							/night
						</h4>
						
						<h4>
							<c:out value="${requestScope.hotel.getHotelName()}" />
						</h4>
						<h4>
							<c:out value="${requestScope.hotel.getLocation()}" />
						</h4>
						<p>
						<h4>
							<c:out value="${requestScope.hotel.getDescription()}" />
						</h4>
						
						<c:set var = "user" scope="session" value="${sessionScope.curUser}"/>
						<c:if test="${user != null}">
							<a class="btn btn-info" href="/floraHotel/hotelbook/?id='${requestScope.hotel.getId()}'">Book</a>
						</c:if>
						<c:if test="${user.getType() == 'Admin'}">
							<a class="btn btn-warning" href="/floraHotel/hotelupdate/?id='${requestScope.hotel.getId()}'">Update</a>
							<a class="btn btn-danger" href="/floraHotel/hoteldelete/?id='${requestScope.hotel.getId()}'">Delete</a>
							
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>