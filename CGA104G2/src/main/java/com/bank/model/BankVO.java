package com.bank.model;

public class BankVO implements java.io.Serializable{

	private String bankId;//銀行代號
	private String bankName;//銀行名稱
	
	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
}
