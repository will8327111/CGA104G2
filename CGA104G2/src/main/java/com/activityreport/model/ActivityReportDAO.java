package com.activityreport.model;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.activity.model.ActivityVO;


@Repository
public class ActivityReportDAO implements ActivityReportDAO_interface{
	
	@PersistenceContext
	private Session session;

	@Override
	public void insert(ActivityReportVO activityReportVO) {
			

				session.persist(activityReportVO);
				//getSession().persist(activityReportVO);

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
			
			
				final String sql = "DELETE ActivityReportVO where actId = :actId ";
				session.createQuery(sql).setParameter("actId", actId).executeUpdate();
			
			
	}
	
	


}
