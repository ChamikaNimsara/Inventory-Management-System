package com.inventory;

public class Item {
	private inventory inv;
	private int qty;
	
	public Item() {
		
	}

	public Item(inventory inv, int qty) {
		super();
		this.inv = inv;
		this.qty = qty;
	}

	public inventory getInv() {
		return inv;
	}

	public void setInv(inventory inv) {
		this.inv = inv;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
