<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Details</title>
<c:import url="/Head"/>
</head>
<body>

<c:import url="/Navbar123"/>

<c:forEach items="${itemsinview}" var="x">
 	    <h4>${x.getProduct_name()}</h4>  
	 	<img src="${x.getProduct_image()}"/><br><br>
	 	<p style="font-color:black; font-size:16px;">Price : ${x.getProduct_price()}</p>
	 
</c:forEach>
<form action="${pageContext.request.contextPath}/AddToCart" method="post">

	<input type="hidden"  name="cartproductid" value="${ppid}"/>
                
    <input type="text"  placeholder="Enter Product Quantity"  name="cartQuantity" style="width:16%;"/><br><br>
    <input type="hidden" value="BUY" name="process"/>
    <button type="submit" class="btn btn-primary btn-md" style="width:16%; background-color: rgb(26, 26, 0);"> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp ADD TO CART</button>
    
</form>
</body>
</html>