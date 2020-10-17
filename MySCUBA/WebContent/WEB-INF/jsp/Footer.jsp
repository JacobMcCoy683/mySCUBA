<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	
	<style>
		footer {
			background-color: #008B8B !important;
		}
		body {
		    display: flex;
		    min-height: 100vh;
		    flex-direction: column;
		}
		main {
		    flex: 1 0 auto;
		}
	</style>
</head>
<body>
<footer class="page-footer">
  <div class="container">
    <div class="row">
      <div class="col l6 s12">
        <h5 class="white-text">MySCUBA</h5>
        <p class="grey-text text-lighten-4">Dive deep in a variety of SCUBA equipments</p>
      </div>
      <div class="col l4 offset-l2 s12">
        <h5 class="white-text">Links</h5>
        <ul>
	        <li><a class="grey-text text-lighten-3" href="/MySCUBA/purchase">Purchase</a></li>
	        <li><a class="grey-text text-lighten-3" href="/MySCUBA/aboutus">About Us</a></li>
	        <li><a class="grey-text text-lighten-3" href="/MySCUBA/contactus">Contact Us</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="footer-copyright">
    <div class="container">
    © 2021 MySCUBA
    </div>
  </div>
</footer>

</body>
</html>