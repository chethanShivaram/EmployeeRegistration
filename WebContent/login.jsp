<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="login.css">
</head>
<body>
<img src="photos1.jpg" width=100%;>

<form action="LoginServlet" method="post">
<div class="box">
    <input type="text" class="login-username" placeholder="Username" name="username" required>
    <input type="password" class="login-password" placeholder="Password" name="password" required>
    
    <button type="submit" id="button">Login</button>
    <p>Don't have an account?
    <a class="signupbtn" href="RegistrationUser.jsp">Sign Up</a></p>
  </div>
  
<%@include file="footer.jsp" %>
<div class="header">
<p style="color:white;text-align:center;font-size:20px;font-weight:bold;">EMPLOYEE REGISTRATION FORM</div>
</form>
</body>
</html>