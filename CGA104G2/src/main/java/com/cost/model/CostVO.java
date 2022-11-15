package com.cost.model;

import java.math.BigDecimal;
import java.sql.Date;

//費用設定
public class CostVO implements java.io.Serializable{
	private Integer costId;			//費用編號
	private String costName;		//費用名稱
	private Integer cost; 			//坪數費用
	private Date startDate;			//開始日期
	private Date endDate;			//結束日期
	private Integer enableStatus;	//啟用狀態  
	private String createUser; 		//新增人員
	private Date createDate;		//新增日期
	private String modifyUser;		//修改人員
	private Date modifyDate;		//修改日期
	private Integer bmId;			//管理員編號
	
	public Integer getCostId() {
		return costId;
	} 

	public void setCostId(Integer costId) {
		this.costId = costId;
	}
	
	public String getCostName() {
		return costName;
	}

	public void setCostName(String costName) {
		this.costName = costName;
	}
	
	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Integer getEnableStatus() {
		return enableStatus;
	}

	public void setEnableStatus(Integer enableStatus) {
		this.enableStatus = enableStatus;
	}
	
	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	
	public Integer getBmId() {
		return bmId;
	}

	public void setBmId(Integer bmId) {
		this.bmId = bmId;
	}
}
