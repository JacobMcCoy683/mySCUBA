<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Order Entry</title>

</head>
<body>
<jsp:include page="./Header.jsp"></jsp:include>
<div class="container">
<c:if test = "${!validQuantity}">
	<h5 style="color:#ff0000;">Sorry, there is currently not enough of your selected items in stock.<br>Please resubmit item quantities.</h5>
</c:if>
<form:form modelAttribute="order" method="post" action="purchase/submitItems">
	<table class="centered highlight">
		 
		<thead>
		<tr>
		    <th colspan="2"><h3>Products</h3></th>
			<th colspan="2"><h3>Price</h3></th>
			<th><h3>Quantity</h3></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${order.items}" var="item" varStatus="loop">
			<tr>
				
					<td colspan="2">
					<div class="teal white-text">
					<form:hidden path="items[${loop.index}].name" value="${item.name}"/><h4><c:out value="${item.name}"></c:out></h4>
					</div>
					<img style="max-width:50%;height:20%;" src="images/${loop.index}.jpg">
					</td>	
					
					
					<td colspan="2">
					 <form:hidden path="items[${loop.index}].price" value="${item.price}"/><h5>$<c:out value="${item.price}"></c:out><h5>
					</td>
					
					<form:hidden path="items[${loop.index}].available" value="${item.available}"/>
					<td>
						<div class="row">
						<div class="col s5"></div>
						<div class="col s2">	
						<form:input style="font-size:25px; display:inline;" class="ajaxbtn" id="${loop.index}" type="number" path="items[${loop.index}].quantity" size="4" min="0" />
						</div>
						<div class="col s5">/${item.available}</div>
						</div>
					</td>
			</tr>
		</c:forEach>
		 <tbody>
    </table>
    <br>
    <br>
    <button style="width: 100%;" class="btn waves-effect waves-light btn-large" type="submit" >
    Continue and enter payment details
    </button>
    <br>
    
</form:form>
</div>
  <br>
    <br>
<jsp:include page="./Footer.jsp"></jsp:include>
<script>
console.log("ON ORDER ENTRY FORM");
$(".ajaxbtn").on('click keyup',function(){
	var curr_val = parseInt($(this).val());
	console.log("Current quantity is:"+curr_val);
	var item_id = $(this).attr('id');
	console.log("Current item is:"+item_id);
	$.ajax({
	    type : "GET",
	    url : "/MySCUBA/purchase/qty?item="+item_id,
	    contentType: 'text/plain',
	    success: function(result){
	    	//result+=" "+curr_val;
	    	var available = parseInt(result);
	    	if(available==0){
	    		$(this).val('0');
	    		alert("Out of stock. Sorry :(");
	    		$("#"+item_id).val(available);
	    	}else if(available<curr_val){
	    		alert("Only "+available+" available in stock.")
	    		$("#"+item_id).val(available);
	    	}
	        $("#ajaxop").html(result);
	        
	        console.log(result);
	      },
	});
});


</script>
</body>
</html>