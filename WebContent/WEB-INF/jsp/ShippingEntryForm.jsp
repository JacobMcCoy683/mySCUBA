<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shipping Entry Form</title>
</head>
<body>

	<form:form modelAttribute="shipping" method="post" action="submitShipping">

    <table>
    	<tr>
			<td><p>Enter name: </p><form:input path="name" /></td>
		</tr>
		<tr>
			<td><p>Enter addressLine1: </p><form:input path="addressLine1" /></td>
		</tr>
		<tr>
			<td><p>Enter addressLine2: </p><form:input path="addressLine2" /></td>
		</tr>
		<tr>
			<td><p>Enter city: </p><form:input path="city" /></td>
		</tr>
		<tr>
			<td><p>Enter state: </p><form:input path="state" /></td>
		</tr>
		<tr>
			<td><p>Enter zip: </p><form:input path="zip" /></td>
		</tr>
	  <tr>
		<td colspan="2"><input type="submit" value="Submit Shipping Details"></td>
	  </tr>
	
    </table>
</form:form>
</body>
</html>