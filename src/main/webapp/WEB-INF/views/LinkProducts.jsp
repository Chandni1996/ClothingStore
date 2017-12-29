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
<title>LinkProducts</title>
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
<h1>LinkProducts</h1>
<form action="${pageContext.request.contextPath}/LinkProductsWithCategory" method="post">

<input type="hidden" name="catId" value="${catId}" >

<c:if test="${empty Product_list}">
<h1 class="alert alert-danger">No Products to Link</h1>
</c:if>

<table border="1" class="table table-striped">


<c:forEach var="x" items="${Product_list}">
<tr>
<td>${ x.getProduct_Id()}</td>
<td>${ x.getProduct_name()}</td>
<td>${ x.getProduct_price()}</td>
<td>${ x.getProduct_image()}</td>
<td><input type="checkbox" name="Products" value="${ x.getProduct_Id()}"></td>
</tr> 
</c:forEach>
</table>
<input type="submit" value="Submit">
</form>


</body>
</html>