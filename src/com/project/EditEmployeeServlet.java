package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditEmployeeServlet
 */
@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("empid"));
		String v1 = request.getParameter("ename");
		String v2 = request.getParameter("mobileno");
		int v3 = Integer.parseInt(request.getParameter("department"));
		String v4 = request.getParameter("estatus");
		String v5 = request.getParameter("emailid");
		try {
			Connection con= UtilConnection.getConnection();
			String q = ("update employee_table set name=?,mobile=?,dept=?,status=?,email=? where emp_id=?");
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, v1);
			pst.setString(2, v2);
			pst.setInt(3,v3);
			pst.setString(4, v4);
			pst.setString(5, v5);
			pst.setInt(6, id);
			int i = pst.executeUpdate();
			if (i > 0) {
				response.sendRedirect("dashboard.jsp");
			} 
		} catch (Exception e) {
			System.out.println("edit page cacth block");
			e.printStackTrace();
		}
	}
}