<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
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

.container {
	width: 900px;
	height: 338px;
	position: absolute;
	left: 20%;
	top: 25%;
	border: 2px solid black;
}
table {
	max-width:980px;
	table-layout:fixed;
	margin:auto;
}
th, td {
	padding:5px 10px;
	border:1px solid #000;
}
thead {
	background:lightgrey;
	display:table;
	width:100%;
	width:calc(100% - 15px);
}
tbody {
	height:300px;
	overflow:auto;
	overflow-x:hidden;
	display:block;
	width:100%;
}
tbody tr {
	display:table;
	width:100%;
	table-layout:fixed;
}
.heading {
  position: absolute;
  left: 580px;
  top: 70px;
  text-transform: uppercase;
  font-family:Helvetica;
  text-decoration: none;
  font-size:20px;
}
.space{ background-color: white;
}
</style>
</head>
<body>
<img src="photos1.jpg" width=100%;>
<div class="header">
  <a  style="color:white;" href="">HOME</a>
  <a  style="color:white;" href="addEmp.jsp">ADD EMPLOYEE</a>
  </div>
<%@include file="footer.jsp" %>
<%@include file="dropdown.html" %>
<div class = "heading">
<p><b>List of Employees</b><p>
</div>
<div class="container">
		<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/world" user="root" password="chethanbs@2610" />
		<sql:query dataSource="${snapshot}" var="result">
         SELECT * from reg_table;
      </sql:query>
      <div class="space">
  <table>
  <thead>
    <tr>
      <th width ="14%">Employee Id</th>
      <th width ="14%">Name</th>
      <th width ="14%">Mobile</th>
      <th width ="14%">Department</th>
      <th width ="14%">Status</th>
      <th width ="14%">Email Id</th>
      <th width ="14%">Action</th>
    </tr>
  </thead>
    <tbody>
    <c:forEach var="row" items="${result.rows}">
    <tr>
					<td width ="14%"><c:out value="" /></td>
					<td width ="14%"><c:out value="" /></td>
					<td width ="14%"><c:out value="" /></td>
					<td width ="14%"><c:out value="" /></td>
					<td width ="14%"><c:out value="" /></td>
					<td width ="14%"><c:out value="" /></td>
					
	                <td><select onChange="window.location.href=this.value">
                    <option>Select Action</option>
                    <option value="editEmp.jsp">Edit</option>
                    <option value="deleteEmployee.jsp">Delete</option>
                    </select></td>
</tr>
	</c:forEach>
  </tbody>
</table>
</div>
</div> 
</body>
</html>