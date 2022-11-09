package com.activityphoto.model;

import java.util.Base64;
import java.util.List;
import java.util.Base64.Encoder;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

import com.activity.model.ActivityVO;
import com.activityreply.model.ActivityReplyVO;

public class ActivityPhotoDAO implements ActivityPhotoDAO_interface{

	@Override
	public void insert(ActivityPhotoVO VO) {
		getSession().persist(VO);
		
	}

	@Override
	public void update(ActivityPhotoVO VO) {
		
		
	}

	@Override
	public void deleteAct(Integer actId) {
		beginTranscation();
		try {
			final String sql = "DELETE ActivityPhotoVO where actId = :actId ";
			getSession().createQuery(sql).setParameter("actId", actId).executeUpdate();
		commit();
	} catch (Exception e) {
		rollback();
	}
		
	}

	@Override
	public List<ActivityPhotoVO> getPhoto(Integer ID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPhotobyLocation(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JSONArray actPhotos(Integer id) {
		beginTranscation();
		final String hql = "SELECT actPhoto FROM ActivityPhotoVO WHERE actId in (:id)";
		Encoder encoder = Base64.getEncoder();
		List<byte[]> list =  getSession().createQuery(hql).setParameter("id", id).list();
		JSONArray array  = new JSONArray();
		for(byte[]  photo : list) {
			JSONObject object = new JSONObject();
			String photo64 = encoder.encodeToString(photo);
			object.put("photo",photo64);
			array.put(object);
		}
		commit();
		return array;
	}

	@Override
	public void deleteById(Integer photoId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Integer> findActPhotoId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}




			
		
		
	

}
