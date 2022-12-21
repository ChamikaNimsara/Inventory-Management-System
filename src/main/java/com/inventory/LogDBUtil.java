package com.inventory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LogDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static ResultSet displayLog() {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Select * from log";
			rs = stmt.executeQuery(sql);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet displayDay() {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT WEEKDAY(Login_Date), count(STUDENT_ID) FROM GROUP BY WEEKDAY(Login_Date)";
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
}
