package com.inventory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConsumablesDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static ResultSet displayConsumables() {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Select * from consumables";
			rs = stmt.executeQuery(sql);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet searchConsumables(String search) {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM consumables WHERE Material LIKE '%" + search + "%'";
			rs = stmt.executeQuery(sql);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
