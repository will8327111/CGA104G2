package com.store.model;

import org.json.JSONArray;

public interface StoreDAO_interface {
		public void insert(StoreVO storeVO);
	    public void update(StoreVO storeVO);
	    public void delete(Integer storeVO);
	    public StoreVO findByPrimaryKey(Integer mailVO);
	    public JSONArray getAll();
//	    public byte[] getPhoto(Integer member_Id);
//		public byte[] getStorePhoto(Integer store_Id);

}
