package com.activityreport.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.activity.model.ActivityVO;
import com.activitysignup.model.ActivitySignupVO;

public class ActivityReportDAO implements ActivityReportDAO_interface{

	@Override
	public void insert(ActivityReportVO activityReportVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer actReportid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ActivityReportVO activityReportVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ActivityVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAct(Integer actId) {
			beginTranscation();
			try {
				final String sql = "DELETE ActivityReportVO where actId = :actId ";
				getSession().createQuery(sql).setParameter("actId", actId).executeUpdate();
			commit();
		} catch (Exception e) {
			rollback();
		}	
			
	}
	
	


}
