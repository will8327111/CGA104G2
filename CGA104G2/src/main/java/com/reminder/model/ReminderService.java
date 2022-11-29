package com.reminder.model;

import org.json.JSONArray;

public class ReminderService {
	private Reminder_interface dao;
	
	public ReminderService() {
		dao = new ReminderDAO();
	}
	
	public ReminderVO addReminder(ReminderVO remVO) {
		dao.insert(remVO);
		return remVO;
	}
	public void updateReminder(Integer remStatus,Integer memberId) {
		dao.update(remStatus,memberId);
	}
	public JSONArray getAll(Integer memberId) {
		return dao.getAll(memberId);
	}
}
