package com.activity.model;

import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.activitysignup.model.ActivitySignupVO;


public class ActivityDAO implements ActivityDAO_interface {

	//有用
	@Override
	public Integer insert(ActivityVO activityVO) {
		getSession().persist(activityVO);
		Integer id= activityVO.getActId();
		return id;
	}

	
	
	@Override
	public void update(ActivityVO activityVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer actId) {
		beginTranscation();
		try {
			ActivityVO vo = new ActivityVO();
			vo.setActId(actId);
			getSession().remove(vo);
		commit();
	} catch (Exception e) {
		rollback();
	}
		
	}

	
	//有用
	@Override
	public JSONArray search(String actCountry,Integer actType,String actName) {
		beginTranscation();
		final StringBuilder sql = new StringBuilder().append("SELECT * FROM ACTIVITY where ");
		if(actName.trim().length()!=0 &&!(actName==null)) {
			sql.append(" "+"ACTIVITY_NAME"+" "+"like"+" "+'"'+"%"+actName+"%"+'"'+" "+"and");
		}
		if(actCountry.trim().length()!=0 &&!(actCountry==null)) {
			sql.append(" "+"ACTIVITY_COUNTY"+" "+"="+" "+'"'+actCountry+'"'+" "+"and");
		}
		if(!(actType==0)) {
			sql.append(" "+"ACTIVITY_TYPE_ID"+" "+"="+" "+actType+" "+"and");
		}
		sql.append(" "+"ACTIVITY_STATUS = 0");
		Encoder encoder = Base64.getEncoder();
		JSONArray array = new JSONArray();
		List<ActivityVO> list = getSession().createNativeQuery(sql.toString(),ActivityVO.class).list();
		for(ActivityVO vo : list) {
			JSONObject object =new JSONObject();
			object.put("activityId",vo.getActId());
			object.put("activityName",vo.getActName());
			object.put("activityStart",vo.getActStart());
			object.put("activityEnd",vo.getActEnd());
			object.put("activitySignst",vo.getSignStart());
			object.put("activitySignet",vo.getSignEnd());
			object.put("activityCurrent",vo.getActCurrentCount());
			object.put("activityMax",vo.getActMaxCount());
			object.put("actLocation",vo.getActCountry());
			if(vo.getPhotos().size()!=0) {
				String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
				object.put("photo",photo64);
			}
			array.put(object);
		}			
		commit();
		return array;
	}

	
	//有用
	@Override
	public ActivityVO getOne(Integer actId) {
		final String sql = "select * from ACTIVITY where ACTIVITY_ID = :actId ";
		ActivityVO vo =  getSession().createNativeQuery(sql,ActivityVO.class).setParameter("actId", actId).uniqueResult();
		return vo;
	
	}

	@Override
	public JSONObject getdata(Integer actId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JSONArray getById(Integer memberId) {
		beginTranscation();
		final String hql = "FROM ActivityVO WHERE  memberId= :id"; 
		Encoder encoder = Base64.getEncoder();
		JSONArray array = new JSONArray();
	List<ActivityVO>list = getSession().createQuery(hql,ActivityVO.class).setParameter("id",memberId).list();	
	for(ActivityVO vo : list) {
		JSONObject object =new JSONObject();
		object.put("activityId",vo.getActId());
		object.put("activityName",vo.getActName());
		object.put("activityStart",vo.getActStart());
		object.put("activityEnd",vo.getActEnd());
		object.put("content",vo.getActContent());
		if(vo.getPhotos().size()!=0) {
			String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
			object.put("photo",photo64);
		}
		array.put(object);
	}	
		commit();
		return array;
	}

	//有用
	@Override
	public JSONArray findCountry() {
		beginTranscation();
		final String hql = "SELECT actCountry FROM ActivityVO GROUP BY actCountry ";
		List<String> list =	getSession().createQuery(hql).list();		
		JSONArray array = new JSONArray();
		for(String country : list) {
			System.out.println(country);
			JSONObject object =new JSONObject();
			object.put("actCountry",country);
			array.put(object);
		}
			commit();
			return array;
	}
	//有用
	@Override
	public List<Integer>  getAll() {
		beginTranscation();
		final String hql = "SELECT actId FROM ActivityVO order BY actId";
		List<Integer> list =  getSession().createQuery(hql).list();
		commit();
		return list;
		
	}

	@Override
	public JSONArray getAllJson() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<JSONArray> getMemberJson(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	
	//有用
	@Override
	public JSONArray  getPage(Integer number) {
		beginTranscation();
		final StringBuilder sql = new StringBuilder().append("SELECT * FROM ACTIVITY ");
		String first = Integer.toString(number*3);     
		sql.append(" "+"LIMIT"+" "+ first+","+"3");
		List<ActivityVO> list = getSession().createNativeQuery(sql.toString(),ActivityVO.class).list();
		JSONArray array = new JSONArray();
		Encoder encoder = Base64.getEncoder();
		for(ActivityVO vo : list) {
			JSONObject object =new JSONObject();
			object.put("activityId",vo.getActId());
			object.put("activityName",vo.getActName());
			object.put("activityStart",vo.getActStart());
			object.put("activityEnd",vo.getActEnd());
			object.put("activitySignst",vo.getSignStart());
			object.put("activitySignet",vo.getSignEnd());
			object.put("activityCurrent",vo.getActCurrentCount());
			object.put("activityMax",vo.getActMaxCount());
			object.put("actLocation",vo.getActCountry());
			if(vo.getPhotos().size()!=0) {
				String photo64 = encoder.encodeToString(vo.getPhotos().get(0).getActPhoto());
				object.put("photo",photo64);
			}
			array.put(object);
		}
		commit();
		return array;
	}

	
	//有用
	@Override
	public void updateNumber(Integer actId,Integer number) {
	beginTranscation();
		try {
		final String hql = " update ActivityVO SET actCurrentCount = :number where actId = :id  ";
		getSession().createQuery(hql).setParameter("number", number).setParameter("id", actId).executeUpdate();
		commit();	
		}catch(Exception e) {
			rollback();			
		}		
	}



	@Override
	public void removeNumber(Integer currentNumber,Integer number, Integer actId) {
		beginTranscation();
		try {
			Integer updateNumber = currentNumber-number;
			final String hql = " update ActivityVO SET actCurrentCount = :number where actId = :id  ";
			getSession().createQuery(hql).setParameter("number", updateNumber).setParameter("id", actId).executeUpdate();
			commit();				
		} catch (Exception e) {
				rollback();
		}
	}
	
	
}
