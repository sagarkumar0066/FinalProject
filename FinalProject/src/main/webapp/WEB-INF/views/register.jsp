<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.form-signin {
	max-width: 330px;
	margin: auto;
}
.col-centered{
    float: none;
    margin: 0 auto;
}

body{
background-image:linear-gradient(to top,#13547a,#80d0c7);
}
</style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" style="color: white; text-align: center;"
						href="hotels" data-toggle="tooltip" title="Flora hotels"
						data-placement="bottom"> &nbsp;Flora Hotels
						</a>
    </nav>
	<c:if test="${requestScope.getAlert == 'yes'}">
		<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>Registration Failed!</strong>
		</div>
	</c:if>
    <div class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
		<div class="row">
		<div class="col-md-12 col-centered">
	<div class="text-center">
		<form class="form-signin" action="register" method="POST">
			<h1 id="sign-in-title" class="h3 mb-3 font-weight-normal">
				Create your Credentials</h1><br>
			<label for="inputUsername" class="sr-only">UserName</label> <input
				class="form-control" type="text" name="userEmail"
				placeholder="Enter Email" required autofocus> <br>
                <label for="inputPassword" class="sr-only">Password</label> <input
				class="form-control" type="password" name="password"
				placeholder="Enter Password" required autofocus><br>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				Confirm Credentials</button>
		</form>
	</div>
    </div>
    </div>
    </div>

</body>
</html>
