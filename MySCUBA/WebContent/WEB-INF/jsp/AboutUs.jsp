<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>About Us</title>
	<style>
	.page-block {
	    height:60vh; 
	}
	.header-div {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	</style>
</head>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
<div class="teal page-block header-div">
	<h1 class="white-text z-depth-5 hoverable" style="border-radius: 12px 5px;">The MySCUBA Story</h1>
</div>
<div class="page-block header-div">
	<div class="center-align" style="text-align:center">
	<div class="container">
		<h6 class="flow-text">
			We put our customers first. We are committed to providing word-class SCUBA equipment to divers, making their diving and memorable experience.We are a team of driven professionals and SCUBA enthusiasts who strive for excellent consumer experience.We are a team of driven professionals and SCUBA enthusiasts who strive for excellent consumer experience.
		</h6>
		<h6 class="flow-text">
			We are a team of driven professionals and SCUBA enthusiasts who strive for excellent consumer experience.
		</h6>
	</div>
	</div>
</div>

<div class="teal page-block header-div">
	<h1 class="white-text z-depth-5 hoverable" style="border-radius: 12px 5px;"> Our Team </h1>
</div>
<div class="container">
	<div class="row">
    <div class="col s4">
      <div class="card hoverable">
	    <div class="card-image waves-effect waves-block waves-light">
	      <img class="circle activator responsive-img " src="https://i.ibb.co/WpGGzTy/Anuj-Pahade.jpg" alt="Anuj-Pahade" />
	    </div>
	    <div class="card-content">
	      <span class="card-title activator grey-text text-darken-4">Anuj Pahade<i class="material-icons right">more_vert</i></span>
	      <p>Co-founder</p>
          <p><a href="https://www.linkedin.com/in/anuj-pahade/">Learn More</a></p>
	    </div>
	    <div class="card-reveal">
	      <span class="card-title grey-text text-darken-4">Anuj Pahade<i class="material-icons right">close</i></span>
	      <p>Co-founder</p>
	      <p>Anuj Pahade is a graduate Computer Science student at The Ohio State University. He's an expert in JavaScript and web design.</p>
	    </div>
	  </div>
    </div>
    <div class="col s4">
    </div>
    <div class="col s4">
      <div class="card hoverable">
	    <div class="card-image waves-effect waves-block waves-light">
	      <img class="activator" src="images/Jacob.jpeg">
	    </div>
	    <div class="card-content">
	      <span class="card-title activator grey-text text-darken-4">Jacob McCoy<i class="material-icons right">more_vert</i></span>
	      <p>Co-founder</p>
	      <p><a href="https://www.linkedin.com/in/jacob-mccoy-b5b03b1b9">Learn More</a></p>
	    </div>
	    <div class="card-reveal">
	      <span class="card-title grey-text text-darken-4">Jacob McCoy<i class="material-icons right">close</i></span>
	      <p>Co-founder</p>
	      <p>Jacob McCoy is an undergraduate student at The Ohio State University. He's an expert in Java and OOP. He is also an enthusiastic diver and brings that passion into finding the best diving products.</p>
	    </div>
	  </div>
    </div>
  </div>
	
  
</div>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>