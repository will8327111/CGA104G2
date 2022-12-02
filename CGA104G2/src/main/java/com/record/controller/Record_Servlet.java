package com.record.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.record.model.RecordService;
import com.record.model.RecordVO;

@WebServlet("/front-end/ame/record.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class Record_Servlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("serchRecord".equals(action)) {
			Integer memberid = Integer.valueOf(req.getParameter("memberid").trim());
			
			RecordService recSvc = new RecordService();
			List<RecordVO> list = recSvc.findByPrimaryKey(memberid);
			req.setAttribute("list", list);
			String url = "/front-end/ame/selectRecord.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
		
		if ("changeRecord".equals(action)) {
			Integer memberid = Integer.valueOf(req.getParameter("memberid").trim());
			Integer ameid = Integer.valueOf(req.getParameter("ameid").trim());
			String date = req.getParameter("recordDate");
			String recordStatime = req.getParameter("recordStatime");
			
			java.sql.Date recordDate = java.sql.Date.valueOf(date);
			
			RecordService recSvc = new RecordService();
			recSvc.updaterecordsta(memberid, ameid, recordDate, recordStatime);
			
			String url = "/front-end/ame/selectRecord.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}
}
