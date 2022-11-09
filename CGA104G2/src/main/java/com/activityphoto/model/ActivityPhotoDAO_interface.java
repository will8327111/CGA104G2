package com.activityphoto.model;

import java.util.List;

import javax.servlet.http.Part;

import org.json.JSONArray;

import com.activity.common.ActivityCommon;
import com.activity.model.ActivityVO;

public interface ActivityPhotoDAO_interface extends ActivityCommon{
	
	public void insert (ActivityPhotoVO VO);
	public void update(ActivityPhotoVO VO);
	public void deleteAct(Integer ID);
	public List<ActivityPhotoVO> getPhoto(Integer ID);
	public String getPhotobyLocation(Integer id);
	
	public JSONArray actPhotos(Integer id);
	public void deleteById(Integer photoId);
	public List<Integer> findActPhotoId(Integer id);
	
}
