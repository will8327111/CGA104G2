package com.activityreply.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.activityreply.model.ActivityReplyService;


@WebServlet("/activity/ActivityReplyServlet")
public class ActivityReplyServlet extends HttpServlet {

			


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session =  req.getSession();
		PrintWriter out=res.getWriter();
		
		if("insert".equals(action)) {
			Integer memid = (Integer)session.getAttribute("id");
			Integer actId= Integer.valueOf(req.getParameter("actId"));	
			String content = req.getParameter("reply");
			ActivityReplyService service = new ActivityReplyService();
			service.insert(memid, actId, content);
		}
		
		
		if("search".equals(action)) {
			Integer actId= Integer.valueOf(req.getParameter("actId"));	
			ActivityReplyService service = new ActivityReplyService();
			out.write(service.search(actId).toString());
			
		}
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
