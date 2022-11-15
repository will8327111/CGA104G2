package com.ame_state.model;

import java.sql.Date;

public class Ame_StateVO {
	private Integer ameStateId;
	private Integer ameId;
	private Date recordDate;
	private String recordStatime;
	
	public Integer getAmeStateId() {
		return ameStateId;
	}
	public void setAmeStateId(Integer ameStateId) {
		this.ameStateId = ameStateId;
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
	


}
