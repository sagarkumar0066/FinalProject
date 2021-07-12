
<%@page import="com.ibm.floraHotel.pojo.Hotel"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Update Room Category</title>
   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
      #centering {
        text-align: center;
        margin: auto;
      }

      body {
        background-image: url(https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);
        background-size: cover;
        /* You must set a specified height */
        background-repeat: no-repeat;
        /* Do not repeat the image */
      }

      input {
        background-color: grey;
        opacity: 80%;
      }
      #bordering{
      border:no;
      margin: auto;
      }
    </style>
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
					</c:if>
					<c:if test="${user.getType() == 'Admin'}">
						<a class="navbar-brand" href="managebooking" style="color:white;text-align:center;" data-toggle="tooltip" title="ManageBooking" data-placement="bottom"><i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;Manage Booking</a>
					</c:if>
					<a class="navbar-brand" href="logout" style="color:white;text-align:center;" data-toggle="tooltip" title="logout" data-placement="bottom"><i class="fa fa-sign-out"></i> Logout</a>
				</c:if>
			</div>
		</div>
	</nav>
    <br><br>
<div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
<div class="container">
  <div class="row">
    <h1 style="text-align: center;">Update Room Category : ${requestScope.hotel.getHotelName()}</h1>
        <div style="width:30%; margin:30px auto;" id="bordering">
            <form action="/floraHotel/hotelupdate/?id='${requestScope.hotel.getId()}'" method="post">
                <div class="form-group">
                    <input class="form-control" name="hotelName" type="text" value="${requestScope.hotel.getHotelName()}" required>
                </div>
                <div class="form-group">
                    <input class="form-control" name="location" type="text" value="${requestScope.hotel.getLocation()}" required>
                </div>
                <div class="form-group">
                  <input class="form-control" name="image" type="text" value="${requestScope.hotel.getImage()}" required>
                </div>
                <div class="form-group">
                        <input class="form-control" name="price" type="text" value="${requestScope.hotel.getPrice()}" required>
                </div>
                <div class="form-group">
                        <input class="form-control" name="description" type="text" value="${requestScope.hotel.getDescription()}" required>
                </div>
                <div class="form-group">
                        <input class="form-control" name="roomavailable" type="text" value="${requestScope.hotel.getRoomAvailable()}" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block">Update Room Category</button>
                </div>
            </form>
        </div>
  </div>
</div>
</div>
</body>
</html>
