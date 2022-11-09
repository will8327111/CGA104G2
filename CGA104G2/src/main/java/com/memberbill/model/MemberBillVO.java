package com.memberbill.model;

import java.sql.Date;

public class MemberBillVO implements java.io.Serializable {

	private Integer memberBillId;	//住戶帳單編號
	private Integer memberId;		//住戶編號
	private Integer costId;			//費用編號
	private String memberName;		//住戶姓名
	private String billAmount;		//帳單金額
	private String billDate;		//帳單月份(年,月)
	private String memberPay;		//繳費狀態
	private Date memberPayDate;		//繳費日期
	private Date memberPayLimit;	//繳費期限
	private String memberPayMethod; //繳費方式
	private String modifyUser;		//修改人員
	private Date modifyDate;		//修改時間
	private byte[] memberPhoto;		//匯款證明

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

	public Integer getCostId() {
		return costId;
	}

	public void setCostId(Integer costId) {
		this.costId = costId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public String getMemberPay() {
		return memberPay;
	}

	public void setMemberPay(String memberPay) {
		this.memberPay = memberPay;
	}

	public Date getMemberPayDate() {
		return memberPayDate;
	}

	public void setMemberPayDate(Date memberPayDate) {
		this.memberPayDate = memberPayDate;
	}

	public Date getMemberPayLimit() {
		return memberPayLimit;
	}

	public void setMemberPayLimit(Date memberPayLimit) {
		this.memberPayLimit = memberPayLimit;
	}

	public String getMemberPayMethod() {
		return memberPayMethod;
	}

	public void setMemberPayMethod(String memberPayMethod) {
		this.memberPayMethod = memberPayMethod;
	}

	public String getModifyUser() {
		return modifyUser;
	}

	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public byte[] getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(byte[] memberPhoto) {
		this.memberPhoto = memberPhoto;
    }

}