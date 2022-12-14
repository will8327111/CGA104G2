package com.activitysignup.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.activity.common.HibernateUtil;
import com.activity.model.ActivityVO;

public class ActivitySignupDAO implements ActivitySignupDAO_interface{

	


	//有用
	@Override
	public Integer insert(ActivitySignupVO activitySignupVO) {
			beginTranscation();
			try {
				getSession().persist(activitySignupVO);
				getSession().getTransaction().commit();
				return 1;
				
			} catch (Exception e) {
				rollback();
				return -1;
			}
			
	}

	@Override
	public Integer delete(Integer actid, Integer memid) {
		try {
			beginTranscation();
			String sql = "DELETE from ACTIVITY_SIGNUP where MEMBER_ID = :memid";
			getSession().createNativeQuery(sql).setParameter("memid", memid).executeUpdate();
			commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
			return -1;
		}
		
	}

	@Override
	public ActivitySignupVO getData(Integer actId, Integer memId) {
		beginTranscation();
		final String hql = "FROM ActivitySignupVO WHERE actId in (:id) and memberId in (:memberId)";
		ActivitySignupVO activitySignupVO =  getSession().createQuery(hql,ActivitySignupVO.class).setParameter("id", actId).setParameter("memberId", memId).uniqueResult();
		commit();
		return activitySignupVO;
		
	}

	@Override
	public Integer getSignupnumber(Integer actId, Integer memId) {
		beginTranscation();	
		final String hql = "SELECT signupNumber FROM ActivitySignupVO WHERE actId in (:id) and memberId in (:memberId)"; 
		Integer number =(Integer) getSession().createQuery(hql).setParameter("id", actId).setParameter("memberId", memId).uniqueResult();
		commit();
		return number;
	}

	@Override
	public void deleteAct(Integer actId) {
		try {
			beginTranscation();
			ActivitySignupVO vo = new ActivitySignupVO();
			vo.setActId(actId);
			getSession().remove(vo);
		commit();
	} catch (Exception e) {
		rollback();
	}
	
		
	}

	@Override
	public List<Integer> getInfo(Integer memId) {
		beginTranscation();
		final String hql = "SELECT actId FROM ActivitySignupVO WHERE  memberId= :id";
		List<Integer> list =  getSession().createQuery(hql).setParameter("id", memId).list();
		commit();
		return list;
	}
		
}
