package com.activityreport.model;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;
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
	public JSONArray getAll() {
		final String sql = "FROM ActivityReportVO where reportStatus=0";
		List<ActivityReportVO> list = session.createQuery(sql,ActivityReportVO.class).list();
		JSONArray array = new JSONArray();
		for(ActivityReportVO vo : list ) {
			JSONObject json = new JSONObject();
			System.out.println(vo.getReportContent());
			json.put("reportContent", vo.getReportContent());
			json.put("reportStatus", vo.getReportStatus());
			json.put("name", vo.getActivityVO().getActName());
			array.put(json);
		}		
		return array;
	}

	@Override
	public void deleteAct(Integer actId) {
			
			
				final String sql = "DELETE ActivityReportVO where actId = :actId ";
				session.createQuery(sql).setParameter("actId", actId).executeUpdate();
			
			
	}
	
	


}
