<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Order</title>
</head>
<body>
<jsp:include page="./Header.jsp"></jsp:include>

<div class="container">
<form:form modelAttribute="order" method="post" action="confirmOrder">
<h1>Please confirm your order!</h1>


<h4>Order Details</h4>

<table class="centered highlight">
  <thead>
  <tr>
    <th>
	Item 	
	</th>
	<th>
	Price	
	</th>
	<th>
	Quantity	
	</th>
	</tr>
</thead>
<c:forEach items="${order.items}" var="item" varStatus="loop">
	
	<tr> 
		<td> <c:out value = "${item.name}"/> </td> 
		<td> $<c:out value = "${item.price}"/> </td> 
		<td> <c:out value = "${item.quantity}"/></td>
</tr>		
	
</c:forEach>
</table>


<h4>Payment Details</h4>
<table class="centered highlight">
<thead>
    <tr>
 
    <th>
	Field 	
	</th>
	<th>
	Value	
	</th>
	</tr>
	</thead>

<tr><td>Credit Card Number</td><td>${payment.creditCardNumber}</td></tr>
<tr><td>Expiration Date</td><td>${payment.expirationDate}</td></tr>
<tr><td>cvv Code</td><td>${payment.cvvCode}</td></tr>
<tr><td>Card Holder Name</td><td>${payment.cardHolderName}</td></tr>

</table>

<h4>Shipping Details</h4>
<table class="centered highlight">
  	<thead>
    <tr>
 
    <th>
	Field 	
	</th>
	<th>
	Value	
	</th>
	</tr>
	</thead>
<tr><td>Name</td><td> ${shipping.name}</td></tr>
<tr><td>Address Line 1</td><td> ${shipping.addressLine1}</td></tr>
<tr><td>Address Line 2</td><td> ${shipping.addressLine2}</td></tr>
<tr><td>City</td><td> ${shipping.city}</td></tr>
<tr><td>State</td><td> ${shipping.state}</td></tr>
<tr><td>Zip</td><td> ${shipping.zip}</td></tr>
</table>


    
 <br>
    <br>
    <button style="width: 100%;" class="btn waves-effect waves-light btn-large" type="submit" >
    Confirm and Place order
    </button>
    <br>
     <br>
      <br>
</form:form>
</div>
<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>