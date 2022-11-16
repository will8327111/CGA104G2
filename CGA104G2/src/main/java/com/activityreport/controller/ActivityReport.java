package com.activityreport.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.activityreport.model.ActivityReportService;
import com.activityreport.model.ActivityReportVO;
import com.activity.common.SpringUtil;
import com.google.gson.Gson;


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
		
		if("report".equals(action)) {
			Integer actId =  Integer.valueOf(req.getParameter("actId"));
			req.setAttribute("actId", actId);
			RequestDispatcher failureView = req
					.getRequestDispatcher("/front-end/activity/reportactivity.jsp");
			failureView.forward(req, res);		
			
		}
		
		
	if("addReport".equals(action)) {
		Gson gson = new Gson();
		ActivityReportVO activityReportVO = gson.fromJson(req.getReader(), ActivityReportVO.class);
		ActivityReportService service = SpringUtil.getBean(getServletContext(), ActivityReportService.class);
		service.insert(activityReportVO);
	
	
	}
		
		
		
	
		
//		if("addReport".equals(action)) {
//			Integer memid = (Integer)session.getAttribute("ID");
//			Integer actId = Integer.valueOf(req.getParameter("actId").trim());
//			String reportContent = req.getParameter("report");
//			
//			ActivityReportVO activityReportVO = new ActivityReportVO();
//			
//			activityReportVO.setActId(actId);
//			activityReportVO.setMemberId(memid);
//			activityReportVO.setReportContent(reportContent);
//			
//			ActivityReportService service = new ActivityReportService();
//			service.insert(activityReportVO);
//			String  url =req.getContextPath()+ "/front-end/activity/homepage.html";
//			res.sendRedirect(url);
//		}
		
			
	}

}
