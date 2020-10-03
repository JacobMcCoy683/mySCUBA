<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Order</title>
<style>
html, body {
    height: 100%;
}

html {
    display: table;
    margin: auto;
}

body {
    display: table-cell;
    vertical-align: middle;
}
</style>
</head>
<body>
<h1>Please confirm your order!</h1>


<h4>Order Details</h4>

<table style="border: 1px solid black;margin-left: auto;
  margin-right: auto;">
    <th style="border: 1px solid black;">
	Item 	
	</th>
	<th style="border: 1px solid black;">
	Price	
	</th>
	<th style="border: 1px solid black;">
	Enter Quantity	
	</th>
<c:forEach items="${order.items}" var="item" varStatus="loop">
	
	<tr> 
		<td> <c:out value = "${item.name}"/> </td> 
		<td> <c:out value = "${item.price}"/> </td> 
		<td style="text-align: center;"> <c:out value = "${item.quantity}"/></td>
</tr>		
	
	</p>
</c:forEach>
</table>


<h4>Payment Details</h4>
<table style="border: 1px solid black;margin-left: auto;
  margin-right: auto;">
    <th style="border: 1px solid black;">
	Field 	
	</th>
	<th style="border: 1px solid black;">
	Value	
	</th>
	

<tr><td>Credit Card Number</td><td>${payment.creditCardNumber}</td></tr>
<tr><td>Expiration Date</td><td>${payment.expirationDate}</td></tr>
<tr><td>cvv Code</td><td>${payment.cvvCode}</td></tr>
<tr><td>Card Holder Name</td><td>${payment.cardHolderName}</td></tr>

</table>

<h4>Shipping Details</h4>
<table style="border: 1px solid black;margin-left: auto;
  margin-right: auto;">
    <th style="border: 1px solid black;">
	Field 	
	</th>
	<th style="border: 1px solid black;">
	Value	
	</th>
<tr><td>Name</td><td> ${shipping.name}</td></tr>
<tr><td>Address Line 1</td><td> ${shipping.addressLine1}</td></tr>
<tr><td>Address Line 2</td><td> ${shipping.addressLine2}</td></tr>
<tr><td>City</td><td> ${shipping.city}</td></tr>
<tr><td>State</td><td> ${shipping.state}</td></tr>
<tr><td>Zip</td><td> ${shipping.zip}</td></tr>



<form:form modelAttribute="order" method="post" action="confirmOrder">

    <table>
	  <tr>
		<td colspan="2"><input type="submit" value="Confirm Order"></td>
	  </tr>
    </table>
</form:form>
</body>
</html>