package com.mail.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mail.model.MailService;
import com.mail.model.MailVO;

@WebServlet("/back-end/mail/mail.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/******************************************************************/
			String str = req.getParameter("memberId");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入住戶編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mail/select_page.jsp");
				failureView.forward(req, res);
				return;
			}

			Integer memberId = null;
			try {
				memberId = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("住戶編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mail/select_page.jsp");
				failureView.forward(req, res);
				return;
			}

			/******************************************************************/
//			MailService mailSvc = new MailService();
//			MailVO mailVO = mailSvc.getOneMail(memberId);
//			if (mailVO == null) {
//				errorMsgs.add("請輸入住戶編號");
//			}
			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mail/select_page.jsp");
//				failureView.forward(req, res);
//				return;
//			}
			
			
			
			/******************************************************************/			
//			req.setAttribute("mailVO", mailVO); 
//			String url = "/back-end/mail/addMail.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); 
//			successView.forward(req, res);
		}
		
		
		/******************************************************************/
		if ("get_Member_Name".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String memberName = req.getParameter("memberName");
			if (memberName == null || (memberName.trim()).length() == 0) {
				errorMsgs.add("請輸入住戶姓名");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mail/addMail.jsp");
				failureView.forward(req, res);
				return; 
			}

			MailService mailSvc = new MailService();
			MailVO mailVO = mailSvc.getOneId(memberName);
			if (mailVO == null) {
				errorMsgs.add("查無此住戶請重新輸入");
			}
			/******************************************************************/			
			req.setAttribute("mailVO", mailVO); 
			String url = "/back-end/mail/addMail.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		
		// ====================================================
		if ("insert".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String enameReg = "^[0-9]*$";
			Integer memberId = null;
			
			String strMemberId = req.getParameter("memberId");
			System.out.println(strMemberId);
			
			if (strMemberId == null || strMemberId.trim().length() == 0) {
				errorMsgs.put("memberId","請輸入住戶編號");
			}else if(!strMemberId.trim().matches(enameReg)) {
				errorMsgs.put("memberId","住戶編號: 只能是數字");
	        }else {
	        	memberId = Integer.valueOf(strMemberId);
	        }
			
			String mailType = req.getParameter("mailType");
			
			java.sql.Date mailDelTime = null;
			try {
				mailDelTime = java.sql.Date.valueOf(req.getParameter("mailDelTime").trim());
			} catch (IllegalArgumentException e) {
				mailDelTime = new java.sql.Date(System.currentTimeMillis());
				errorMsgs.put("mailDelTime","請輸入到貨日期");
			}

			
			MailVO mailVO = new MailVO();

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("mailVO", mailVO); 
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mail/addMail.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始查詢資料 ***************************************/
			MailService mailSvc = new MailService();
			mailVO = mailSvc.addMail(memberId,mailType,mailDelTime);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/mail/listAllMail.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);

		}
		// ====================================================================================
		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/******************************************************************/
			Integer mailId = Integer.valueOf(req.getParameter("mailId"));
			/******************************************************************/
			MailService mailSvc = new MailService();
			List<MailVO> list = mailSvc.getOneMail(mailId);

			/******************************************************************/
			req.setAttribute("list", list); 
			String url = "/back-end/mail/update_mail_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		// ====================================================================================
		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/******************************************************************/
			Integer mailId = Integer.valueOf(req.getParameter("mailId").trim());

			Integer memberId = null;
			try {
				memberId = Integer.valueOf(req.getParameter("memberId").trim());
			} catch (NumberFormatException e) {
				memberId = 0;
				errorMsgs.add("請輸入住戶編號");
			}
			String mailType = req.getParameter("mailType");
			String mailTypeReg = "^[(\u4e00-\u9fa5)]{2,10}$";

			if (mailType == null || mailType.trim().length() == 0) {
				errorMsgs.add("請輸入郵件項目");
			} else if (!mailType.trim().matches(mailTypeReg)) {
				errorMsgs.add("郵件項目格是不正確");
			}
			
			Date mailDelTime = Date.valueOf(req.getParameter("mailDelTime").trim());
			Date mailPickupTime = Date.valueOf(req.getParameter("mailPickupTime"));
			Integer mailState = Integer.valueOf(req.getParameter("mailState").trim());
			

			MailVO mailVO = new MailVO();
			mailVO.setMemberId(memberId);
			mailVO.setMailType(mailType);
			mailVO.setMailDelTime(mailDelTime);
			mailVO.setMailPickupTime(mailPickupTime);
			mailVO.setMailState(mailState);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("mailVO", mailVO); 
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/mail/update_mail_input.jsp");
				failureView.forward(req, res);
				return; 
			}

			/******************************************************************/
			MailService mailSvc = new MailService();
			mailVO = mailSvc.updateEmp(mailId,memberId, mailType,mailDelTime,mailPickupTime,mailState);

			/******************************************************************/
			req.setAttribute("mailVO", mailVO); 
			String url = "/back-end/mail/listAllMail.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}

		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/***************************  ***************************************/
			Integer mailId = Integer.valueOf(req.getParameter("mailId"));

			/******************************************************************/
			MailService mailSvc = new MailService();
			mailSvc.deleteMail(mailId);

			/*************************************/
			String url = "/back-end/mail/listAllMail.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
//		if("get".equals(action)) {
//			Integer id = Integer.valueOf(req.getParameter("memberId"));
//			MailService mailSvc = new MailService();
//			res.getOutputStream().write(mailSvc.getPhoto(id));
//			
//		}
	}

}
