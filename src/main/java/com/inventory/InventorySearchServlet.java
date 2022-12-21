package com.inventory;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InventorySearchServlet")
public class InventorySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResultSet rs = null;
		String str = "";
		String search = request.getParameter("search");
		
		try {
			rs = InventoryDBUtil.searchInventory(search);
			
			str = "<div class=\"container text-center\">";
			
			
			if(rs != null) {
				while(rs.next()) {
					str +="<div class=\"card\" style=\"width: 1200px; margin: 3%;\">\r\n"
							+ "    <div class=\"row\">\r\n"
							+ "        <div class=\"col\">\r\n"
							+ "            <img src=\"images\\glueguntest.jpg\" class=\"card-img-top\" alt=\"...\" style=\"width: 200px; height: 200px; margin-left: 20px;\">\r\n"
							+ "        </div>\r\n"
							+ "        <div class=\"col\">\r\n"
							+ "            <div class=\"card-body\">\r\n"
							+ "                 <p class=\"card-text\">"

					
							+ "<br>Inventory ID: " + rs.getString(1)+
							  "<br>Inventory Name: " + rs.getString(3)+
							  "<br>Date Received: " + rs.getString(2)+
							  "<br>No of Units Available: " + rs.getString(4)
				
							+ "</p>\r\n"
							+ "             </div>\r\n"
							+ "        </div>\r\n"
							+ "        <div class=\"col\">\r\n"
							+ "        <form>\r\n"
							+ "		    <div class=\"row\" style=\"margin-left: 10px;\">\r\n"
							+ "		    	<div class=\"col\">\r\n"
							+ "		    		<input type=\"number\" class=\"form-control\" id=\"number\"  min=\"1\" style=\"width: 100px; height: 40px; margin-top: 80px;\">\r\n"
							+ "		    	</div>\r\n"
							+ "		    	<div class=\"col\">\r\n"
							+ "		    		<button type=\"submit\" class=\"btn btn-danger\" id=\"buttonAdd\" style=\"width: 150px; margin-top: 80px; \">Order</button>\r\n"
							+ "		    	</div>\r\n"
							+ "		    </div>\r\n"
							+ "	    </form>\r\n"
							+ "        </div>\r\n"
							+ "    </div>\r\n"
							+ "</div>";
				}
				
				str += "</div>";		
				
			}
			
			rs = ConsumablesDBUtil.searchConsumables(search);
			
			str += "<div class=\"container text-center\">";
			
			if(rs != null) {
				while(rs.next()) {
					str +="<div class=\"card\" style=\"width: 1200px; margin: 3%;\">\r\n"
							+ "    <div class=\"row\">\r\n"
							+ "        <div class=\"col\">\r\n"
							+ "            <img src=\"images\\glueguntest.jpg\" class=\"card-img-top\" alt=\"...\" style=\"width: 200px; height: 200px; margin-left: 20px;\">\r\n"
							+ "        </div>\r\n"
							+ "        <div class=\"col\">\r\n"
							+ "            <div class=\"card-body\">\r\n"
							+ "                 <p class=\"card-text\">"

					
							+ "<br>Consumables ID: " + rs.getString(1)+
							  "<br>Consumables Name: " + rs.getString(2)+
							  "<br>Date Received: " + rs.getString(3)+
							  "<br>No of Units Available: " + rs.getString(8)
				
							+ "</p>\r\n"
							+ "             </div>\r\n"
							+ "        </div>\r\n"
							+ "        <div class=\"col\">\r\n"
							+ "        <form>\r\n"
							+ "		    <div class=\"row\" style=\"margin-left: 10px;\">\r\n"
							+ "		    	<div class=\"col\">\r\n"
							+ "		    		<input type=\"number\" class=\"form-control\" id=\"number\"  min=\"1\" style=\"width: 100px; height: 40px; margin-top: 80px;\">\r\n"
							+ "		    	</div>\r\n"
							+ "		    	<div class=\"col\">\r\n"
							+ "		    		<button type=\"submit\" class=\"btn btn-danger\" id=\"buttonAdd\" style=\"width: 150px; margin-top: 80px; \">Order</button>\r\n"
							+ "		    	</div>\r\n"
							+ "		    </div>\r\n"
							+ "	    </form>\r\n"
							+ "        </div>\r\n"
							+ "    </div>\r\n"
							+ "</div>";
				}
				
				str += "</div>";	
				
			}
			
			request.setAttribute("inventorySearch", str);
			
			RequestDispatcher dis = request.getRequestDispatcher("SearchPage.jsp");
			dis.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
