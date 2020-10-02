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
<h1>Please confirm your order!</h1>
<p></p>
<h4>Order Details</h4>
<c:forEach items="${order.items}" var="item" varStatus="loop">
	<p>
	<p>	<c:out value = "${item.name}"/> : <c:out value = "${item.quantity}"/><p>
	
	</p>
</c:forEach>


<h4>Payment Details</h4>
<p>creditCardNumber: ${payment.creditCardNumber}</p>
<p>expirationDate: ${payment.expirationDate}</p>
<p>cvvCode: ${payment.cvvCode}</p>
<p>cardHolderName: ${payment.cardHolderName}</p>


<h4>Shipping Details</h4>
<p>Name: ${shipping.name}</p>
<p>Addr1: ${shipping.addressLine1}</p>
<p>Addr2: ${shipping.addressLine2}</p>
<p>City: ${shipping.city}</p>
<p>State: ${shipping.state}</p>
<p>Zip: ${shipping.zip}</p>


<form:form modelAttribute="order" method="post" action="confirmOrder">

    <table>
	  <tr>
		<td colspan="2"><input type="submit" value="Confirm Order"></td>
	  </tr>
    </table>
</form:form>
</body>
</html>