<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
             <%@page isELIgnored="false" %>

<nav class="navbar navbar-inverse" style="background-color: rgb(26, 26, 0);">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" style="font-size: 150%; font-family:Impact;">Look @_Me</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Home" style="font-size: 150%;">Home</a></li>
	    <li><a href="AboutUs" style="font-size: 150%;">About</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 150%;">Men <span class="caret"></span></a>
          <ul class="dropdown-menu">
<div class="container">
	<div class="row">
    	<div class="col-sm-4">
			<h3>Topwear</h3>
				<p><a href="${pageContext.request.contextPath}/Show/Men/T-Shirts">T-Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Casual Shirts">Casual Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Formal Shirts">Formal Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Sweaters & Sweatshirts">Sweaters & Sweatshirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Jackets">Jackets</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Blazers & Coats">Blazers & Coats</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Suits">Suits</a></p>
		 </div>
		<div class="col-sm-4">
			<h3>Sports & Active Wear</h3>        
				<p><a href="${pageContext.request.contextPath}/Show/Men/Active T-Shirts">Active T-Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Track Pants & Shorts">Track Pants & Shorts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Jackets & Sweatshirts">Jackets & Sweatshirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Swimwear">Swimwear</a></p>
			<h3>Indian & Festive Wear</h3>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Kurta & Kurta Sets">Kurta & Kurta Sets</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Sherwanis">Sherwanis</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Nehru Jackets">Nehru Jackets</a></p>
		</div>
		<div class="col-sm-4">
			<h3>Bottomwear</h3>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Jeans">Jeans</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Casual Trousers">Casual Trousers</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Formal Trousers">Formal Trousers</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Shorts">Shorts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Men/Track Pants & Joggers">Track Pants & Joggers</a></p>
		</div> 
	</div>
</div>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 150%;">Women <span class="caret"></span></a>
          <ul class="dropdown-menu">
<div class="container">
	<div class="row">
    		<div class="col-sm-4">
			<h3>Indian & Fusion Wear</h3>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Kurta & Suits">Kurta & Suits</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Kurta Tunics & Tops">Kurta Tunics & Tops</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Leggings, Salwars & Churidars">Leggings, Salwars & Churidars</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Skirts & Plazzos">Skirts & Plazzos</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Sarees & Blouses">Sarees & Blouses</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Dress Material">Dress Material</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Lehanga Choli">Lehanga Choli</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Dupattas & Shawls">Dupattas & Shawls</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Jackets & Waistcoats">Jackets & Waistcoats</a></p>
		</div>
		<div class="col-sm-4">
			<h3>Western Wear</h3>        
				<p><a href="${pageContext.request.contextPath}/Show/Women/Dresses & Jumpsuits">Dresses & Jumpsuits</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Tops, T-Shirts & Shirts">Tops, T-Shirts & Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Jeans & Jeggings">Jeans & Jeggings</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Trousers & Capris">Trousers & Capris</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Shorts & Skirts">Shorts & Skirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Shrugs">Shrugs</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Sweaters & Sweatshirts">Sweaters & Sweatshirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Jackets & Waistcoats">Jackets & Waistcoats</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Coats & Blazers">Coats & Blazers</a></p>
		</div>
		<div class="col-sm-4">
			<h3>Sports & Active Wear</h3>
				<p><a href="${pageContext.request.contextPath}/Show/Women/Clothing Sets">Clothing Sets</a></p>
		</div> 
	</div>
</div>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size: 150%;">Kids <span class="caret"></span></a>
          <ul class="dropdown-menu">
<div class="container">
	<div class="row">
    		<div class="col-sm-4">
			<h3>Boys Clothing</h3>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/T-Shirts">T-Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Shirts">Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Jeans & Trousers">Jeans & Trousers</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Shorts & Dungarees">Shorts & Dungarees</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Track Pants & Pyjamas">Track Pants & Pyjamas</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Clothing Sets">Clothing Sets</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Indian Wear">Indian Wear</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Sweaters, Sweatshirts & Jackets">Sweaters, Sweatshirts & Jackets</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Rompers & Sleepwear">Rompers & Sleepwear</a></p>
		</div>
		<div class="col-sm-4">
			<h3>Girls Clothing</h3>  
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Dresses">Dresses</a></p>      
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Tops & T-Shirts">Tops & T-Shirts</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Clothing Sets">Clothing Sets</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Indian Wear">Indian Wear</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Skirts, Shorts & Jumpsuits">Skirts, Shorts & Jumpsuits</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Tights & Leggings">Tights & Leggings</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Jeans, Trousers & Capris">Jeans, Trousers & Capris</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Track Pants">Track Pants</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Sweaters, Sweatshirts & Jackets">Sweaters, Sweatshirts & Jackets</a></p>
				<p><a href="${pageContext.request.contextPath}/Show/Kids/Rompers & Sleepwear">Rompers & Sleepwear</a></p>
		</div>
	</div>
</div>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="cart" style="font-size: 150%;"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <c:choose>
		<c:when test="${not empty pageContext.request.userPrincipal}">
	 		<li><a href="#">${pageContext.request.userPrincipal.name}</a></li>
			<li><a href="${pageContext.request.contextPath}/logout">Log Out</a></li>
	      	</c:when>			
	      	<c:otherwise>
                	<li><a href="${pageContext.request.contextPath}/LoginForm" style="font-size: 150%;"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                	<li><a href="${pageContext.request.contextPath}/SignUpForm" style="font-size: 150%;"><span class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
	      	</c:otherwise>
	</c:choose>
      </ul>
    </div>
  </div>
</nav>
