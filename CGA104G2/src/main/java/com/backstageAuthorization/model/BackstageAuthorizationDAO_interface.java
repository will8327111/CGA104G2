package com.backstageAuthorization.model;

import java.util.List;


public interface BackstageAuthorizationDAO_interface {

	public void insert(BackstageAuthorizationVO backstageAuthorizationVO);
	
	public void delete(Integer bmId, Integer bmCapabliitieId);

	public List<BackstageAuthorizationVO> getAll();
}
