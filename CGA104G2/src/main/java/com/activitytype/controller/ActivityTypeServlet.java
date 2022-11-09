package com.activitytype.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.activitytype.model.ActivityTypeService;


@WebServlet("/activity/ActivityTypeServlet")
public class ActivityTypeServlet extends HttpServlet {
       


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		String action = req.getParameter("action");
		
		if("getType".equals(action)) {
			ActivityTypeService service = new ActivityTypeService();
			 out.write(service.getType().toString());
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
