package com.activityphoto.model;

import java.util.List;

import javax.servlet.http.Part;

import org.json.JSONArray;

import com.activity.common.ActivityServiceCommon;
import com.activity.model.ActivityVO;

public class ActivityPhotoService implements ActivityServiceCommon{

	private ActivityPhotoDAO_interface dao;
	
	
	public ActivityPhotoService() {
		dao = new ActivityPhotoDAO();		
	}
	
	public void add(ActivityPhotoVO vo) {
		dao.insert(vo);
	}
	
	
	public void delete(Integer actId) {
		dao.deleteAct(actId);	
	}
	
	
	public byte[] getAll(Integer ID){
		List<ActivityPhotoVO> list = dao.getPhoto(ID);
		return list == null ? null : list.get(1).getActPhoto();
	}
	
	
	//有用
	public JSONArray actPhotos(Integer id){
		return	dao.actPhotos(id);	
	}
	
	
	public void deletePhotoId(Integer photoId) {
			dao.deleteById(photoId);
	}
	
	
	public void update(ActivityPhotoVO VO) {
		dao.update(VO);
	}
}
