package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String v1=request.getParameter("username");
		String v2=request.getParameter("password");		

		try{
			Connection con= UtilConnection.getConnection();
			String q=("select * from user_table where username=? and password=?");
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1, v1);
			pst.setString(2, v2);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
	            HttpSession hs=request.getSession();
				hs.setAttribute("name", v1);
				response.sendRedirect("dashboard.jsp");
			}
			else
			{
				out.print("<div style=color:red;font-weight:bold;position:fixed;left:0px;top:490px;>");
				out.print("Invalid user name  or password ");
				out.print("</div>");
				
			    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			    rd.include(request, response);
			}	
			con.close();
			pst.close();
		}
		catch(Exception e)
		{
			System.out.println("--catch block--");
			e.printStackTrace();
		}
	}
}