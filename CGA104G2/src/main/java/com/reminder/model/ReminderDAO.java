package com.reminder.model;

import java.util.List;

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
	public void update(ReminderVO remVO) {
		
	}


}
