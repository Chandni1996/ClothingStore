<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> </title>
<c:import url="/Head"/>
<script src="resources/js/angular.min.js"></script>
<style type="text/css">
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
.Harrington {
    font-family: Harrington;
    font-weight: bold;
    font-size: 60px;
    color: rgb(26, 26, 0);
        
}
</style>
</head>
<script type="text/javascript">

var myApp = angular.module('myApp',[]);

myApp.factory('CartService', ['$http', '$q', function($http, $q){
     
    var BASE_URL = 'http://localhost:9090/ClothingStore/';
    
    return {
         
            fetchAllItemsInCart: function() {
                    return $http.post(BASE_URL+'getAllItemsInCart')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching items');
                                        return $q.reject(errResponse);
                                    }
                            );
            }         ,
            removeFromCart: function(cartid) {
                return $http.post(BASE_URL+'removeFromCart',cartid)
                        .then(
                                function(response){
                                    return response.data;
                                }, 
                                function(errResponse){
                                    console.error('Error while fetching items');
                                    return $q.reject(errResponse);
                                }
                        );
        }
    };
 
}]);

myApp.controller('myCtrl',['$scope','CartService',function($scope,$CartService){
    
    console.log('Cart Controller');    
    
    $scope.data = [];
    
    $CartService.fetchAllItemsInCart().then(
           function(result) {
               $scope.data = result;
               console.log(result);
            }
        );
    
    $scope.RemoveFromCart = function(cid)
    {
        $CartService.removeFromCart({"cid":cid}).then(
               function(result) {
                   console.log(result.message);
                   
                   if( result.message == 'deleted' )
                   {
                       $CartService.fetchAllItemsInCart().then(
                              function(result) {
                                  $scope.data = result;
                                  console.log(result);
                               }
                           );
                   }
                   else
                   {
                       alert('Deletion Failure');    
                   }
                }
            );

    }
    
}]);

</script>
<body ng-app="myApp" ng-controller="myCtrl">
<c:import url="/Navbar123"/>
<center><h1 class="Harrington">Your Cart</h1></center>
<table class="table" style="width: 100%;" border="1px solid rgb(26, 26, 0);">
    <tr>
       <th>Cart ID</th>
       <th>Product ID</th>
       <th>Product Name</th>
       <th>Product Image</th>
       <th>Product Quantity</th>
       <th>Price</th>
       <th>Total Cost</th>
       <th>Remove from Cart </th>
    </tr>
    <tr ng-repeat="x in data">   
       <td>{{x.cid}}</td>
       <td>{{x.pid}}</td>
       <td> {{x.pname}}</td>
       <td><img src="{{x.pimage}}"/></td>
       <td> {{x.pQuantity}}</td>
       <td>{{x.pprice}}</td>
       <td>{{ x.pQuantity*x.pprice }}</td>
       <td><input type="button" value="Remove" ng-click="RemoveFromCart(x.cid)" /></td>
    </tr>
</table>
<a href="${pageContext.request.contextPath}/Home" class="previous">&laquo; Continue Shopping</a>    
<a href="${flowExecutionUrl}&_eventId=takeMeToPage2" class="next" style="float: right;">Place Order &raquo;</a>
</body>
</html>