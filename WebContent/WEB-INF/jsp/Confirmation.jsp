<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h4>Order Confirmed #78732</h4>
<h4>Order Details</h4>
<c:forEach items="${order.items}" var="item" varStatus="loop">
	<p>
	<p>	<c:out value = "${item.name}"/> : <c:out value = "${item.quantity}"/><p>
	
	</p>
</c:forEach>
<h1>Thank you!</h1>
<p>Your order #78732 is on the way</p>
</body>
</html>