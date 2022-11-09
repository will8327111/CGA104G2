package com.activitytype.model;

import java.util.List;

import org.json.JSONArray;

import com.activity.common.ActivityServiceCommon;

public class ActivityTypeService implements ActivityServiceCommon{
	
	private ActivityTypeDAO_interface dao;
	
	public ActivityTypeService() {
		dao = new ActivityTypeDAO();
	}
	
	

	
	
	public List<ActivityTypeVO> getAll(){
		return dao.getAll();
	}

	public JSONArray getType() {
		return  dao.getType();
	}
	
}
