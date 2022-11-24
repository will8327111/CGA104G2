package com.card.model;

import java.sql.Timestamp;

//刷卡
public class CardVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer cardNumber;		// 刷卡編號
	private Integer memberId; 		// 住戶編號
	private String billGroup;		// 編號群組
	private Timestamp payDate;		// 刷卡時間(自動生成當下時間)
	
	
	public Integer getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(Integer cardNumber) {
		this.cardNumber = cardNumber;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getBillGroup() {
		return billGroup;
	}
	public void setBillGroup(String billGroup) {
		this.billGroup = billGroup;
	}
	public Timestamp getPayDate() {
		return payDate;
	}
	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
