package com.backstageCapabilities.model;

import java.util.List;

import com.backstageCapabilities.model.BackstageCapabilitiesVO;

public interface BackstageCapabilitiesDAO_interface {
	
	public void insert(BackstageCapabilitiesVO backstageCapabilitiesVO);

	public void update(BackstageCapabilitiesVO backstageCapabilitiesVO);

	public void delete(Integer bmCapabilitiesId);

	public BackstageCapabilitiesVO updateNeeds(String bmCapabilitiesName, String bmCapabilitiesContent);
	
	public BackstageCapabilitiesVO findByPrimaryKey(Integer bmCapabilitiesId);
	
	public BackstageCapabilitiesVO findByCapName(String bmCapabilitiesName);

	public List<BackstageCapabilitiesVO> getAll();
}
