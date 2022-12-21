package com.inventory;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminloginServlet")
public class AdminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uid");
		String password = request.getParameter("pass");
		
		try {
			List<Admin> adminDetails = AdminDBUtil.validate(username, password);
			request.setAttribute("adminDetails", adminDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("Admin_home.jsp");
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ResultSet rs = null;
		String str = "";
		
		try {
			rs = LogDBUtil.displayDay();
			str="<canvas id=\"myChart\" style=\"width:100%;max-width:600px\"></canvas><script>"
					+ "var xValues = [\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\", \"Sunday\"];"
					+ "var yValues = [";
			
			while(rs.next()) {
				str += rs.getInt(1)+", " +rs.getInt(2)+ ", ";
				
			}
			
				str += "];"
					+ "new Chart(\"myChart\", {\r\n"
					+ "  type: \"bar\",\r\n"
					+ "  data: {\r\n"
					+ "    labels: xValues,\r\n"
					+ "    datasets: [{\r\n"
					+ "      backgroundColor: barColors,\r\n"
					+ "      data: yValues\r\n"
					+ "    }]\r\n"
					+ "  },\r\n"
					+ "  options: {\r\n"
					+ "    legend: {display: false},\r\n"
					+ "    title: {\r\n"
					+ "      display: true,\r\n"
					+ "      text: \"World Wine Production 2018\"\r\n"
					+ "    }\r\n"
					+ "  }\r\n"
					+ "});\r\n"
					+ "</script>";

			
			request.setAttribute("dateDetails", str);
			
			RequestDispatcher dis = request.getRequestDispatcher("Admin_home.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
