package com.activitysignup.model;

import java.sql.Date;
import java.util.List;

import com.activity.common.ActivityServiceCommon;

public class ActivitySignupService implements ActivityServiceCommon {
	
	private ActivitySignupDAO_interface dao;
	
	public  ActivitySignupService() {
		dao = new ActivitySignupDAO();
		
	}
	
	public Integer delete(Integer actid, Integer memid) {
		return dao.delete(actid, memid);
	}
	
	
	public Integer insert(Integer number,Integer actId,Integer memid, String time ) {
		ActivitySignupVO activitySignupVO = new ActivitySignupVO();
		activitySignupVO.setActId(actId);
		activitySignupVO.setMemberId(memid);
		activitySignupVO.setSignupNumber(number);
		activitySignupVO.setSignupTime(Date.valueOf(time));	
		return dao.insert(activitySignupVO);
		
	}
	
	public ActivitySignupVO getData(Integer actId, Integer memId) {
		return  dao.getData(actId, memId);
		
	}
	
	public void deleteAct(Integer actId) {
		dao.deleteAct(actId);
	}
	
	public List<Integer> search(Integer memId){
		return dao.getInfo(memId);
	}
	
}
