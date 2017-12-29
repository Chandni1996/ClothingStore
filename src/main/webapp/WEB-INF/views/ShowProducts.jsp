<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
    
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

<script type="text/javascript" src="resources/js/angular.min.js"></script>
<script type="text/javascript">
var myApp = angular.module('myApp',[]);
myApp.controller('myCntrl',function($scope){

    $scope.data =[];
    try
    {
        $scope.data = ${productData};
        console.log($scope.data);
    }

    catch(e)
    {
        $scope.data =[];
    }
    
});
</script>
</head>
<body ng-app="myApp" ng-controller="myCntrl">
<h1> Show Products</h1>
<table border="1" class="table table-striped">
<c:forEach var="x" items="${Product_list}">
<tr>
<td>${ x.getProduct_Id()}</td>
<td><a href= "ProductDetails/${x.getProduct_Id()}">${ x.getProduct_name()}</a></td>
<td>${ x.getProduct_price()}</td>
<td><img src="${ x.getProduct_image()}" /></td>

		<%
if (request.isUserInRole("ADMIN"))
						{
							%>
    <td><input type="checkbox" name="Products" value="Category_Id"></td>
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