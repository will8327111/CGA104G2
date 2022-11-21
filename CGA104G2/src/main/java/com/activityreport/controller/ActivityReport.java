package com.activityreport.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.json.JSONObject;
import org.springframework.transaction.annotation.Transactional;

import com.activityreport.model.ActivityReportService;
import com.activityreport.model.ActivityReportVO;
import com.activity.common.SpringUtil;
import com.activity.model.ActivityService;
import com.activityreply.model.ActivityReplyService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/activity/ActReport")
public class ActivityReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res ) throws ServletException, IOException {
				doPost(req,res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session =   req.getSession();
		PrintWriter out = res.getWriter();
		
		if("report".equals(action)) {
			Integer actId =  Integer.valueOf(req.getParameter("actId"));
			req.setAttribute("actId", actId);
			RequestDispatcher failureView = req
					.getRequestDispatcher("/front-end/activity/reportactivity.jsp");
			failureView.forward(req, res);		
			
		}else if("addReport".equals(action)) {
		Gson gson = new Gson();
		ActivityReportVO activityReportVO = gson.fromJson(req.getReader(), ActivityReportVO.class);
		ActivityReportService service = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
		service.insert(activityReportVO);
	
	}else if("getAll".equals(action)){
		ActivityReportService service = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
		out.write(service.getAll().toString());	
	}else if("updateContent".equals(action)) {
		Gson gson = new Gson();
		ActivityReportVO activityReportVO = gson.fromJson(req.getReader(), ActivityReportVO.class);
		ActivityReportService service = SpringUtil.getBean(getServletContext(), ActivityReportService.class);

		service.updateNote(activityReportVO);	
	}else if("updateStatus".equals(action)) {
		Gson gson = new Gson();
		JsonObject json = gson.fromJson(req.getReader(), JsonObject.class);
		 ActivityReportVO vo = gson.fromJson(json.get("report"), ActivityReportVO.class);  
		ActivityReportService service = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
		service.updateStatus(vo);
		ActivityService service2 = new ActivityService();
		System.out.println(vo.getActId());
		service2.updateStatus(vo.getActId());
	}else if("getHistory".equals(action)) {
		ActivityReportService service = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
		out.write(service.getHistory().toString());	
		
		
	}
		
		
			
	}

}
