/**
 * 
 */
package com.activity.model;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.activity.common.ActivityCommon;

public interface ActivityDAO_interface extends ActivityCommon{

	public Integer insert (ActivityVO activityVO);
	public void update (ActivityVO activityVO);
	public void delete(Integer actId); 	
	public JSONArray search(String actCountry,Integer actType,String actName);
	public ActivityVO getOne(Integer actId);
	public JSONObject getOneJS(Integer actId);
	public JSONArray getById(Integer memberId);
	public JSONArray findCountry();
	public List<Integer> getAll();
	public List<ActivityVO> get();


	public JSONArray  getPage(Integer number);
	public void updateNumber(Integer number,Integer actId);
	public void removeNumber(Integer number, Integer actId);

	public void updateStatus (Integer actId);
	public void expired (Integer actId);
}
