package com.record.model;

import java.sql.Date;
import java.sql.Time;

public class RecordVO {
	private Integer recordId;
	private Integer memberId;
	private Integer ameId;
	private Date recordDate;
	private String recordStatime;
	private Integer recordCount;
	private Integer recordStatus;
	
	public Integer getRecordId() {
		return recordId;
	}
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getAmeId() {
		return ameId;
	}
	public void setAmeId(Integer ameId) {
		this.ameId = ameId;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public String getRecordStatime() {
		return recordStatime;
	}
	public void setRecordStatime(String recordStatime) {
		this.recordStatime = recordStatime;
	}
	public Integer getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}
	public Integer getRecordStatus() {
		return recordStatus;
	}
	public void setRecordStatus(Integer recordStatus) {
		this.recordStatus = recordStatus;
	}
	

}
