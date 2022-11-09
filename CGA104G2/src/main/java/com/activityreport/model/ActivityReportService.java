package com.activityreport.model;

public class ActivityReportService {

	
	private ActivityReportDAO_interface dao;
	
	public ActivityReportService() {
		dao = new ActivityReportDAO();
		
	}
	
	
	public void insert(ActivityReportVO activityReportVO) {
		dao.insert(activityReportVO);
	}
	
	public void deleteAct(Integer actId) {
		dao.delete(actId);
	}

	
}
