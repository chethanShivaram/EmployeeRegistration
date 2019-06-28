<html>
<head>
<link rel="stylesheet" href="header.css">
<style>
.header a {
  float: left;
  text-align: center;
  padding: 17px 17px;
  text-decoration: none;
  font-size: 14px;
}
.header a:hover {
  background-color:skyblue;
}
.heading {
  position: absolute;
  left: 500px;
  top: 50px;
  text-transform: uppercase;
  font-family:Helvetica;
  text-decoration: none;
  font-size:20px;
}
table{
  margin-top:100px;
  font-family: Calibri; 
  color:white; 
  font-size: 14pt; 
  font-style: normal;
  background-color: blue; 
}
</style>
</head>
<body>
<div class="header">
  <a  style="color:white;" href="dashboard.jsp">HOME</a>
</div>
<%@include file="footer.jsp" %>
<%@include file="dropdown.html" %>
<div class = "heading">
<p><b>Add New Employee Details</b><p>
</div>
<form action="AddEmployeeServlet" method="post">
<table align="center" cellpadding = "15">

<!----- Employee Id
<tr>
<td>EMPLOYEE ID</td>
<td><input type="text"  name="empcode" maxlength="5"/>
</td>
</tr>-->
 
<!----- Name ---------------------------------------------------------->
<tr>
<td>NAME</td>
<td><input type="text" pattern="[A-Za-z ]+" title="employee name shouldn't contain numeric or special characters" name="ename" required maxlength="15"/>
</td>
</tr>

<!----- Mobile Number ---------------------------------------------------------->
<tr>
<td>MOBILE NUMBER</td>
<td>
<input type="text" pattern="[0-9]{10}" title="invalid mobile number" name="mobileno" required maxlength="10" />
(10 digit number)
</td>
</tr>
 
<!----- Department ---------------------------------------------------------->
<tr>
<td>DEPARTMENT</td>
<td>
<select name="department">
<option value='1'>IT</option>
<option value='2'>HR</option>
<option value='3'>JAVA</option>
</select>
</td>
</tr>

<!----- Status ----------------------------------------------------------->
<tr>
<td>STATUS</td>
<td>
Intern <input type="radio" name="estatus" value="Intern"/>
Fresher <input type="radio" name="estatus" value="fresher" />
Worker <input type="radio" name="estatus" value="worker" />
Manager <input type="radio" name="estatus" value="manager" />
</td>
</tr>

<!----- Email Id ---------------------------------------------------------->
<tr>
<td>EMAIL ID</td>
<td><input type="text" name="emailid" required maxlength="50" /></td>
</tr>
 
<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="2" align="center">
<input type="submit" value="Submit">
<input type="reset" value="Reset">
</td>
</tr>
</table>
</form>

</body>
</html>