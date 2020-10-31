package edu.osu.cse5234.controller;

import javax.persistence.Entity;
import javax.persistence.Table;

//@Entity
//@Table(name="ITEM")
public class PaymentInfo {
	
	String creditCardNumber;
	String expirationDate;
	String cvvCode;
	String cardHolderName;
	int id;
	
	
	public String getCreditCardNumber() {
		return creditCardNumber;
	}
	
	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExpirationDate() {
		return expirationDate;
	}
	
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	
	public String getCvvCode() {
		return cvvCode;
	}
	
	public void setCvvCode(String cvvCode) {
		this.cvvCode = cvvCode;
	}
	
	public String getCardHolderName() {
		return cardHolderName;
	}
	
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
}
