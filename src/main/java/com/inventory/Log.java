package com.inventory;

public class Log {
	private int id;
	private String login_date;
	private String login_time;
	private String logout_time;
	
	public Log(int id, String login_date, String login_time, String logout_time) {
		super();
		this.id = id;
		this.login_date = login_date;
		this.login_time = login_time;
		this.logout_time = logout_time;
	}

	public int getId() {
		return id;
	}

	public String getLogin_date() {
		return login_date;
	}

	public String getLogin_time() {
		return login_time;
	}

	public String getLogout_time() {
		return logout_time;
	}

}
