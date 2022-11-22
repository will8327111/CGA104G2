package com.store.model;

import org.json.JSONArray;

import com.mail.common.MailCommon;

public interface StoreDAO_interface extends MailCommon{
		public void insert(StoreVO storeVO);
	    public void update(StoreVO storeVO);
	    public void delete(Integer storeVO);
	    public JSONArray findByPrimaryKey(Integer mailVO);
	    public JSONArray getAll();
//	    public byte[] getPhoto(Integer member_Id);
//		public byte[] getStorePhoto(Integer store_Id);
		public JSONArray findStoreType();
		public JSONArray search(String storeTypeName, Integer storeId);

}

