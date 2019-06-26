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
<div class = "heading">
<p><b>Edit Employee Details</b><p>
</div>
<%@include file="footer.jsp" %>
<%@include file="dropdown.html" %>

<form action="EditEmployeeServlet" method="post">
<table align="center" cellpadding = "15">
 <tr><!----- Employee Id ---------------------------------------------------------->
						<td>EMPLOYEE ID</td>
						<%
							String id = request.getParameter("empcode");
						    String name=request.getParameter("ename");
						    String mobile=request.getParameter("mobileno");
						    String dept=request.getParameter("department");
						    String status=request.getParameter("estatus");
						    String email=request.getParameter("emailid");
						%>
						<td><input type="text" value=<%=id%> name="empcode" maxlength="5" readonly/></td>
					</tr>

<!----- Name ---------------------------------------------------------->
<tr>
<td>NAME</td>
<td><input type="text" value="<%=name%>" pattern="[A-Za-z ]+" title="employee name shouldn't contain numeric or special characters"  name="ename" required maxlength="30"/>
</td>
</tr>

<!----- Mobile Number ---------------------------------------------------------->
<tr>
<td>MOBILE NUMBER</td>
<td>
<input type="text" value=<%=id%> name="mobileno" pattern="[0-9]{10}" title="invalid mobile number" required maxlength="10" />
(10 digit number)
</td>
</tr>
 
<!----- Department ---------------------------------------------------------->
<tr>
<td>DEPARTMENT</td>
<td>
<select name="department">
<option><%=dept%></option>
<option value="IT">IT</option>
<option value="HR">HR</option>
<option value="JAVA">JAVA</option>
</select>
</td>
</tr>

<!----- Status ----------------------------------------------------------->
<tr>
<td>STATUS</td>
<td>
Intern <input type="radio" name="estatus" value="Intern" />
Fresher <input type="radio" name="estatus" value="fresher" />
Worker <input type="radio" name="estatus" value="worker" />
Manager <input type="radio" name="estatus" value="manager" />
</td>
</tr>

<!----- Email Id ---------------------------------------------------------->
<tr>
<td>EMAIL ID</td>
<td><input type="text" value="<%=id%>" name="emailid" required maxlength="50" /></td>
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