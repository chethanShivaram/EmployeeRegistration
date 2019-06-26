package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationUsername
 */
@WebServlet("/RegistrationUsername")
public class RegistrationUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationUsername() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String v1 = request.getParameter("uname");
		String v2 = request.getParameter("mail");
		String v3 = request.getParameter("password");
		String v4 = request.getParameter("mobileno");
		String v5 = request.getParameter("password_two");
		try {
			Connection con= UtilConnection.getConnection();
			PreparedStatement pst2 = con.prepareStatement("insert into user_table(username,email,password,mobile,conpassword) values(?,?,?,?,?)");
		
			pst2.setString(1, v1);
			pst2.setString(2, v2);
			pst2.setString(3, v3);
			pst2.setString(4, v4);
			pst2.setString(5, v5);
			int v = pst2.executeUpdate();
			if (v == 1) 
			{
				out.print("<div style=color:green;font-weight:bold;position:fixed;left:0px;top:490px;>");
				out.print("Username " + v1 + " is registered.");
				out.print("</div>");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
			con.close();
			pst2.close();
		} catch (Exception e) {
			System.out.println("--Employee Registeration---");
			e.printStackTrace();
		}
	}
}
