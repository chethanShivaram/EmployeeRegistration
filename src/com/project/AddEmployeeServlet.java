package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String v2 = request.getParameter("ename");
		String v3 = request.getParameter("mobileno");
		int v4 = Integer.parseInt(request.getParameter("department"));
		String v5 = request.getParameter("estatus");
		String v6 = request.getParameter("emailid");
		try {
			Connection con= UtilConnection.getConnection();
			PreparedStatement pst2 = con.prepareStatement("insert into employee_table(name,mobile,dept,status,email) values(?,?,?,?,?)");
		
			pst2.setString(1, v2);
			pst2.setString(2, v3);
			pst2.setInt(3, v4);
			pst2.setString(4, v5);
			pst2.setString(5, v6);
			int v = pst2.executeUpdate();
			if (v == 1) 
			{
				out.print("<div style=color:green;font-weight:bold;position:fixed;left:0px;top:490px;>");
				out.print("Username " + v2 + " is registered.");
				out.print("</div>");
				RequestDispatcher rd = request.getRequestDispatcher("addEmp.jsp");
				rd.include(request, response);
			}
			con.close();
			pst2.close();
		} catch (Exception e) {
			System.out.println("--Error in Employee Registeration---");
			e.printStackTrace();
		}
	}
	}