<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category</title>
</head>
<body>
<h1>Add Category</h1>

<form:form action="AddCategoryToDB" method="post" modelAttribute="cat">
 <form:input type="text" placeholder="Enter Main" path="Main"/>
 <form:input type="text" placeholder="Enter Sub1" path="Sub1"/>
 <form:input type="text" placeholder="Enter Sub2" path="Sub2"/>
 
 <input type="submit" value="Add"/>
</form:form>
<a href="ShowCategory">Show</a>
</body>
</html>