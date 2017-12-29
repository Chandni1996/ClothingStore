<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="Head.jsp"/>
<title>SignUpForm</title>
<style>
.container {
    position: relative;
}

.topright {
    position: absolute;
    top: -40px;
    right: 8px;
    font-size: 18px;
}

.topleft {
    position: absolute;
    top: -35px;
    left: 45px;
    font-family: cursive;
    color: rgb(77, 25, 25);
    font-size: 50px;
}

.Harrington {
    font-family: Harrington;
    font-weight: bold;
    font-size: 40px;
    color: rgb(26, 26, 0);
    text-shadow: 3px 2px rgb(96, 31, 31);
}

.Lucida {
    font-family: Lucida Fax;
    color: rgb(26, 26, 0);
}

.register {
    font-family: Lucida Fax; 
    font-size:100%; 
    font-weight:bold; 
    color: white;
    background-color: rgb(26, 26, 0); 
    
}
</style>
</head>
<body>
<c:import url="Navbar.jsp"/>
<div class="container">
  <c:if test="${not empty mypasswordmismatch }">
  
  	<label class="alert alert-danger" style="font-family: Lucida Fax; color: rgb(77, 25, 25); font-weight: bold;">Passwords do not match</label>
  
  </c:if>
  
  <c:if test="${not empty useralreadyexists }">
  
  	<label class="alert alert-danger" style="font-family: Lucida Fax; color: rgb(77, 25, 25); font-weight: bold;">User-name already exists</label>
  
  </c:if>
  
   <c:if test="${not empty myerrors }">
  
  	<label class="alert alert-danger" style="font-family: Lucida Fax; color: rgb(77, 25, 25); font-weight: bold;">Error</label>
  
  </c:if>
<div class="container">
  <div class="topright">
<div class="container">
<fieldset style="color:rgb(77, 25, 25);">
    <legend><h3 class="Harrington">Registration Form</h3></legend>
    <form:form action="AddSignUpToDB" method="post" modelAttribute="sign">
    <div class="form-group">  
      <label for="usr" class="Lucida">User Name:</label>
      <form:input type="text" class="form-control" id="usr" style="width:60%; font-family: Lucida Fax;" path="usr"/>
    </div>
    <div class="form-group">
      <label for="usr" class="Lucida">E - Mail:</label>
      <form:input type="text" class="form-control" id="email" style="width:60%; font-family: Lucida Fax;" path="email"/>
    </div>
    <div class="form-group">
      <label for="pwd" class="Lucida">Password:</label>
      <form:input type="password" class="form-control" id="pwd" style="width:60%; font-family: Lucida Fax;" path="pwd"/>
      </div>
    <div class="form-group">
      <label for="pwd" class="Lucida">Confirm Password:</label>
      <form:input type="password" class="form-control" id="con-pwd" style="width:60%; font-family: Lucida Fax;" path="con_pwd"/>
    </div>
    <div class="form-group">
      <label for="usr" class="Lucida">Mobile No.:</label>
      <form:input type="text" class="form-control" id="mb_no" style="width:60%; font-family: Lucida Fax;" path="mb_no"/>
    </div>
    <div class="form-group">
      <label for="usr" class="Lucida">Address:</label>
      <form:input type="text" class="form-control" id="adr" style="width:60%; font-family: Lucida Fax;" path="adr"/>
      </div>
    <button type="submit" class="btn btn-default register" style="width:60%;">Register</button>
  </form:form>
</div>
</div>
</div>
</fieldset>
</body>
</html>
