package com.project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UtilConnection{
public static Connection getConnection() throws SQLException
{
String drivername = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/world";
String username = "root";
String password = "chethanbs@2610";
try
{
Class.forName(drivername);
}
catch(ClassNotFoundException e)
{
e.printStackTrace();
}
Connection con = DriverManager.getConnection(url, username, password);
System.out.println("con from utilConnection:" + con);
return con;
}
}
