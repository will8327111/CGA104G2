package com.backstageAuthorization.model;

import java.util.List;

import com.backstageAccount.model.BackstageAccountVO;

public class BackstageAuthorizationService {
	
	private BackstageAuthorizationJDBCDAO dao;
	
	public BackstageAuthorizationService() {
		dao = new BackstageAuthorizationJDBCDAO();
	};
	
	public BackstageAuthorizationVO insert(Integer bmId, Integer bmCapabilitiesId) {
		
		BackstageAuthorizationVO backstageAuthorizationVO = new BackstageAuthorizationVO();
		
		backstageAuthorizationVO.setBmId(bmId);
		backstageAuthorizationVO.setBmCapabilitiesId(bmCapabilitiesId);
		dao.insert(backstageAuthorizationVO);

		return backstageAuthorizationVO;
	};
	
	public void delete(Integer bmId, Integer bmCapabilitiesId) {
		dao.delete(bmId, bmCapabilitiesId);
	};
	
	public BackstageAuthorizationVO findByBmIdAndCapId(Integer bmId, Integer bmCapabliitiesId) {
		return dao.findByBmIdAndCapId(bmId, bmCapabliitiesId);
	};
	
	public List<BackstageAuthorizationVO> getEveryInfo() {

		return dao.getEveryInfo();
	};
	
	public List<BackstageAuthorizationVO> getSelectedAuthorization(Integer bmId){
		return dao.getSelectedAuthorization(bmId);
	};
	
	public List<BackstageAuthorizationVO> getAll(){
		return dao.getAll();
	};

	public List<BackstageAuthorizationVO> getBmIdAndBmName(){
		return dao.getBmIdAndBmName();
	};
	
	public List<BackstageAuthorizationVO> getBmCapIdAndBmCapName(){
		return dao.getBmCapIdAndBmCapName();
	};
	
}
