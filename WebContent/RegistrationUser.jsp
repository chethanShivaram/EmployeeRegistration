<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="registrationuser.css">
</head>
<body>
<div class="header"></div>
<%@include file="footer.jsp" %>
<form action="RegistrationUsername" method="post">
    <h1>Sign Up</h1>
    <p1>Please fill in this form to create an account.</p1>
    
    <hr style="margin-top:160px; border:1px solid skyblue;">
  
  <div class="container">
    <input type="text" pattern="[A-Za-z ]+"  maxlength="15" title="username shouldn't contain numeric or special characters" placeholder="Enter User Name" name="uname" required>

    <input type="text" placeholder="Enter Email" name="mail" required>
    
    <input id="password" name="password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'password should contain more than 6 characters with 1 digit,1 special,1 uppercase and 1 lowercase values' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" placeholder="Enter password" required>  
    
    <input type="text" pattern="[0-9]{10}" title="invalid mobile number" placeholder="Enter Mobile Number" name="mobileno" required>

    <input id="password_two" name="password_two" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Confirm password" required>
    
    <button type="submit">Register</button>
  </div>
</form>
</body>
</html>
