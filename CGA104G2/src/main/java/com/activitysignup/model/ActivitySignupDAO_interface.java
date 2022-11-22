package com.activitysignup.model;

import java.util.List;

import com.activity.common.ActivityCommon;

public interface ActivitySignupDAO_interface extends ActivityCommon {
	
	public Integer insert (ActivitySignupVO activity_signupVO);
	public Integer delete(Integer actid,Integer memid ); 
	public ActivitySignupVO getData(Integer actId, Integer memId);
	public Integer getSignupnumber(Integer actId, Integer memId);
	public void deleteAct(Integer actId);
	public List<Integer> getInfo(Integer memId);

}
