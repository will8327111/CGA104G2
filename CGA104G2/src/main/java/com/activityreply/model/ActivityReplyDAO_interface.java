package com.activityreply.model;

import java.util.List;

import org.json.JSONArray;

import com.activity.common.ActivityCommon;

public interface ActivityReplyDAO_interface extends ActivityCommon{
	
	public void insert (ActivityReplyVO activityReplyvo);
	public void delete(Integer actReplyId); 
	public JSONArray search(Integer actId);
	public void deleteAct(Integer actId);

}
