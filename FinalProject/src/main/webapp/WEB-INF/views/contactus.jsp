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
   <title>Booking</title>
   <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>

body {

 background-image:linear-gradient(to bottom,#bdc3c7,#2c3e50); 
 background-color: #cccccc;
 background-size: cover

}

#bordering{
border:5px solid white;

border-radius: 30px;
width: 70%;
padding: 30px 30px 30px 30px;
margin: auto;
}
input{
opacity:0.7;
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
<div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
<div class="container" id="#bordering">
<br><br><br>
  <div class="row">
    
        <div style="width:70%; margin:auto;" >
        <h1> Contact Us</h1>
<p style="font-size: 20px; color: white;">If you want more information or want to request for a quotation, please send an <br>
email to @florahotels@gmail.com.<br>

Flora Hotels<br>
Sanjeev Nagar,Near Tower clock<br>
Ananthapur <br>
AndhraPradesh<br>
Tel. +91 97837837737, email @florahotels@gmail.com</p>
        </div>
  </div>
</div>
</div>
</body>
</html>