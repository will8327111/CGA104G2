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
	
	public List<BackstageAuthorizationVO> getAll(){
		return dao.getAll();
	};

}
