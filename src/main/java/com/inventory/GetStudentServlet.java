package com.inventory;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetStudentServlet")
public class GetStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResultSet rs = null;
		String str = "";
		
		try {
			rs = StudentDBUtil.displayStudents();
			str="<table class=\"table table-striped\">"
					+ "<thead>"
					+ "<tr>"
					+ "<th>Student ID</th>"
					+ "<th>Student Name</th>"
					+ "<th>Student Email</th>"
					+ "</tr>"
					+ "</thead>"
					+ "<tbody>";
			
			while(rs.next()) {
				str+="<tr><td>"+rs.getString(1)+
						"</td><td>"+rs.getString(2)+
						"</td><td>"+rs.getString(3)+
						"</td>";
			}
			str+="  </tbody>\r\n"
					+ "</table>";
			
			request.setAttribute("stdDetails", str);
			
			RequestDispatcher dis = request.getRequestDispatcher("Student_Details.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
