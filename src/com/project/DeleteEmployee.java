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
 * Servlet implementation class DeleteEmployee
 */
@WebServlet("/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		int id = Integer.parseInt(request.getParameter("employeeid"));
		try {
			PrintWriter out =response.getWriter();
			Connection con= UtilConnection.getConnection();
			String sql = "delete from employee_table where emp_id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1)
			{
				out.print("<div style=color:red;font-weight:bold;position:fixed;left:50px;top:490px;>");
				out.print("emp_id" + id + " has been deleted");
				out.print("</div>");
				RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
				rd.include(request, response);
			}

			}catch(Exception e) {
			System.out.println("unable to delete records");
			e.printStackTrace();
			}
	}

}
