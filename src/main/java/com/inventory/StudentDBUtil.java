package com.inventory;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.Statement;

public class StudentDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Student> validate(String username, String password) {
		ArrayList<Student> std = new ArrayList<>();
		
		//validate
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from student where Username='"+username+"' and Password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String usern = rs.getString(4);
				String pass = rs.getString(5); 
				
				Student s = new Student(id, name, email, usern, pass);
				std.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return std;
	}
	
	public static boolean insertstudent(String id, String name, String email, String username, String password) {
		boolean isSuccess = false;
				
		//validate
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into student values ('"+Integer.parseInt(id)+"', '"+name+"', '"+email+"', '"+username+"', '"+password+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) isSuccess = true;
			else isSuccess = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean updatestudent(String id, String name, String email) {
		boolean isSuccess = false;
		
		//validate
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "update student set Student_Name='"+name+"', Email='"+email+"' where Student_Id='"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) isSuccess = true;
			else isSuccess = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Student> getStudentDetails(String id) {
		int convID = Integer.parseInt(id); 
		ArrayList<Student> std = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from student where Student_Id='"+convID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int sid = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String usern = rs.getString(4);
				String pass = rs.getString(5); 
				
				Student s = new Student(sid, name, email, usern, pass);
				std.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return std;
		
	}
	
	public static ResultSet displayStudents() {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * from student";
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
