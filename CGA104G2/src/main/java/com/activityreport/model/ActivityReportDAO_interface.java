package com.activityreport.model;

import org.json.JSONArray;

import com.activity.common.ActivityCommon;

public interface ActivityReportDAO_interface extends ActivityCommon{
	
	public void insert (ActivityReportVO activityReportVO);
	public JSONArray getAll();
	public JSONArray getHistory();
	public void deleteAct(Integer actId);
	public void updateNote(ActivityReportVO activityReportVO);
	public void updatStatus(ActivityReportVO activityReportVO);
	
}
