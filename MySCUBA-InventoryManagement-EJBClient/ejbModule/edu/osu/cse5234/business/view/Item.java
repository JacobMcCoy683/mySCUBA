package edu.osu.cse5234.business.view;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ITEM")
public class Item implements java.io.Serializable{
	
	/**
	 * Automatically generated serial
	 */
	public Item() 
    { 
        System.out.println("Item Constructor called"); 
    } 
	private static final long serialVersionUID = -495513525080800891L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	int id;
	
	@Column(name="ITEM_NUMBER")
	int itemNumber;
	
	@Column(name="DESCRIPTION")
	String description;
	
	@Column(name="NAME")
	String name;
	
	@Column(name="PRICE")
	String price;
	
	@Column(name="QUANTITY")
	int quantity;
	
//	String available;
	
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
//	public String getAvailable() {
//		return available;
//	}
//
//	public void setAvailable(String available) {
//		this.available = available;
//	}

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
	
	
}