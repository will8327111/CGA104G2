	package com.activityreport.model;

import org.json.JSONArray;
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
		dao.deleteAct(actId);
	}

	@Transactional
	public JSONArray getAll() {
		return dao.getAll();
	}
	
	@Transactional
	public void updateNote(ActivityReportVO activityReportVO) {
		dao.updateNote(activityReportVO);
	}
	
	@Transactional
	public void updateStatus(ActivityReportVO activityReportVO) {
		dao.updatStatus(activityReportVO);
	}
	
	@Transactional
	public JSONArray getHistory() {
		return dao.getHistory();
	}
	
}
