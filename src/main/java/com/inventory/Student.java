package com.inventory;

public class Student {
	private int Student_ID;
	private String name;
	private String email;
	private String username;
	private String password;
	
	public Student(int student_ID, String name, String email, String username, String password) {
		super();
		Student_ID = student_ID;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
	}

	public int getStudent_ID() {
		return Student_ID;
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
