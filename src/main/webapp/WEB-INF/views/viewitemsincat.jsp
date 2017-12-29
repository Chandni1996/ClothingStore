<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Displaying Add_Product Page</h1>
<table border="1">
<c:forEach var="x" items="${itemsincat}">
<tr>
<td>${ x.getProduct_Id()}</td>
<td><a href= "Product_Details/${x.getProduct_Id()}">${ x.getProduct_name()}</a></td>
<td>${ x.getProduct_price()}</td>
<td>${ x.getProduct_image()}</td>
		
		<%
if (request.isUserInRole("ADMIN"))
						{
							%>
    
	<td><a href="DeleteProductFromDB/${x.getProduct_Id()}">Delete</a></td>
		<td><a href="UpdateProduct/${x.getProduct_Id()}">Update</a></td>
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
    
    <center><h1><a href="AddProducts"><span class="NewUser"></span>Add_Product</a></h1></center>
        
        <%
						}
        %>

</body>
</html>