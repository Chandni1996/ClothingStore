<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
             <%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<c:import url="/Head"/>
<script src="resources/js/angular.min.js"></script>

<style type="text/css">
.Harrington {
    font-family: Harrington;
    font-weight: bold;
    font-size: 50px;
    color: rgb(26, 26, 0);
    text-shadow: 3px 2px rgb(26, 26, 0);
}
.Lucida {
    font-family: Lucida Fax;
    color: rgb(26, 26, 0);
    font-size: 20px;
}
</style>    
    
<script type="text/javascript">
		var myApp = angular.module('myApp',[]);
	
		myApp.factory('CartService', ['$http', '$q', function($http, $q)
		{
			
			var target_url = 'http://localhost:9090/ClothingStore/';
	 
    	return {
         
            updateAddresses: function(item){
            	
            	
                    return $http.post( target_url + 'updateAddresses', item)
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
				$scope.adr = '';
				$scope.billingaddress = '';
		        	
		        $scope.updateAddresses = function()
		        {
		        	$scope.data = { "adr" : $scope.adr , "billingaddress" : $scope.billingaddress };
		        	
		        	console.log( $scope.data );
		        	
		        	$CartService.updateAddresses( JSON.stringify( $scope.data ) )
		        	.then
		        	(
		        			function(response)
		        			{
		        				console.log(response);
		        				$scope.updated = response.status;
		        			window.setTimeout(function()
		        			{
		        	$scope.$apply($scope.updated='');
		        			},3000);
		        			
		        			}
		        			
		        			,
		        			 
		     	            function(errResponse)
		     	            {
		     	            	console.error('Error while Sending Data.');
		     	            } 
		        	);	
			
		    	
		        }
		        
		        
		        /* $CartService.getaddress().then(function(response)
		        		{
		        			console.log(response);
		        			$scope.data = response;
		        			for (var i = 0; i < $scope.data.length; i++) {
								try {
									$scope.Address = $scope.data[i].address;
									$scope.billingAddress = $scope.data[i].address;
								} catch (e) {
									console.log(e);
								}
							}
		        		},function(errResponse)
		        		{
		        			console.log('Error fetching Items');
		        		}); */
		        
			}]); 
		
		
			
		</script>
</head>
<body ng-app="myApp" ng-controller="abc">
<c:import url="/Navbar123"/>
<h1 class="Harrington">Update Address</h1>
 <div>
   <label class="Lucida">BILLING ADDRESS</label><br>
	
	<textarea rows="4" placeholder="Enter your billing Address" ng-model="billingaddress"></textarea><br><br><br>
	<label class="Lucida">ADDRESS</label><br>
	<textarea rows="4" placeholder="Enter your Address" ng-model="adr"></textarea><br><br>
	<a href="${flowExecutionUrl}&_eventId=takeMeToPage3" ><input type="button" style="background-color: rgb(26, 26, 0); color:white; width=40px" value="Add &raquo;" ng-click="updateAddresses()"/></a>  
	<div ng-show="updated=='updated'">
		<div ng-show="updated=='updated'" style="font-style: italic; font-weight: bold; font-size: 20px; font-family: Segoe UI, Tahoma, sans-serif;" class="alert alert-success">
		{{updated}}
		</div>
	</div>
</div>
</body>
</html>