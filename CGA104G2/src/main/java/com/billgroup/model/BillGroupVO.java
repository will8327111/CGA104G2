package com.billgroup.model;

public class BillGroupVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private String billGroup;				// 編號群組
	private Integer memberId;				// 住戶編號
	private Integer managementFees; 		// 管理費
	private Integer parkingSpaceCleaningFee;// 車位清潔費
	
	public String getBillGroup() {
		return billGroup;
	}

	public void setBillGroup(String billGroup) {
		this.billGroup = billGroup;
	}
	
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
	public Integer getManagementFees() {
		return managementFees;
	}

	public void setManagementFees(Integer managementFees) {
		this.managementFees = managementFees;
	}
	
	public Integer getParkingSpaceCleaningFee() {
		return parkingSpaceCleaningFee;
	}

	public void setParkingSpaceCleaningFee(Integer parkingSpaceCleaningFee) {
		this.parkingSpaceCleaningFee = parkingSpaceCleaningFee;
	}
}
