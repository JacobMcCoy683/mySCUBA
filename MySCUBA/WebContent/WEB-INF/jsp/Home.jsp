<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>mySCUBA</title>
	<style>
		.carousel {
		    height: 80vh !important;
		}
		.page-block {
		    height: 80vh !important; 
		}
		.overlay {
			position:absolute;
		}
	</style>
</head>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
<div class="page-block parallax-container">
  	<div class="carousel carousel-slider center">
	  	<div class="carousel-fixed-item center">
	  		<a href="/MySCUBA/purchase" class="start_shopping btn-large waves-effect white teal-text darken-text-2"><b>Start Shopping</b></a>
	  		<div class="center-align">
	  			<h2><a href="/MySCUBA/purchase"><span  class="white teal-text z-depth-5 hoverable" style="border-radius: 12px 12px 12px 12px;">&nbsp;&nbsp;&nbsp;&nbsp;Dive deep in variety of SCUBA products&nbsp;&nbsp;&nbsp;&nbsp;</span></a></h2>
	  		</div>
	    </div>
	    
	    <div class="parallax carousel-item" href="#one!">
	    	<img src="https://lonelyplanetwpnews.imgix.net/2019/01/scuba-diving-bahrain.jpg"> 
	    </div>
	    
	    <div class="parallax carousel-item" href="#two!">
	    	<img src="https://www.deeperblue.com/wp-content/uploads/2016/03/AdobeStock_62701813.jpeg">
	    </div>
	    
	    <div class="parallax carousel-item" href="#three!">
	    	<img src="http://awesomeocean.com/wp-content/uploads/2016/02/Scuba-Diving-Sabah.jpg">
	    </div>
	    
	    <div class="parallax carousel-item" href="#four!">
	    	<img src="https://greenyogaindia.com/wp-content/uploads/2016/07/scuba_diving.jpg">
	    </div>
 	 </div>
	
</div>
<div class="">
	<div class="container">
		
		<div class="row">
		<div class="col s1"></div>
		<div class="col s4">
			<h3 class="center teal white-text" style="border-radius: 12px 12px 12px 12px;">Our Mission</h3>
			<div class="center">
				<p style="font-size:18px">To provide you with all the SCUBA gear you need for your next dive</p>
			</div>
		</div>
		<div class="col s2"></div>
		<div class="col s4">
			<h3 class="center teal white-text" style="border-radius: 12px 12px 12px 12px;">Our Essence</h3>			
			<div class="center">
				<p style="font-size:18px">High quality SCUBA gear for every diver at fair prices</p>
			</div>
		</div>
		<div class="col s1"></div>
		</div>
		
		<div class="row">
		<div class="col s1"></div>
		<div class="col s4">
			<h3 class="center teal white-text" style="border-radius: 12px 12px 12px 12px;">Our Promise</h3>
			<div class="center">
				<p style="font-size:18px">Whether all you need is an extra mask or an entire setup, you can find everything you need right here</p>
			</div>
		</div>
		<div class="col s2"></div>
		<div class="col s4">
			<h3 class="center teal white-text" style="border-radius: 12px 12px 12px 12px;">Our Vibe</h3>
			<div class="center">
				<p style="font-size:18px">Easy to use, easy to contact</p>
			</div>
		</div>
		<div class="col s1"></div>
		</div>
	</div>
</div>
<div class="parallax-container">
      
	      <div class="">
		      <div class="row">
			      <div class="col s3">
			      
			      	</div>
			      	<div class="col l6">
			      		<div>
			      			<h2 class="center"><span class="center teal-text white" style="border-radius: 12px 12px 12px 12px;">&nbsp;&nbsp;&nbsp;&nbsp;Happy Customers&nbsp;&nbsp;&nbsp;&nbsp;</span></h2>
			      		</div>
			      	</div>
			      	<div class="col s3">
			      	
			      	</div>
		      </div>
	      
	   	<div class="row">
		      <div class="col s4 white flow-text">
		      	<blockquote>
	      			I'm a brand-new diver. After looking for a place to buy all my gear, nowhere compared to this site. Couldn't be happier!! 
	    				<p class="right">- <i>Lorem Ipsum</i></p>
	    		</blockquote>
		      	</div>
		      	<div class="col s4 white flow-text">
		      		<blockquote>
	      			After my BCD had a hole torn in it, I decided to give this place a try. Found what I wanted in a matter of minutes, received it right on time and now I'm back in the water!
	      			<p class="right">- <i>Lorem Ipsum</i></p>
	    		</blockquote>
		      	</div>
		      	<div class="col s4 white flow-text">
		      	<blockquote>
	      			Wanted to buy a backup regulator for my upcoming destination dive. Here, the price was right!
	    				<p class="right">- <i>Lorem Ipsum</i></p>
	    		</blockquote>
		      	</div>
	      </div>
	       </div>
	      <div class="parallax">
      	  <img class="gifbg" src="https://media3.giphy.com/media/YtOzpQAehGOdi/giphy.gif">
      </div>
     

 </div>
 
<jsp:include page="./Footer.jsp"></jsp:include>
<script>
	$('.carousel.carousel-slider').carousel({
	    fullWidth: true,
	    //indicators: true
	  });
	  
	autoplay();
	function autoplay() {
	    $('.carousel').carousel('next');
	    setTimeout(autoplay, 4000);
	}
	$('.start_shopping').click(function(event){
	    //event.preventDefault();
	    // do some stuff
	
	    // then manually go to the next page
	    window.location.href = this.href;
	});
	$(document).ready(function(){
	    $('.parallax').parallax();
	  });
</script>
</body>
</html>