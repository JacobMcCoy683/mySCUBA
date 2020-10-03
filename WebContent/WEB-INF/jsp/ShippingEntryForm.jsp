<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shipping Entry Form</title>
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
	<h3>Enter Shipping Details</h3>
	<form:form modelAttribute="shipping" method="post" action="submitShipping">

    <table>
    	<tr>
			<td><p>Enter name*: </p><form:input path="name" /></td>
		</tr>
		<tr>
			<td><p>Enter Address Line 1*: </p><form:input path="addressLine1" required="true"/></td>
		</tr>
		<tr>
			<td><p>Enter Address Line 2: </p><form:input path="addressLine2" /></td>
		</tr>
		<tr>
			<td><p>Enter city*: </p><form:input path="city" required="true" /></td>
		</tr>
		<tr>
			<td><p>Enter state*: </p><form:input path="state" required="true" /></td>
		</tr>
		<tr>
			<td><p>Enter zip*: </p><form:input path="zip" required="true" /></td>
		</tr>
	  <tr>
		<td colspan="2"><input type="submit" value="Submit Shipping Details"></td>
	  </tr>
	
    </table>
</form:form>
</body>
</html>