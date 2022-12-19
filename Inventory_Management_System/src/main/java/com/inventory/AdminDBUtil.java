package com.inventory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Admin> validate(String username, String password) {
		ArrayList<Admin> admin = new ArrayList<>();
		
		//validate
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from admin where Username='"+username+"' and Password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String usern = rs.getString(4);
				String pass = rs.getString(5); 
				
				Admin a = new Admin(id, name, email, usern, pass);
				admin.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return admin;
	}
	
	public static boolean insertadmin(String id, String name, String email, String username, String password) {
		boolean isSuccess = false;
				
		//validate
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into admin values ('"+Integer.parseInt(id)+"', '"+name+"', '"+email+"', '"+username+"', '"+password+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) isSuccess = true;
			else isSuccess = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}
