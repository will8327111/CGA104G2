package com.activityreply.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.json.JSONArray;

import com.activity.common.ActivityServiceCommon;
import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;

public class ActivityReplyService  implements ActivityServiceCommon{
	
	private ActivityReplyDAO_interface dao;
	
	public ActivityReplyService() {
		dao = new ActivityReplyDAO();
		
	}
	
	
	public void insert(Integer memid,Integer actId,String content) {
                   
		
		ActivityReplyVO activityReplyVO = new ActivityReplyVO();
		activityReplyVO.setActId(actId);
		activityReplyVO.setMemberId(memid);
		activityReplyVO.setReplyContent(content);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(timestamp);
		activityReplyVO.setReplyDate(Date.valueOf(time));
		dao.insert(activityReplyVO);
	}

	
	public JSONArray search(Integer actId) {
		return dao.search(actId);
	}
	
	public void deleteAct(Integer actId) {
		dao.delete(actId);
	}
	
}
