package com.activitytype.model;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;


public class ActivityTypeDAO implements ActivityTypeDAO_interface{


	@Override
	public void insert(ActivityTypeVO ActivityTypeVO) {
				getSession().persist(ActivityTypeVO);
				
	}

	@Override
	public void delete(Integer acttypeid) {
		
		
	}

	@Override
	public List<ActivityTypeVO> getAll() {
		beginTranscation();
		final String hql = "FROM ActivityTypeVO order BY actTypeId";
		List<ActivityTypeVO>  list = getSession().createQuery(hql,ActivityTypeVO.class).list();
		commit();
		return list;
	}

	
	//有用	
	@Override
	public JSONArray getType() {
		beginTranscation();	
		final String hql = "FROM ActivityTypeVO order BY actTypeId";
		JSONArray array = new JSONArray();
		List<ActivityTypeVO> list = getSession().createQuery(hql,ActivityTypeVO.class).list();
		for(ActivityTypeVO vo : list) {
			JSONObject object = new JSONObject();
			object.put("actTypeId",vo.getActTypeId());
			object.put("actTypeName",vo.getActTypeName());
			array.put(object);
		}	
		commit();		
		return array;	
	}
	
	

}
