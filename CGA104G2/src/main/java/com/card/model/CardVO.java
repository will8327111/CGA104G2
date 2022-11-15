package com.card.model;

import java.sql.Timestamp;

//刷卡
public class CardVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer cardNumber;		// 刷卡編號
	private Integer memberBillId; 	// 住戶帳單編號
	private Integer memberId; 		// 住戶編號
	private String paymentMail;		// 信箱
	private Timestamp payDate;		// 刷卡時間(自動生成當下時間)
	private String memberPayMethod;	// 繳費方式
	private Integer costId;			// 費用編號
	private String billAmount;		// 帳單金額
	private String	costName;		// 費用名稱
	private String billDate; 		// 帳單月份(年,月)	
	
	
	public Integer getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(Integer cardNumber) {
		this.cardNumber = cardNumber;
	}
	
	public Integer getMemberBillId() {
		return memberBillId;
	}

	public void setMemberBillId(Integer memberBillId) {
		this.memberBillId = memberBillId;
	}
	
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
	public String getPaymentMail() {
		return paymentMail;
	}

	public void setPaymentMail(String paymentMail) {
		this.paymentMail = paymentMail;
	}
	
	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}
	
	public String getMemberPayMethod() {
		return memberPayMethod;
	}

	public void setMemberPayMethod(String memberPayMethod) {
		this.memberPayMethod = memberPayMethod;
	}
	
	public Integer getCostId() {
		return costId;
	}

	public void setCostId(Integer costId) {
		this.costId = costId;
	}
	
	public String getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
	}
	
	public String getCostName() {
		return costName;
	}

	public void setCostName(String costName) {
		this.costName = costName;
	}
	
	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	
	
}
