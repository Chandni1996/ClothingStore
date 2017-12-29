<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1>ViewProducts</h1>
<table border="1" class="table table-striped">
<c:forEach var="x" items="${itemsincat}">
<tr>
<td>${ x.getProduct_Id()}</td>
<td>${ x.getProduct_name()}</td>
<td>${ x.getProduct_price()}</td>
<td>${ x.getProduct_image()}</td>
<td><a href="${pageContext.request.contextPath}/forCategoryDeleteProductFromDB/${x.getProduct_Id()}?catid=${catid}">Delete</a></td>
</tr> 
</c:forEach>
</table>
<center><h1><a href="${pageContext.request.contextPath}/AddProducts"><span class="NewUser"></span>Add_Product</a></h1></center>
</body>
</html>