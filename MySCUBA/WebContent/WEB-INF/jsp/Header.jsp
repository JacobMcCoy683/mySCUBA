<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<meta charset="ISO-8859-1"></meta>
	<style>
		nav{
		  background-color: #008B8B !important;
		}
		.nav-lis{
		}
	</style>
</head>
<body>
 <!--  -->
<div class="navbar-fixed">
	 <nav>
	    <div class="nav-wrapper">
	      <a href="/MySCUBA/" class="brand-logo center" style="font-size: 35px;">MySCUBA</a>
	      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	      <ul class="right hide-on-med-and-down">
	      	<li class="nav-lis"><a href="/MySCUBA/" style="font-size: 22px;">Home</a></li>
	        <li class="nav-lis"><a href="/MySCUBA/purchase" style="font-size: 22px;">Purchase</a></li>
	        <li class="nav-lis"><a href="/MySCUBA/aboutus" style="font-size: 22px;">About Us</a></li>
	        <li class="nav-lis"><a href="/MySCUBA/contactus" style="font-size: 22px;">Contact Us</a></li>
	      </ul>
	    </div>
	  </nav>
</div>

<ul class="sidenav" id="mobile-demo">
	<li><a href="/MySCUBA/">Home</a></li>
	<li><a href="/MySCUBA/purchase">Purchase</a></li>
    <li><a href="/MySCUBA/aboutus">About Us</a></li>
    <li><a href="/MySCUBA/contactus">Contact Us</a></li>
</ul>
 
        

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
	  $(document).ready(function(){
	    $('.sidenav').sidenav();
	  });
</script>
</body>
</html>