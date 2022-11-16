	package com.activityreport.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ActivityReportService {

	@Autowired
	private ActivityReportDAO_interface dao;
	
	public ActivityReportService() {
		dao = new ActivityReportDAO();
		
	}
	
	@Transactional
	public void insert(ActivityReportVO activityReportVO) {
		dao.insert(activityReportVO);
	}
	@Transactional
	public void deleteAct(Integer actId) {
		dao.delete(actId);
	}

	
}
