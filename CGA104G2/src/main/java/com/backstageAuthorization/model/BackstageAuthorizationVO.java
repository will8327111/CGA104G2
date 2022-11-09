package com.backstageAuthorization.model;

public class BackstageAuthorizationVO implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer bmId;
	private Integer bmCapabilitiesId;
	
	private String bmName;
	private String bmCapabilitiesName;
	private String bmCapabilitiesContent;
	
	
	public Integer getBmId() {
		return bmId;
	}
	public void setBmId(Integer bmId) {
		this.bmId = bmId;
	}
	public Integer getBmCapabilitiesId() {
		return bmCapabilitiesId;
	}
	public void setBmCapabilitiesId(Integer bmCapabilitiesId) {
		this.bmCapabilitiesId = bmCapabilitiesId;
	}
	public String getBmName() {
		return bmName;
	}
	public void setBmName(String bmName) {
		this.bmName = bmName;
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
