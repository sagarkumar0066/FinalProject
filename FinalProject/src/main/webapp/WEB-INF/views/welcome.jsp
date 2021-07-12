<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
#landing-header {
    z-index: 1;
    position: relative;
    text-align: center;
    padding-top: 40vh;
}
.wordart {
  font-family: Arial, sans-serif;
  font-size: 4em;
  font-weight: bold;
  position: relative;
  z-index: 1;
  display: inline-block;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.wordart.italic-outline {
    transform: scale(1, 1.3);
    -webkit-transform: scale(1, 1.3);
    -moz-transform: scale(1, 1.3);
    -o-transform: scale(1, 1.3);
    -ms-transform: scale(1, 1.3);
}

.wordart.italic-outline .text {
    letter-spacing: -0.01em;
    font-family: Arial, sans-serif;
    font-weight: bold;
    font-style: italic;
    color: #fff;
    -webkit-text-stroke: 0.01em #000;
    filter: progid:DXImageTransform.Microsoft.Glow(Color=#000000, Strength=1);
    text-shadow: 0.03em 0.03em 0 #6D6D6D;
}
.slideshow {
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 0;
    list-style: none;
    margin: 0;
    padding: 0;
}

.slideshow li {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    background-size: cover;
    background-position: 50% 50%;
    background-repeat: no-repeat;
    opacity: 0;
    z-index: 0;
    animation: imageAnimation 50s linear infinite;
}
.slideshow li:nth-child(1) {
    background-image: url(https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80);
    animation-delay: 1s;
}

.slideshow li:nth-child(3) {
    background-image: url(https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80);
    animation-delay: 1s;
}

.slideshow li:nth-child(4) {
    background-image: url(https://images.unsplash.com/photo-1523821741446-edb2b68bb7a0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80);
    animation-delay: 1s;
}

.slideshow li:nth-child(5) {
    background-image: url(https://images.unsplash.com/photo-1487235829740-e0ac5a286e1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1048&q=80);
    animation-delay: 1s;
}

@keyframes imageAnimation {
    0% {
        opacity: 0;
        animation-timing-function: ease-in;
    }

    10% {
        opacity: 1;
        animation-timing-function: ease-out;
    }

    20% {
        opacity: 1
    }

    30% {
        opacity: 0
    }
}

.no-cssanimations .slideshow li {
    opacity: 1;
}
</style>
</head>
<body>
	<div id="landing-header">
		<div class="wordart italic-outline"><span class="text">FLORA Hotels</span></div><br>
		<a href="/floraHotel/hotels" class="btn btn-lg btn-success">Welcome</a>
	</div>

	<ul class="slideshow">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</body>
</html>