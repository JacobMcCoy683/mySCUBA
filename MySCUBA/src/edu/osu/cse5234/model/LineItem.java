package edu.osu.cse5234.model;

import javax.persistence.Column;

public class LineItem {
	int id;
	
	@Column(name="ITEM_NUMBER")
	int itemNumber;
	
	
	@Column(name="NAME")
	String name;
	
	@Column(name="PRICE")
	double price;
	
	@Column(name="QUANTITY")
	int quantity;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	
}
