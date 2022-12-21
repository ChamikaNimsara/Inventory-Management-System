package com.inventory;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class InventoryDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static ResultSet displayInventory() {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Select * from inventory";
			rs = stmt.executeQuery(sql);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet searchInventory(String search) {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM inventory WHERE Items LIKE '%" + search + "%'";
			rs = stmt.executeQuery(sql);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static boolean insertinventory(String id, String date, String item, String numbers, String gRN_REF, String sB_Update,
			String location, String description, Blob image) {
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into inventory values ('"+id+"', '"+date+"', '"+item+"', '"+numbers+"', '"+gRN_REF+"', '"+sB_Update+"', '"+location+"', '"+description+"', '"+image+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) isSuccess = true;
			else isSuccess = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}
