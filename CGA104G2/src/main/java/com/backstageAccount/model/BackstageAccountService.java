package com.backstageAccount.model;

import java.util.List;
import java.util.Set;

import com.backstageAuthorization.model.BackstageAuthorizationVO;


public class BackstageAccountService {
	
	private BackstageAccountDAO_interface dao;
	
	public BackstageAccountService() {
		dao = new BackstageAccountJDBCDAO();
	};
	
	public BackstageAccountVO findByAcAndPwd(String bmAccount, String bmPassword) {

		return dao.findByAcAndPwd(bmAccount, bmPassword);
	};
	
	public BackstageAccountVO findByAcAndEmail(String bmAccount, String bmEmail) {

		return dao.findByAcAndEmail(bmAccount, bmEmail);
	};

	public BackstageAccountVO findByPrimaryKey(Integer bmId) {

		return dao.findByPrimaryKey(bmId);
	};
	
	public List<BackstageAccountVO> findOneAuthorization(Integer bmId) {

		return dao.findOneAuthorization(bmId);
	};
	
	
	public BackstageAccountVO insert(String bmName, String bmAccount, 
			String bmPassword, String bmEmail, Integer bmStatus) {
		
		BackstageAccountVO backstageAccountVO = new BackstageAccountVO();
		
		backstageAccountVO.setBmName(bmName);
		backstageAccountVO.setBmAccount(bmAccount);
		backstageAccountVO.setBmPassword(bmPassword);
		backstageAccountVO.setBmEmail(bmEmail);
		backstageAccountVO.setBmStatus(bmStatus);
		dao.insert(backstageAccountVO);

		return backstageAccountVO;
	};
	
	
	public BackstageAccountVO update(Integer bmId, String bmName, String bmAccount, 
			String bmPassword, String bmEmail, Integer bmStatus) {
		
		BackstageAccountVO backstageAccountVO = new BackstageAccountVO();
		
		backstageAccountVO.setBmId(bmId);
		backstageAccountVO.setBmName(bmName);
		backstageAccountVO.setBmAccount(bmAccount);
		backstageAccountVO.setBmPassword(bmPassword);
		backstageAccountVO.setBmEmail(bmEmail);
		backstageAccountVO.setBmStatus(bmStatus);
		dao.update(backstageAccountVO);

		return backstageAccountVO;
	};
	
	public void delete(Integer bmId) {
		dao.delete(bmId);
	}
	
	public List<BackstageAccountVO> getAll(){
		return dao.getAll();
	};
	
//	public Set<BackstageAuthorizationVO> getCapsByBmId(Integer bmId) {
//		return dao.getCapsByBmId(bmId);
//	}
	
}
