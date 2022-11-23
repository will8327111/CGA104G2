package com.privateReport.controller;
//package com.privateReport.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.mail.model.MailVO;
//import com.privateReport.model.PrivateReportService;
//import com.privateReport.model.PrivateReportVO;
//
//
//@WebServlet("/back-end/privateReport/privateReportServlet")
//public class privateReportServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
//	}
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		res.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//		PrintWriter out = res.getWriter();
//		
//		if ("getOneReport".equals(action)) { 
//			Integer privateReportId = Integer.valueOf(req.getParameter("privateReportId"));
//			PrivateReportService privateReportSvc = new PrivateReportService();
//			out.write(privateReportSvc.findByPrimaryKey(privateReportId).toString());
//		}
//		
//		if ("getAllReport".equals(action)) { 
//			PrivateReportService privateReportSvc = new PrivateReportService();
//			out.write(privateReportSvc.getAllReport().toString());
//		}
//		
//		
//		
//	}
//
//}
