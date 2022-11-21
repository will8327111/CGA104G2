package com.activityreply.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import com.activity.model.ActivityVO;
import com.activitysignup.model.ActivitySignupVO;


@Repository
public class ActivityReplyDAO implements ActivityReplyDAO_interface {
	
	
	
	
	@PersistenceContext
	private Session session;
	

	@Override
	public void insert(ActivityReplyVO activityReplyvo) {
		
		try {
		beginTranscation();
		getSession().persist(activityReplyvo);
		commit();
		}catch (Exception e) {
			e.printStackTrace(System.err);
			rollback();
		}
		
	}

	@Override
	public void delete(Integer actReplyId) {
		
		
	}

	@Override
	public JSONArray search(Integer actId) {
		beginTranscation();	
		final String hql = "FROM ActivityReplyVO WHERE actId = :id"; 
		List<ActivityReplyVO> list = getSession().createQuery(hql,ActivityReplyVO.class).setParameter("id",actId).list();
		JSONArray array = new JSONArray();
		for (ActivityReplyVO vo : list) {
			JSONObject object = new JSONObject();
			object.put("content",vo.getReplyContent());
			
		final String sql ="SELECT MEMBER_NAME FROM ACTIVITY_REPLY ar join MEMBER mb on ar.MEMBER_ID = mb.MEMBER_ID where mb.MEMBER_ID = :memId and ACTIVITY_REPLY_ID = :replyId";
		String name = (String) getSession().createNativeQuery(sql).setParameter("memId", vo.getMemberId()).setParameter("replyId", vo.getActReplyId()).uniqueResult();
			
			object.put("memId", name);
			array.put(object);
		}
		commit();
		return array;
	}

	@Override
	public void deleteAct(Integer actId) {
		beginTranscation();
		try {
			final String sql = "DELETE ActivityReplyVO where actId = :actId ";
			getSession().createQuery(sql).setParameter("actId", actId).executeUpdate();
		commit();
	} catch (Exception e) {
		rollback();
	}
		
	}

	


}
