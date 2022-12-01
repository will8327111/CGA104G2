package com.maintenanceRecord.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MaintenanceRecordVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer maintenanceId;
	private Integer memberId;
	private String memberAc;
	private String memberName;
	private Timestamp maintenanceTime;
	private String maintenanceContent;
	private byte[] maintenancePic;  
	private Integer maintenanceStatus;
	private String ReplyOfMaintenance;
	private byte[] ReplyPic; 
	private Timestamp ReplyOfMaintenanceTime;
	
	public Integer getMaintenanceId() {
		return maintenanceId;
	}
	public void setMaintenanceId(Integer maintenanceId) {
		this.maintenanceId = maintenanceId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberAc() {
		return memberAc;
	}
	public void setMemberAc(String memberAc) {
		this.memberAc = memberAc;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Timestamp getMaintenanceTime() {
		return maintenanceTime;
	}
	public void setMaintenanceTime(Timestamp maintenanceTime) {
		this.maintenanceTime = maintenanceTime;
	}
	public String getMaintenanceContent() {
		return maintenanceContent;
	}
	public void setMaintenanceContent(String maintenanceContent) {
		this.maintenanceContent = maintenanceContent;
	}
	public byte[] getMaintenancePic() {
		return maintenancePic;
	}
	public void setMaintenancePic(byte[] maintenancePic) {
		this.maintenancePic = maintenancePic;
	}
	public Integer getMaintenanceStatus() {
		return maintenanceStatus;
	}
	public void setMaintenanceStatus(Integer maintenanceStatus) {
		this.maintenanceStatus = maintenanceStatus;
	}
	public String getReplyOfMaintenance() {
		return ReplyOfMaintenance;
	}
	public void setReplyOfMaintenance(String replyOfMaintenance) {
		ReplyOfMaintenance = replyOfMaintenance;
	}
	public byte[] getReplyPic() {
		return ReplyPic;
	}
	public void setReplyPic(byte[] replyPic) {
		ReplyPic = replyPic;
	}
	public Timestamp getReplyOfMaintenanceTime() {
		return ReplyOfMaintenanceTime;
	}
	public void setReplyOfMaintenanceTime(Timestamp replyOfMaintenanceTime) {
		ReplyOfMaintenanceTime = replyOfMaintenanceTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
