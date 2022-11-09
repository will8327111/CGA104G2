package com.transfer.model;

import java.sql.Timestamp;

public class TransferVO implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	// 實現 序列化操作
	private Integer transferId; 		// 匯款資訊編號
	private Integer memberBillId; 		// 住戶帳單編號
	private String bankId; 				// 銀行代號
	private Integer bankNumber; 		// 後五碼
	private Timestamp bankDate;			// 住戶匯款時間
	private Integer memberId; 			// 住戶編號
	private String billDate; 			// 帳單月份(年,月)
	private String memberPay; 			// 繳費狀態
	private byte[] memberPhoto;			// 匯款證明
	private String memberPayMethod;		// 繳費方式
	private Integer costId;				// 費用編號

	public Integer getTransferId() {
		return transferId;
	}

	public void setTransferId(Integer transferId) {
		this.transferId = transferId;
	}

	public Integer getMemberBillId() {
		return memberBillId;
	}

	public void setMemberBillId(Integer memberBillId) {
		this.memberBillId = memberBillId;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public Integer getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(Integer bankNumber) {
		this.bankNumber = bankNumber;
	}

	public Timestamp getBankDate() {
		return bankDate;
	}

	public void setBankDate(Timestamp bankDate) {
		this.bankDate = bankDate;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
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

	public byte[] getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(byte[] memberPhoto) {
		this.memberPhoto = memberPhoto;
	}
	public Integer getCostId() {
		return costId;
	}

	public void setCostId(Integer costId) {
		this.costId = costId;
	}
	public String getMemberPayMethod() {
		return memberPayMethod;
	}

	public void setMemberPayMethod(String memberPayMethod) {
		this.memberPayMethod = memberPayMethod;
	}
}
