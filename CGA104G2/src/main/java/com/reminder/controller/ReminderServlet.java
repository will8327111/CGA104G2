package com.reminder.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.mail.model.MailService;
import com.mail.model.MailVO;
import com.reminder.model.ReminderService;
import com.reminder.model.ReminderVO;

@WebServlet("/reminder/ReminderServlet")
public class ReminderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		
		
		if ("getAll".equals(action)) {
			Integer memberId = Integer.valueOf(req.getParameter("memberId"));
			System.out.println(memberId);
			ReminderService remService = new ReminderService();
		    out.write(remService.getAll(memberId).toString());
		}
		
		if ("insert".equals(action)) {
			BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"utf-8"));
			String json= "";
			if(br !=null) {
				json = br.readLine();
			}
			
			JSONObject obj =new JSONObject(json); 
			JSONObject insertReminder = obj.getJSONObject("value");
			
			
			Integer memberId = Integer.valueOf((String) insertReminder.get("memberId"));
			Integer reminderStatus = Integer.valueOf((String) insertReminder.get("reminderStatus"));
			String reminderInfo = String.valueOf((String) insertReminder.get("reminderInfo"));
			
			ReminderVO remVO = new ReminderVO();
			remVO.setMemberId(memberId);
			remVO.setReminderStatus(reminderStatus);
			remVO.setReminderInfo(reminderInfo);
			
			ReminderService remSvc = new ReminderService();
			remSvc.addReminder(remVO);

		}
	}

}
