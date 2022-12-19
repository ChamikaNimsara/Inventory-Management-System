package com.inventory;

import java.io.IOException;
import java.sql.Blob;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InventoryInsertServlet")
public class InventoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String item = request.getParameter("name");
		String numbers = request.getParameter("number");
		String GRN_REF = request.getParameter("GRN_REF");
		String SB_Update = request.getParameter("SB_Update");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		//String image = request.getParameter("");
		
		boolean isTrue;
		
		isTrue = InventoryDBUtil.insertinventory(id, date, item, numbers, GRN_REF, SB_Update, location, description, null);
		
		if(isTrue == true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("Inventory_Details.jsp");
			dis1.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Inventory_Insert.jsp");
			dis2.forward(request, response);
		}
	}

};
