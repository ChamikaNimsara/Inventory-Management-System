package com.inventory;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetInventoryServlet")
public class GetInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ResultSet rs = null;
		String str = "";
		
		try {
			rs = InventoryDBUtil.displayInventory();
			str="<table class=\"table table-striped\">"
					+ "<thead>"
					+ "<tr>"
					+ "<th>Inventory ID</th>"
					+ "<th>Inventory Name</th>"
					+ "<th>Date</th>"
					+ "<th>Number of items</th>"
					+ "<th>GRN_REF</th>"
					+ "<th>SB_Update</th>"
					+ "<th>Location</th>"
					+ "<th>Description</th>"
					+ "<th>Image</th>"
					+ "</tr>"
					+ "</thead>"
					+ "<tbodyd>";
			
			while(rs.next()) {
				str+="<tr><td>"+rs.getString(1)+
						"</td><td>"+rs.getString(3)+
						"</td><td>"+rs.getString(2)+
						"</td><td>"+rs.getString(4)+
						"</td><td>"+rs.getInt(5)+
						"</td><td>"+rs.getInt(6)+
						"</td><td>"+rs.getInt(7)+
						"</td><td>"+rs.getInt(8)+
						"</td><td>"+rs.getInt(9)+
						"</td>";
			}
			str+="  </tbody>\r\n"
					+ "</table>";
			
			request.setAttribute("inventoryDetails", str);
			
			RequestDispatcher dis = request.getRequestDispatcher("Inventory_Details.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
