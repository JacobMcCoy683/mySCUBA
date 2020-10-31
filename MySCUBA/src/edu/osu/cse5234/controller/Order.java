package edu.osu.cse5234.controller;

import java.util.List;

import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.model.LineItem;

public class Order {

	List<LineItem> LineItems;
	int id;
	String customerName;
	String emailAddress;
	
	ShippingInfo shippingInfo;
	PaymentInfo paymentInfo;
	
	public ShippingInfo getShippingInfo() {
		return shippingInfo;
	}
	public void setShippingInfo(ShippingInfo shippingInfo) {
		this.shippingInfo = shippingInfo;
	}
	public PaymentInfo getPaymentInfo() {
		return paymentInfo;
	}
	public void setPaymentInfo(PaymentInfo paymentInfo) {
		this.paymentInfo = paymentInfo;
	}
	public List<LineItem> getLineItems() {
		return LineItems;
	}
	public void setLineItems(List<LineItem> lineItems) {
		LineItems = lineItems;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	
}
