package com.backstageAccount.model;

public class BackstageAccountVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer bmId;
	private String bmName;
	private String bmAccount;
	private String bmPassword;
	private String bmEmail;
	private Integer bmStatus;
	private Integer bmCapabilitiesId;
	private String bmCapabilitiesName;
	private String bmCapabilitiesContent;
	
	public Integer getBmId() {
		return bmId;
	}
	public void setBmId(Integer bmId) {
		this.bmId = bmId;
	}
	public String getBmName() {
		return bmName;
	}
	public void setBmName(String bmName) {
		this.bmName = bmName;
	}
	public String getBmAccount() {
		return bmAccount;
	}
	public void setBmAccount(String bmAccount) {
		this.bmAccount = bmAccount;
	}
	public String getBmPassword() {
		return bmPassword;
	}
	public void setBmPassword(String bmPassword) {
		this.bmPassword = bmPassword;
	}
	public String getBmEmail() {
		return bmEmail;
	}
	public void setBmEmail(String bmEmail) {
		this.bmEmail = bmEmail;
	}
	public Integer getBmStatus() {
		return bmStatus;
	}
	public void setBmStatus(Integer bmStatus) {
		this.bmStatus = bmStatus;
	}
	public Integer getBmCapabilitiesId() {
		return bmCapabilitiesId;
	}
	public void setBmCapabilitiesId(Integer bmCapabilitiesId) {
		this.bmCapabilitiesId = bmCapabilitiesId;
	}
	public String getBmCapabilitiesName() {
		return bmCapabilitiesName;
	}
	public void setBmCapabilitiesName(String bmCapabilitiesName) {
		this.bmCapabilitiesName = bmCapabilitiesName;
	}
	public String getBmCapabilitiesContent() {
		return bmCapabilitiesContent;
	}
	public void setBmCapabilitiesContent(String bmCapabilitiesContent) {
		this.bmCapabilitiesContent = bmCapabilitiesContent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
