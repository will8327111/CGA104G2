package com.backstageCapabilities.model;

import java.util.List;

public class BackstageCapabilitiesService {
	
	private BackstageCapabilitiesDAO_interface dao;
	
	public BackstageCapabilitiesService() {
		dao = new BackstageCapabilitiesJDBCDAO();
	};
	
	public BackstageCapabilitiesVO insert(String bmCapabilitiesName,
			String bmCapabilitiesContent) {
		BackstageCapabilitiesVO backstageCapabilitiesVO = new BackstageCapabilitiesVO();
		
		backstageCapabilitiesVO.setBmCapabilitiesName(bmCapabilitiesName);
		backstageCapabilitiesVO.setBmCapabilitiesContent(bmCapabilitiesContent);
		dao.insert(backstageCapabilitiesVO);

		return backstageCapabilitiesVO;
	}

	public BackstageCapabilitiesVO update(Integer bmCapabilitiesId, String bmCapabilitiesName,
			String bmCapabilitiesContent) {
		BackstageCapabilitiesVO backstageCapabilitiesVO = new BackstageCapabilitiesVO();
		
		backstageCapabilitiesVO.setBmCapabilitiesId(bmCapabilitiesId);
		backstageCapabilitiesVO.setBmCapabilitiesName(bmCapabilitiesName);
		backstageCapabilitiesVO.setBmCapabilitiesContent(bmCapabilitiesContent);
		dao.update(backstageCapabilitiesVO);

		return backstageCapabilitiesVO;
	};

	public void delete(Integer bmCapabilitiesId) {
		dao.delete(bmCapabilitiesId);
	};

	public BackstageCapabilitiesVO findByPrimaryKey(Integer bmCapabilitiesId) {
		return dao.findByPrimaryKey(bmCapabilitiesId);
	};

	public BackstageCapabilitiesVO updateNeeds(String bmCapabilitiesName, String bmCapabilitiesContent) {
		return dao.updateNeeds(bmCapabilitiesName, bmCapabilitiesContent);
	};
	
	public BackstageCapabilitiesVO findByCapName(String bmCapabilitiesName) {
		return dao.findByCapName(bmCapabilitiesName);
	};
	
	public List<BackstageCapabilitiesVO> getAll(){
		return dao.getAll();
	};
}
