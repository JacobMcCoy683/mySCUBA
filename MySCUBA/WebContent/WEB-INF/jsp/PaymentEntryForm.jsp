<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Payment Entry</title>
</head>
<style>
#toast-container {
  top: auto !important;
  right: auto !important;
  bottom: 80%;
  left:20%;
  width:60% !important;
    
}
</style>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
<form:form modelAttribute="payment" method="post" action="submitPayment"  onsubmit="return validate()">
	<div class="container">
	<h3>Enter Payment Details</h3>
      <div class="row">
        <div class="input-field col s12">
          <form:input id="card_name" type="text" class="validate" path="cardHolderName" required="true"/>
          <label for="card_name">Enter Card Holder Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <form:input id="card_number" type="text" class="validate" path="creditCardNumber" minlength="15" maxlength="15" required="true"/>
          <label for="card_number">Enter Credit Card Number</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <form:input id="exp_date" type="date" class="validate" path="expirationDate" required="true"/>
          <label for="exp_date">Enter Expiration Date</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <form:input id="cvv" type="password" class="validate" path="cvvCode"  minlength="3" maxlength="3" required="true"/>
          <label for="cvv">Enter CVV Code</label>
        </div>
      </div>
<br>
    <br>
    <button id="submitpayment" style="width: 100%;" class="btn waves-effect waves-light btn-large" type="submit" >
    Continue and Enter Shipping Details
    </button>
    <br>
     <br>
      <br>  </div>
</form:form>
<jsp:include page="./Footer.jsp"></jsp:include>
<script type="text/javascript">
function validate()
{
	
	
 var card_name = $("#card_name").val();
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
 console.log("Card Number is:"+ccn);
  var cardno = /^(?:3[47][0-9]{13})$/;/*Input Credit Card No.[Starting with 34 or 37, length 15 digits (American Express) and Submit */
  var ccn = $("#card_number").val();
if(ccn.match(cardno))
        {
	  console.log("CCN is correct!");
        }
      else
        {
    	  M.toast({html: 'Invalid Credit Card!', classes: 'rounded red center white-text flow-text'});
    	  return false;
        }
        
        
var cvv = $("#cvv").val();
console.log("CCCVVV"+cvv);
var cvvregex = /^[0-9]+$/;
if(cvv.match(cvvregex))
{
	console.log("CVV is correct!");
}
else
{
	  M.toast({html: '<b>Please enter a valid CVV!<b>', classes: 'rounded red center white-text flow-text'});
	  return false;
}
  return true;
}
</script>
</body>
</html>