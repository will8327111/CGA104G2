package com.activitytype.model;

import java.util.List;

import org.json.JSONArray;

import com.activity.common.ActivityCommon;


public interface ActivityTypeDAO_interface extends ActivityCommon{
	
	public void insert (ActivityTypeVO ActivityTypeVO);
	public void delete(Integer acttypeid);  
	public List<ActivityTypeVO> getAll();
	public JSONArray getType();

}
