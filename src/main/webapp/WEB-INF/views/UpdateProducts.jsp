<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>
</head>
<body>
<h1>Update Product </h1>

 
  <form:form action="/ClothingStore/UpdateProductToDB" method="post" modelAttribute="pro" enctype="multipart/form-data">
    <form:input type="hidden"  path="Product_Id"/>
   <form:input type="text"  placeholder="Enter Name" path="Product_name"/>
      <form:input type="text"  placeholder="Enter Price" path="Product_price"/>
      <form:input type="file" placeholder="Enter image name" path="file"/>
  <input type="submit" value="Update"/>
</form:form>


</body>
</html>