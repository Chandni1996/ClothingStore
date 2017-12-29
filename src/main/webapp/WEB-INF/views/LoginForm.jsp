<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login Form</title>
  <c:import url="Head.jsp"/>
  <style>
form {
    align: center;
    border: 3px solid rgb(77, 25, 25);
    width: 50%;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: rgb(26, 26, 0);
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
.Harrington {
    font-family: Harrington;
    font-weight: bold;
    font-size: 50px;
    color: rgb(26, 26, 0);
    text-shadow: 3px 2px rgb(96, 31, 31);
}
.Lucida {
    font-family: Lucida Fax;
    color: rgb(26, 26, 0);
}

</style>
  
</head>
<body>
<c:import url="Navbar.jsp"/>
<br><br>
<form action="login" method="post">
  <div class="imgcontainer">
    <h2 class="Harrington">Login Form</h2>
  </div>

  <div class="container">
    <label class="Lucida"><b>Username</b></label><br>
    <input type="text" placeholder="Enter Username" name="email" required style="font-family: Lucida Fax; width:50%;">
    <br></br>
    <label class="Lucida"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="pwd" required style="font-family: Lucida Fax; width:50%;">
    <br></br>
    <input type="checkbox" checked="checked"> Remember me  
    <br></br>  
    <button type="submit" style= "width:50%;">Login</button>
  </div>
  </body>
</html>