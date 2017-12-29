<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<c:import url="/Head"/>
<script src="resources/js/angular.min.js"></script>
<style>
a {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}

a:hover {
    background-color: #ddd;
    color: black;
}

.previous {
    background-color: #f1f1f1;
    color: black;
}

.next {
    background-color: #4CAF50;
    color: white;
}

.round {
    border-radius: 50%;
}
</style>
</head>
<script type="text/javascript">
 
 
 var myApp = angular.module('myApp',[]);
	
		myApp.factory('CartService', ['$http', '$q', function($http, $q)
		{
			
			var target_url = 'http://localhost:9090/ClothingStore/';
	        
    	return {
         
            removeItems: function(item){
            	
            	
                    return $http.post( target_url + 'removeFromCart')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while sending data');
                                        return $q.reject(errResponse);
                                    }
                              );
            }         ,
            
            	
    	
    };
 
}]);
		
		myApp.controller("abc",['$scope', 'CartService' ,function($scope , $CartService)
			{
				console.log('abc');
			
				$CartService.removeItems( )
		        	.then
		        	(
		        			function(response)
		        			{
		        				console.log(response);
		        
		        			},
		        			 
		     	            function(errResponse)
		     	            {
		     	            	console.error('Error while Sending Data.');
		     	            } 
		        	);	
			
		    			        
			}]); 
		
		
			
		</script>
 
<body ng-app="myApp" ng-controller="abc">
<c:import url="/Navbar123"/>
<center> <h1>Your Order Placed Successfully</h1></center>
<center> <h1>Thank You</h1></center>
 
<center><a href="${pageContext.request.contextPath}/Home" class="next">&laquo; Back to Home Page</a><center>

</html>