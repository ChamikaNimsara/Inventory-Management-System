package com.inventory;

import java.sql.Blob;

public class inventory {
	private String id;
	private String date;
	private String item;
	private String numbers;
	private String GRN_REF;
	private String SB_Update;
	private String location;
	private String description;
	private Blob image;
	
	public inventory(String id, String date, String item, String numbers, String gRN_REF, String sB_Update,
			String location, String description, Blob image) {
		super();
		this.id = id;
		this.date = date;
		this.item = item;
		this.numbers = numbers;
		GRN_REF = gRN_REF;
		SB_Update = sB_Update;
		this.location = location;
		this.description = description;
		this.image = image;
	}

	public String getId() {
		return id;
	}

	public String getDate() {
		return date;
	}

	public String getItem() {
		return item;
	}

	public String getNumbers() {
		return numbers;
	}

	public String getGRN_REF() {
		return GRN_REF;
	}

	public String getSB_Update() {
		return SB_Update;
	}

	public String getLocation() {
		return location;
	}

	public String getDescription() {
		return description;
	}

	public Blob getImage() {
		return image;
	}
	
}
