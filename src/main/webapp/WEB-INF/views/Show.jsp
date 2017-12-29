<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<c:import url="Head.jsp"/>
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
<c:import url="Navbar.jsp"/>
      <c:forEach var="main" items="${catTree.keySet()}">
     
     
     		<c:forEach var="sub1" items="${catTree.get(main).keySet()}">
     
     
     			<c:forEach var="sub2" items="${catTree.get(main).get(sub1)}">
     
	     			<c:set var="oe" value="0"/>
	 
	 				<c:forTokens items="${sub2}" delims=";;" var="s">
	 				
	 					<c:choose>
	 					
	 						<c:when test="${oe == 0}">
	 							<h5>${s}</h5>
	 							<c:set var="oe" value="1"/>
	 						</c:when>
	 					
	 						<c:otherwise>
	 							<h5>${s}</h5>
	 							
	 							<c:forEach var="prod" items="${catDataMap.get(s)}">
	 							
	 								<h4><a href="${pageContext.request.contextPath}/ProductDetails/${prod.getProduct_Id()}">${prod.getProduct_name()}</a></h4>
	 								<a href="${pageContext.request.contextPath}/ProductDetails/${prod.getProduct_Id()}"><img src="${prod.getProduct_image()}"/></a>
	 								<h5>Price : ${prod.getProduct_price()}</h5>
	 								<hr>
	 								
	 							
	 							</c:forEach>
	 							
	 							<c:set var="oe" value="0"/>
	 						</c:otherwise>
	 					
	 					</c:choose>
	 				
	 					<br>
	 				
	 				</c:forTokens>
	     
	     		</c:forEach>
     
     		</c:forEach>
     		
      </c:forEach>
 
 
</body>
</html>