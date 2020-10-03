<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Order Entry</title>
	<link rel="stylesheet" href="../../css/styles.css">
</head>
<body>
<form:form modelAttribute="order" method="post" action="purchase/submitItems">

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
			<td><form:hidden path="items[${loop.index}].name" value="${item.name}"/><c:out value="${item.name}"></c:out></td>
			<td>$<form:hidden path="items[${loop.index}].price" value="${item.price}"/><c:out value="${item.price}"></c:out></td>
			<td style="text-align: center;"><form:input path="items[${loop.index}].quantity" /></td>
		</tr>
	</c:forEach>

	  <tr>
		<td colspan="2"><input type="submit" value="Purchase"></td>
	  </tr>
	
    </table>
</form:form>
</body>
</html>