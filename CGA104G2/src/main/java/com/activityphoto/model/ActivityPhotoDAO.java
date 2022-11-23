package com.activityphoto.model;

import java.util.Base64;
import java.util.List;
import java.util.Base64.Encoder;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import com.activity.model.ActivityVO;
import com.activityreply.model.ActivityReplyVO;



@Repository
public class ActivityPhotoDAO implements ActivityPhotoDAO_interface{
	
	
	@PersistenceContext
	private Session session;
	

	@Override
	public void insert(ActivityPhotoVO VO) {
		beginTranscation();
		getSession().persist(VO);
		commit();
	}

	@Override
	public void update(ActivityPhotoVO VO) {
		
		
	}

	@Override
	public void deleteAct(Integer actId) {
		try {
			beginTranscation();
			final String hql = "DELETE ActivityPhotoVO where actId = :actId ";
			getSession().createQuery(hql).setParameter("actId", actId).executeUpdate();
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
		final String hql = " FROM ActivityPhotoVO WHERE actId in (:id)";
		Encoder encoder = Base64.getEncoder();
		List<ActivityPhotoVO> list =  getSession().createQuery(hql).setParameter("id", id).list();
		JSONArray array  = new JSONArray();
		for(ActivityPhotoVO  photo : list) {
			byte[] photoByte = photo.getActPhoto();
			JSONObject object = new JSONObject();
			String photo64 = encoder.encodeToString(photoByte);
			object.put("photo",photo64);
			object.put("actPhotoId",photo.getActPhotoId());
			array.put(object);
		}
		commit();
		return array;
	}

	@Override
	public void deleteById(Integer photoId) {
		
		try {
			beginTranscation();
			ActivityPhotoVO vo = new ActivityPhotoVO();
			vo.setActPhotoId(photoId);
			getSession().remove(vo);
			commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback();
		}
		
		
	}

	@Override
	public List<Integer> findActPhotoId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}




			
		
		
	

}
