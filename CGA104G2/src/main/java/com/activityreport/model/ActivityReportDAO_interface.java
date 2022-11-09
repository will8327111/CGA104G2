package com.activityreport.model;

import java.util.List;

import com.activity.common.ActivityCommon;
import com.activity.model.ActivityVO;

public interface ActivityReportDAO_interface extends ActivityCommon{
	
	public void insert (ActivityReportVO activityReportVO);
	public void delete(Integer actReportid);
	public void update(ActivityReportVO activityReportVO);
	public List<ActivityVO> getAll();
	public void deleteAct(Integer actId);
	
}
