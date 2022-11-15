package com.cost.model;


public class CostService {
	private CostDAO_interface dao;
	
	public CostService(){
		dao = new CostJNDIDAO();
	}
	public CostVO addCost(String costName,java.sql.Date startDate,Integer cost,Integer enableStatus,String createUser) {
	
	CostVO costVo=new CostVO();
	
	costVo.setCostName(costName);
	costVo.setStartDate(startDate);
	costVo.setCost(cost);
	costVo.setEnableStatus(enableStatus);
	costVo.setCreateUser(createUser);
	dao.insert(costVo);
	
	return costVo;
	}	
}
