package com.inventory;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doGet_DisplayCart(request, response);
		} else {
			if (action.equalsIgnoreCase("buy")) {
				doGet_Buy(request, response);
			} else if (action.equalsIgnoreCase("remove")) {
				doGet_Remove(request, response);
			}
		}
	}

	protected void doGet_DisplayCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
	
	protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		HashMap<String, String>  cart = (HashMap<String, String> ) session.getAttribute("cart");
		cart.remove(request.getParameter("id"));
		session.setAttribute("cart", cart);
		response.sendRedirect("cart");
	}
	
	protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") == null) {
			HashMap<String, String> cart = new HashMap<String, String>();
			cart.put(request.getParameter("id"), request.getParameter("qty"));
			session.setAttribute("cart", cart);
		} else {
			@SuppressWarnings("unchecked")
			HashMap<String, String>  cart = (HashMap<String, String> ) session.getAttribute("cart");
			cart.put(request.getParameter("id"), request.getParameter("qty"));
			session.setAttribute("cart", cart);
		}
		response.sendRedirect("cart");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
