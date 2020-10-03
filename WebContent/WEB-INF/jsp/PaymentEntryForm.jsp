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
<body>
<form:form modelAttribute="payment" method="post" action="submitPayment">
	<h3>Enter Payment Details</h3>
    <table>
		<tr>
			<td><p>Enter Credit Card Number: </p><form:input path="creditCardNumber" /></td>
		</tr>
		<tr>
			<td><p>Enter Expiration Date: </p><form:input path="expirationDate" /></td>
		</tr>
		<tr>
			<td><p>Enter cvv Code: </p><form:input path="cvvCode" /></td>
		</tr>
		<tr>
			<td><p>Enter Card Holder Name: </p><form:input path="cardHolderName" /></td>
		</tr>
	  <tr>
		<td colspan="2"><input type="submit" value="Submit Payment Details"></td>
	  </tr>
	
    </table>
</form:form>
</body>
</html>