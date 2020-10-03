<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
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
<h4>Order Confirmed #78732</h4>
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
<h1>Thank you!</h1>
<p>Your order #78732 is on the way</p>
</body>
</html>