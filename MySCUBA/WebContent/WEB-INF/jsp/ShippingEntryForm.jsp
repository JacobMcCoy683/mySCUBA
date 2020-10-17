<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shipping Entry</title>
<style>
#toast-container {
  top: auto !important;
  right: auto !important;
  bottom: 80%;
  left:20%;
  width:60% !important;
    
}
</style>
</head>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
	<form:form modelAttribute="shipping" method="post" action="submitShipping" onsubmit="return validate()">
		<div class="container">
		<h3>Enter Shipping Details</h3>
	      <div class="row">
	        <div class="input-field col s12">
	          <form:input id="full_name" type="text" class="validate" path="name" required="true"/>
	          <label for="full_name">Enter Full Name</label>
	        </div>
	      </div>
	      <div class="row">
	        <div class="input-field col s12">
	          <form:input id="address-1" type="text" class="validate" path="addressLine1" maxlength="20" required="true"/>
	          <label for="address-1">Enter Address Line #1</label>
	        </div>
	      </div>
	      <div class="row">
	        <div class="input-field col s12">
	          <form:input id="address-2" type="text" class="validate" path="addressLine2"/>
	          <label for="address-2">Enter Address Line #2</label>
	        </div>
	      </div>
	      <div class="row">
	        <div class="input-field col s12">
	          <form:input id="city" type="text" class="validate" path="city" required="true"/>
	          <label for="city">Enter City</label>
	        </div>
	      </div>
	      <div class="row">
	        <div class="input-field col s12">
	          <form:input id="state" type="text" class="validate" path="state" required="true"/>
	          <label for="state">Enter State</label>
	        </div>
	      </div>
	      <div class="row">
	        <div class="input-field col s12">
	          <form:input id="zip" type="text" class="validate" path="zip" required="true" minlength="5" maxlength="5" />
	          <label for="zip">Enter Zip Code</label>
	        </div>
	      </div>
	   <br>
    <br>
    <button style="width: 100%;" class="btn waves-effect waves-light btn-large" type="submit" >
    Continue and View Order
    </button>
    <br>
     <br>
      <br>
	  </div>
</form:form>
<jsp:include page="./Footer.jsp"></jsp:include>
<script type="text/javascript">
function validate()
{
	
	
 var card_name = $("#full_name").val();
 var nameregex = /^[A-Za-z]+$/;
 if(card_name.match(nameregex))
 {
	console.log("Name is correct!");
 }
else
 {
	  M.toast({html: '<b>Please enter a valid name!<b>', classes: 'rounded red center white-text flow-text'});
	  //alert("Input Credit Card No.[Starting with 34 or 37, length 15 digits (American Express) and Submit");       
	  return false;
 }
     
 var card_name = $("#city").val();
 var nameregex = /^[A-Za-z]+$/;
 if(card_name.match(nameregex))
 {
	console.log("City is correct!");
 }
else
 {
	  M.toast({html: '<b>Please enter a valid City!<b>', classes: 'rounded red center white-text flow-text'});
	  //alert("Input Credit Card No.[Starting with 34 or 37, length 15 digits (American Express) and Submit");       
	  return false;
 }
    
 var card_name = $("#state").val();
 var nameregex = /^[A-Za-z]+$/;
 if(card_name.match(nameregex))
 {
	console.log("State is correct!");
 }
else
 {
	  M.toast({html: '<b>Please enter a valid State!<b>', classes: 'rounded red center white-text flow-text'});
	  //alert("Input Credit Card No.[Starting with 34 or 37, length 15 digits (American Express) and Submit");       
	  return false;
 }
 
 var cvv = $("#zip").val();
 console.log("ZIP"+cvv);
 var cvvregex = /^[0-9]+$/;
 if(cvv.match(cvvregex))
 {
 	console.log("CVV is correct!");
 }
 else
 {
 	  M.toast({html: '<b>Please enter a valid Zip Code!<b>', classes: 'rounded red center white-text flow-text'});
 	  return false;
 }
 
 return truel
}  
</script>
</body>
</html>