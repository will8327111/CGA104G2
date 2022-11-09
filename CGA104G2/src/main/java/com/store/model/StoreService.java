package com.store.model;

import java.math.BigDecimal;
import java.util.Base64;

import org.json.JSONArray;

public class StoreService {
	private StoreDAO_interface dao;
	public StoreService() {
		dao = new StoreJDBCDAO();
	}
	
	public JSONArray getAll() {
		return dao.getAll();
	}
	
	public StoreVO addStore(StoreVO storeVO) {
		storeVO.setStorePhoto(Base64.getDecoder().decode(storeVO.getBase64img()));
		dao.insert(storeVO);
		return storeVO;
	}
	
	public StoreVO addStore(Integer storeTypeId,String storeInfo,String storeLoc,BigDecimal storeLon,BigDecimal storeLat ,byte[] storePhoto) {

		StoreVO storeVO = new StoreVO();
				
//		storeVO.setStoreId(storeId);
		storeVO.setStoreTypeId(storeTypeId);
		storeVO.setStoreInfo(storeInfo);
		storeVO.setStoreLoc(storeLoc);
		storeVO.setStoreLon(storeLon);		
		storeVO.setStoreLat(storeLat);
		storeVO.setStorePhoto(storePhoto);
		dao.insert(storeVO);

		return storeVO;
	}
	public void deleteStore(Integer storeId) {
		dao.delete(storeId);
	}

	public StoreVO updateStore(Integer storeId, Integer storeTypeId, String storeInfo, String storeLoc,BigDecimal storeLon,
			BigDecimal storeLat, byte[] storePhoto) {

		StoreVO storeVO = new StoreVO();
		storeVO.setStoreId(storeId);
		storeVO.setStoreTypeId(storeTypeId);
		storeVO.setStoreInfo(storeInfo);
		storeVO.setStoreLoc(storeLoc);
		storeVO.setStoreLon(storeLon);
		storeVO.setStoreLat(storeLat);
		storeVO.setStorePhoto(storePhoto);
		dao.update(storeVO);

		return storeVO;
	}
	
	public StoreVO getOneMail(Integer storeId) {
		return dao.findByPrimaryKey(storeId);
	}


}
