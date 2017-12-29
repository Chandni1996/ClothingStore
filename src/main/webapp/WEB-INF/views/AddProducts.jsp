<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Products</title>
</head>
<body>
<h1>Add Products</h1>

<form:form action="AddProductToDB" method="post" modelAttribute="pro" enctype="multipart/form-data">
 <form:input type="text" placeholder="Enter name" path="Product_name"/>
 <form:input type="text" placeholder="Enter price" path="Product_price"/>
 <form:input type="file" placeholder="Enter image name" name ="file" path="file"/>
 <input type="submit" value="Add"/>
</form:form>
<a href="ShowProducts">Show</a>
</body>
</html>