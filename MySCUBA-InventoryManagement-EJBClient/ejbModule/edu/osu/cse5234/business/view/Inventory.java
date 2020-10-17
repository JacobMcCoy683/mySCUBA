package edu.osu.cse5234.business.view;

import java.util.List;

public class Inventory implements java.io.Serializable {

	/**
	 * Automatically generated serial
	 */
	private static final long serialVersionUID = -376911873795007009L;
	
	List<Item> items;

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}
