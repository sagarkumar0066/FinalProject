
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#bordering {
	
	padding: 220px 50px 50px 50px;
	border: no;
	border-radius: 30px;
	opacity: 80%;
    color: black;
}
.navbar{
color: white;
}
.form-signin {
	max-width: 500px;
	margin: auto;
}

h1 {
	color: black;
    font-weight: bold;
    font-size: 50px;
}

label {
	background-color: grey;
}

body {
	background-image:
		url(https://images.unsplash.com/photo-1508796079212-a4b83cbf734d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80);
}
.form-control {
	font-size : 25px;
}

</style>
</head>

<body>
	<nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="hotels">
         <i class="fa fa-fw fa-home"></i>
         Rooms </a>
    </nav>
	<c:if test="${requestScope.getAlert == 'yes'}">
		<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>Login Failed! Wrong UserId / Password</strong>
		</div>
	</c:if>
	<div class="text-center" id="bordering">
		<form class="form-signin" action="login" method="POST">
			<h1  id="sign-in-title" class="h3 mb-3 font-weight-normal">
				<b>Enter your Login Credentials</b></h1>
			<label for="inputUsername" class="sr-only">UserName</label> <input
				class="form-control" type="text" name="userEmail"
				placeholder="Enter your Login Email" required autofocus> <br>
                <label
				for="inputPassword" class="sr-only">Password</label> 
                <input class="form-control" type="password" name="password"
				placeholder="Enter your Login Password" required autofocus><br>
			<div class="form-group">
				<select class="form-control" name="type" id="type">
					<option>User</option>
					<option>Admin</option>
				</select>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				Login</button>
		</form>
	</div>
</body>

</html>