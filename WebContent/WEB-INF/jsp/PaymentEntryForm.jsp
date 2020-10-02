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
<body>
<form:form modelAttribute="payment" method="post" action="submitPayment">

    <table>
		<tr>
			<td><p>Enter Credit Card Number: </p><form:input path="${payment.creditCardNumber}" /></td>
		</tr>
		<tr>
			<td><p>Enter Expiration Date: </p><form:input path="${payment.expirationDate}" /></td>
		</tr>
		<tr>
			<td><p>Enter cvvCode: </p><form:input path="${payment.cvvCode}" /></td>
		</tr>
		<tr>
			<td><p>Enter cardHolderName: </p><form:input path="${payment.cardHolderName}" /></td>
		</tr>
	  <tr>
		<td colspan="2"><input type="submit" value="Submit Payment Details"></td>
	  </tr>
	
    </table>
</form:form>
</body>
</html>