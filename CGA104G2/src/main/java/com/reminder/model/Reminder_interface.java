package com.reminder.model;

import org.json.JSONArray;

import com.google.gson.JsonArray;
import com.mail.common.MailCommon;

public interface Reminder_interface extends MailCommon{
	 public void insert(ReminderVO remVO);
	 public JSONArray getAll(Integer memberId);
	 public void update(Integer remStatus,Integer memberId);
}
