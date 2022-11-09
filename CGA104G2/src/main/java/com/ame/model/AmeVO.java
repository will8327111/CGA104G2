package com.ame.model;

public class AmeVO implements java.io.Serializable{
	private Integer  ameId;
	private String   ameName;
	private byte[]   ameImg;
	private String   ameIntroduce;
	private Integer  amePoint;
	private Integer  ameMax;
	private String   ameOpening;
	
	public Integer getAmeId() {
		return ameId;
	}
	public void setAmeId(Integer ameId) {
		this.ameId = ameId;
	}
	public String getAmeName() {
		return ameName;
	}
	public void setAmeName(String ameName) {
		this.ameName = ameName;
	}
	public byte[] getAmeImg() {
		return ameImg;
	}
	public void setAmeImg(byte[] ameImg) {
		this.ameImg = ameImg;
	}
	public String getAmeIntroduce() {
		return ameIntroduce;
	}
	public void setAmeIntroduce(String ameIntroduce) {
		this.ameIntroduce = ameIntroduce;
	}
	public Integer getAmePoint() {
		return amePoint;
	}
	public void setAmePoint(Integer amePoint) {
		this.amePoint = amePoint;
	}
	public Integer getAmeMax() {
		return ameMax;
	}
	public void setAmeMax(Integer ameMax) {
		this.ameMax = ameMax;
	}
	public String getAmeOpening() {
		return ameOpening;
	}
	public void setAmeOpening(String ameOpening) {
		this.ameOpening = ameOpening;
	}

}
