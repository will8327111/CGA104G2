package com.backstageAccount.model;

import java.util.List;
import java.util.Set;

import com.backstageAuthorization.model.*;

public interface BackstageAccountDAO_interface {

	public BackstageAccountVO findByAcAndPwd(String bmAccount, String bmPassword);

	public void insert(BackstageAccountVO backstageAccountVO);

	public void update(BackstageAccountVO backstageAccountVO);

	public void delete(Integer bmId);
	
	public List<BackstageAccountVO> findOneAuthorization(Integer bmId);
	
	public BackstageAccountVO findByPrimaryKey(Integer bmId);

	public BackstageAccountVO findByAcAndEmail(String bmAccount, String bmEmail);
	
	public BackstageAccountVO findByEmail(String bmEmail);
	
	public BackstageAccountVO findByAccount(String bmAccount);
	
	public List<BackstageAccountVO> getAll();

}
