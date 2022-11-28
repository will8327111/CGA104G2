package com.mail.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

import org.hibernate.boot.xsd.ConfigXsdSupport;
import org.hibernate.type.LocaleType;
import org.json.JSONObject;

import com.activity.model.ActivityService;
import com.google.gson.Gson;
import com.google.gson.annotations.JsonAdapter;
import com.mail.model.MailService;
import com.mail.model.MailVO;
import com.memberLogin.model.MemberLoginVO;
import com.reminder.model.ReminderVO;
import com.store.model.StoreService;

@WebServlet("/back-end/mail/mail.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		
		if ("getAll".equals(action)) { 
			MailService mailSvc = new MailService();
		    out.write(mailSvc.getAll().toString());	

		}
		if ("getFrontAll".equals(action)) { 
			MailService mailSvc = new MailService();
			MemberLoginVO  memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");
			Integer memberId = memberLoginVO.getMemberId();
			out.write(mailSvc.getFrontAll(memberId).toString());	
			
		}
		
		
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

		}
		
		
		/******************************************************************/
		
		// ====================================================
		if ("insert".equals(action)) {
			BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"utf-8"));
			String json= "";
			if(br !=null) {
				json = br.readLine();
			}
			
			JSONObject obj =new JSONObject(json); 
			JSONObject inertMail = obj.getJSONObject("value");
			
			Integer memberId = Integer.valueOf((String) inertMail.get("memberId"));
			String mailType = String.valueOf((String) inertMail.get("mailType"));
			Date mailDelTime = Date.valueOf((String) inertMail.get("mailDelTime"));
			String reminderInfo = String.valueOf((String) inertMail.get("reminderInfo"));
			
			ReminderVO remVO = new ReminderVO();
			remVO.setMemberId(memberId);
			remVO.setReminderInfo(reminderInfo);
			
			MailVO mailVO = new MailVO();
			mailVO.setMemberId(memberId);
			mailVO.setMailType(mailType);
			mailVO.setMailDelTime(mailDelTime);
			
			MailService mailSvc = new MailService();
			mailSvc.addMail(mailVO);


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
			
			BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"utf-8"));
			String json= "";
			if(br !=null) {
				json = br.readLine();
			}
			
			JSONObject obj =new JSONObject(json); 
			JSONObject updateMail = obj.getJSONObject("value");
			Integer mailId = Integer.valueOf((String) updateMail.get("mailId"));
			Integer memberId = Integer.valueOf((String) updateMail.get("memberId"));
			String mailType = String.valueOf((String) updateMail.get("mailType"));
			Date mailDelTime = Date.valueOf((String) updateMail.get("mailDelTime"));
			Date mailPickupTime = Date.valueOf((String) updateMail.get("mailPickupTime"));
			Integer mailState = Integer.valueOf((String) updateMail.get("mailState"));
			
			MailVO mailVO = new MailVO();
			mailVO.setMailId(mailId);
			mailVO.setMemberId(memberId);
			mailVO.setMailType(mailType);
			mailVO.setMailDelTime(mailDelTime);
			mailVO.setMailPickupTime(mailPickupTime);
			mailVO.setMailState(mailState);
			
			MailService mailSvc = new MailService();
			mailSvc.updateMail(mailVO);
		}
		
		if ("delete".equals(action)) {
			Integer mailId = Integer.valueOf(req.getParameter("mailId"));
			MailService mailSvc = new MailService();
			mailSvc.deleteMail(mailId);
		}
		
		if("select_mailType".equals(action)) {
			MailService mailSvc = new MailService();
			out.write(mailSvc.findMailType().toString());
		}
		
		if("search".equals(action)) {
			String mailType = req.getParameter("mailType");
			Integer mailId = Integer.valueOf(req.getParameter("mailId").trim());
			MailService mailSvc = new MailService();
			out.write(mailSvc.search(mailType,mailId).toString());
		}
		if("frontSearch".equals(action)) {
			MemberLoginVO  memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");
			Integer memberId = memberLoginVO.getMemberId();
			String mailType = req.getParameter("mailType");
			Integer mailId = Integer.valueOf(req.getParameter("mailId").trim());
			MailService mailSvc = new MailService();
			out.write(mailSvc.frontSearch(mailType,mailId,memberId).toString());
		}
	}

}
