package com.card.model;

import java.sql.Timestamp;

//刷卡
public class CardVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer cardNumber;		// 刷卡編號
	private Integer memberId; 		// 住戶編號
	private String billGroup;		// 編號群組
	private Timestamp payDate;		// 刷卡時間(自動生成當下時間)
	private String memberName;		// 住戶姓名
	private Integer memberPay;		// 繳費狀態
	private String billDate;		// 帳單月份(年,月)
	private Integer memberBillId;		//住戶帳單編號
	
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Integer getMemberPay() {
		return memberPay;
	}

	public void setMemberPay(Integer memberPay) {
		this.memberPay = memberPay;
	}
	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public Integer getMemberBillId() {
		return memberBillId;
	}

	public void setMemberBillId(Integer memberBillId) {
		this.memberBillId = memberBillId;
	}
	
}
