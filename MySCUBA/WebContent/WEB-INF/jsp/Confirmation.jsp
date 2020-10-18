<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
</head>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
<div class="container">
<h4>Order Confirmed #78732</h4>
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
<h1>Thank you!</h1>
<p>Your order number is: <c:out value = "${confirmationCode}"/></p>
<br><br><br>
<a href="/MySCUBA/purchase" style="width:100%" class="start_shopping btn-large waves-effect teal white-text darken-text-2"><b>Shop More</b></a>
<br><br>
</div>
<jsp:include page="./Footer.jsp"></jsp:include>

</body>
</html>