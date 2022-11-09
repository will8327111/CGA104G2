package com.activitysignup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.activity.model.ActivityService;
import com.activitysignup.model.ActivitySignupService;

@WebServlet("/activity/ActivitySignup")
public class ActivitySignupServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();

		if ("insert".equals(action)) {
			Integer nunmber = Integer.valueOf(req.getParameter("number"));
			Integer actId = Integer.valueOf(req.getParameter("actId"));
			Integer memid = (Integer) session.getAttribute("id");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String time = format.format(timestamp);
			ActivitySignupService service = new ActivitySignupService();
			ActivityService service2 = new ActivityService();
			service2.updateNumber(actId, nunmber);
			Integer result = service.insert(nunmber, actId, memid, time);
			JSONObject jsonObject = new JSONObject();
			if(result>0) {				
				jsonObject.put("number", result);				
			}
			
			out.write(jsonObject.toString());

		}

		
		
		if("remove".equals(action)) {
			Integer memid = (Integer) session.getAttribute("id");
			Integer actId = Integer.valueOf(req.getParameter("actId"));
			Integer current = Integer.valueOf(req.getParameter("current"));
			ActivitySignupService service = new ActivitySignupService();
			ActivityService service2 = new ActivityService();
			Integer number =service.getData(actId, memid).getSignupNumber();
			service2.reomveNumver(current, number, actId);
			Integer result = service.delete(actId, memid);
			JSONObject jsonObject = new JSONObject();
			if(result>0) {				
				jsonObject.put("number", result);				
			}
			
			out.write(jsonObject.toString());

		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
