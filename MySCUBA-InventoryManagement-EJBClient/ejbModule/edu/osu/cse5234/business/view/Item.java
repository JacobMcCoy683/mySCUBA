package edu.osu.cse5234.business.view;

public class Item implements java.io.Serializable{

	/**
	 * Automatically generated serial
	 */
	private static final long serialVersionUID = -495513525080800891L;
	
	String name;
	String price;
	String quantity;
	String available;
	
	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getQuantity() {
		return quantity;
	}
	
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
}