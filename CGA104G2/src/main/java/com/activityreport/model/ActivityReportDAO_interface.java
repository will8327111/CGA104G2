package com.activityreport.model;

import org.json.JSONArray;

import com.activity.common.ActivityCommon;

public interface ActivityReportDAO_interface extends ActivityCommon{
	
	public void insert (ActivityReportVO activityReportVO);
	public void delete(Integer actReportid);
	public void update(ActivityReportVO activityReportVO);
	public JSONArray getAll();
	public void deleteAct(Integer actId);
	
}
