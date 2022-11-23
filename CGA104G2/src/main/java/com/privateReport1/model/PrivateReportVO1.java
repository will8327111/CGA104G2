package com.privateReport1.model;

import java.io.Serializable;
import java.sql.Date;


public class PrivateReportVO1 implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer privateReportId;
	private Integer memberId;
	private String memberName;
	private Date privateReportTime;
	private String privateReportContent;
	private byte[] privateReportPic;  
	private Integer privateReportStatus;
	private String ReplyOfReport;
	private byte[] ReplyPic; 
	private Date ReplyOfReportTime;
	
	public Integer getPrivateReportId() {
		return privateReportId;
	}
	public void setPrivateReportId(Integer privateReportId) {
		this.privateReportId = privateReportId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Date getPrivateReportTime() {
		return privateReportTime;
	}
	public void setPrivateReportTime(Date privateReportTime) {
		this.privateReportTime = privateReportTime;
	}
	public String getPrivateReportContent() {
		return privateReportContent;
	}
	public void setPrivateReportContent(String privateReportContent) {
		this.privateReportContent = privateReportContent;
	}
	public byte[] getPrivateReportPic() {
		return privateReportPic;
	}
	public void setPrivateReportPic(byte[] privateReportPic) {
		this.privateReportPic = privateReportPic;
	}
	public Integer getPrivateReportStatus() {
		return privateReportStatus;
	}
	public void setPrivateReportStatus(Integer privateReportStatus) {
		this.privateReportStatus = privateReportStatus;
	}
	public String getReplyOfReport() {
		return ReplyOfReport;
	}
	public void setReplyOfReport(String replyOfReport) {
		ReplyOfReport = replyOfReport;
	}
	public byte[] getReplyPic() {
		return ReplyPic;
	}
	public void setReplyPic(byte[] replyPic) {
		ReplyPic = replyPic;
	}
	public Date getReplyOfReportTime() {
		return ReplyOfReportTime;
	}
	public void setReplyOfReportTime(Date replyOfReportTime) {
		ReplyOfReportTime = replyOfReportTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
