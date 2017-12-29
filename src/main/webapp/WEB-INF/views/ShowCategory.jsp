<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Category</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<h1> Show Category</h1>
<table border="1" class="table table-striped">
<c:forEach var="x" items="${catlist}">
<tr>
<td>${ x.getCategory_Id()}</td>
<td>${ x.getMain()}</td>
<td>${ x.getSub1()}</td>
<td>${ x.getSub2()}</td>


<%
if (request.isUserInRole("ADMIN"))
{
%>
<td><a href="LinkProducts/${ x.getCategory_Id()}">LinkProducts</a></td>
<td><a href="ViewProducts/${ x.getCategory_Id()}">ViewProducts</a></td>
<td><a href="DeleteCategoryFromDB/${x.getCategory_Id()}">Delete</a></td>
<td><a href="UpdateCategory/${x.getCategory_Id()}">Update</a></td>
<%
}
%>
</tr> 
</c:forEach>
</table>
 <%
if (request.isUserInRole("ADMIN"))
{
%>    
<center><h1><a href="AddCategory"><span class="NewUser"></span>AddCategory</a></h1></center>
<%
}
%>
</body>
</html>