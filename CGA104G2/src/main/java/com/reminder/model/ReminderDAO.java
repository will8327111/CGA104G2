package com.reminder.model;

import java.util.List;

import javax.persistence.Query;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.mail.model.MailVO;

public class ReminderDAO implements Reminder_interface{

	@Override
	public JSONArray getAll(Integer memberId) {
		beginTransaction();
		JSONArray array = new JSONArray(); 
		final String hql = "SELECT DISTINCT reminderInfo FROM ReminderVO WHERE memberId =" + memberId +" "+"and"+" "+"reminderStatus"+" "+"="+" "+ 0;
		List<String> list = getSession().createQuery(hql).list();
		
		for(String reminderInfo : list) {
			JSONObject obj = new JSONObject();
			obj.put("reminderInfo", reminderInfo);
			array.put(obj);
		}
		
		commit();
		return array;
	}
	@Override
	public void insert(ReminderVO remVO) {
		beginTransaction();
		getSession().save(remVO);
		commit();
	}

	@Override
	public void update(Integer remStatus,Integer memberId) {
		beginTransaction();
		try {
			String hql = "UPDATE ReminderVO set reminderStatus = :reminderStatus where memberId = :memberId";
			Query query  = getSession().createQuery(hql); 
			query.setParameter("reminderStatus", remStatus);
			query.setParameter("memberId", memberId);
			query.executeUpdate();
			
//			ReminderVO reminderVO = new ReminderVO();
//			reminderVO.setReminderStatus(remStatus);
//			reminderVO.setMemberId(memberId);
//			
//			getSession().update(reminderVO);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
	}

}
