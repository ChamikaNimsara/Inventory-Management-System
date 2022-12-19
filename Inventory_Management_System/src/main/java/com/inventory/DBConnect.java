package com.inventory;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static String url = "jdbc:mysql://localhost:3306/inventory_manage";
	private static String user = "root";
	private static String pwd = "Password1234";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);
		
		} catch (Exception e) {
			System.out.println("Database connection failed!");
		}
		
		return con;
	}
}
