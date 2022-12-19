package com.inventory;

public class Admin {
	private int Admin_ID;
	private String name;
	private String email;
	private String username;
	private String password;
	
	public Admin(int admin_ID, String name, String email, String username, String password) {
		super();
		Admin_ID = admin_ID;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
	}

	public int getAdmin_ID() {
		return Admin_ID;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
}
