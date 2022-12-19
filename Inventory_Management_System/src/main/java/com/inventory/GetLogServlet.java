package com.inventory;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetLogServlet")
public class GetLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ResultSet rs = null;
		String str = "";
		
		try {
			rs = LogDBUtil.displayLog();
			str="<table class=\"table table-striped\">"
					+ "<thead>"
					+ "<tr>"
					+ "<th>Student ID</th>"
					+ "<th>Login Date</th>"
					+ "<th>Login Time</th>"
					+ "<th>Logout Time</th>"
					+ "</tr>"
					+ "</thead>"
					+ "<tbody>";
			
			while(rs.next()) {
				str+="<tr><td>"+rs.getString(1)+
						"</td><td>"+rs.getString(2)+
						"</td><td>"+rs.getString(3)+
						"</td><td>"+rs.getString(4)+
						"</td>";
			}
			str+="  </tbody>\r\n"
					+ "</table>";
			
			request.setAttribute("logDetails", str);
			
			RequestDispatcher dis = request.getRequestDispatcher("Log_Details.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
