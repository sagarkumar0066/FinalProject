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

 background: url("https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062_960_720.jpg") no-repeat center center fixed; 
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
    
        <div style="width:30%; margin:auto;" >
        <h1 style="text-align:center">Add New Room Category</h1>
        
            <form action="/floraHotel/hoteladd" method="post">
                <div class="form-group">
                    <input class="form-control" name="hotelName" type="text" placeholder=" Enter Hotel Name" required>
                </div>
                <div class="form-group">
                    <input class="form-control" name="location" type="text" placeholder="Enter Location" required>
                </div>
                <div class="form-group">
                  <input class="form-control" name="image" type="text" placeholder="Enter Image URL" required>
                </div>
                <div class="form-group">
                        <input class="form-control" name="price" type="text" pattern="[0-9]*" placeholder="Enter Price" required>
                </div>
                <div class="form-group">
                        <input class="form-control" name="description" type="text" placeholder="Enter Description" required>
                </div>
                
                <div class="form-group">
                        <input class="form-control" name="roomavailable" type="text" placeholder="Enter Room Availability Count" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block">Add Room Category</button>
                </div>
            </form>
        </div>
  </div>
</div>
</div>
</body>
</html>