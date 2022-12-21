package com.inventory;

import java.sql.Blob;

public class consumables {
	private int id;
	private String Material;
	private String date;
	private int reciept;
	private int issued;
	private int available;
	private String location;
	private String description;
	private String approval;
	private Blob image;
	
	public consumables(int id, String material, String date, int reciept, int issued, int available, String location,
			String description, String approval, Blob image) {
		super();
		this.id = id;
		Material = material;
		this.date = date;
		this.reciept = reciept;
		this.issued = issued;
		this.available = available;
		this.location = location;
		this.description = description;
		this.approval = approval;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public String getMaterial() {
		return Material;
	}

	public String getDate() {
		return date;
	}

	public int getReciept() {
		return reciept;
	}

	public int getIssued() {
		return issued;
	}

	public int getAvailable() {
		return available;
	}

	public String getLocation() {
		return location;
	}

	public String getDescription() {
		return description;
	}

	public String getApproval() {
		return approval;
	}

	public Blob getImage() {
		return image;
	}
	
}
