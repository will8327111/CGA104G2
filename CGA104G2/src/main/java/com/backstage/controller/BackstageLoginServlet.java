package com.backstage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backstageAccount.model.BackstageAccountService;
import com.backstageAccount.model.BackstageAccountVO;
import com.mysql.cj.Session;

@WebServlet("/back-end/backstageAccount/backstageLogin.do")
public class BackstageLoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			String bmAccount = req.getParameter("bmAccount");
			String bmPassword = req.getParameter("bmPassword");
			String bmEmail = req.getParameter("bmEmail");
			String confirmCode = req.getParameter("confirmCode");
			Timer timer;
			HttpSession session = req.getSession();
//			========================================錯誤訊息=====================================================
			if ("textForLogin".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				if (((bmPassword == null || (bmPassword.trim()).length() == 0))
						&& ((bmAccount == null) || (bmAccount.trim()).length() == 0)) {
					errorMsgs.add("請輸入帳號和密碼!");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmAccount == null || (bmAccount.trim()).length() == 0) && (bmPassword != null)) {
					errorMsgs.add("請輸入帳號");
				}
//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmPassword == null || (bmPassword.trim()).length() == 0) && (bmAccount != null)) {
					errorMsgs.add("請輸入密碼");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}

//			=============================================================================================
				BackstageAccountService backstageAccountSvc = new BackstageAccountService();
				BackstageAccountVO backstageAccountVO = backstageAccountSvc.findByAcAndPwd(bmAccount, bmPassword);
				if (backstageAccountVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}
//			=========================================資料驗證跳轉(Send the Success view) ================
				session.setAttribute("backstageAccountVO", backstageAccountVO);
				String url = "/back-end/backstageAccount/backstageIndex.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}

//			========================================忘記密碼寄送錯誤訊息====================================================
			if ("passwordForgotten".equals(action)) {
				List<String> sendMsgs = new LinkedList<String>();
				req.setAttribute("sendMsgs", sendMsgs);

				if (((bmAccount == null || (bmAccount.trim()).length() == 0))
						&& ((bmEmail == null) || (bmEmail.trim()).length() == 0)) {
					sendMsgs.add("請輸入帳號和電子郵件!");
				}
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmAccount == null || (bmAccount.trim()).length() == 0) && (bmEmail != null)) {
					sendMsgs.add("請輸入帳號");
				}
//				 Send the use back to the form, if there were errors
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmEmail == null || (bmEmail.trim()).length() == 0) && (bmAccount != null)) {
					sendMsgs.add("請輸入Email");
				}
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}
//			=============================================================================================
				BackstageAccountService backstageAccountSvc = new BackstageAccountService();
				BackstageAccountVO backstageAccountVO = backstageAccountSvc.findByAcAndEmail(bmAccount, bmEmail);
				if (backstageAccountVO == null) {
					sendMsgs.add("查無此帳號和電子郵件!");
				}
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}
//			=========================================資料驗證跳轉(Send the Success view) ================
				session.setAttribute("backstageAccountVO", backstageAccountVO);
				String url = "/back-end/backstageGetPassword/confirmationResend.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			
//			=======================================================================
			if ("sendConfirmation".equals(action)) {
				List<String> sendMsgs = new LinkedList<String>();
				req.setAttribute("sendMsgs", sendMsgs);

				if (confirmCode == null || (confirmCode.trim().length() == 0)){
					sendMsgs.add("請輸入驗證碼!");
				}
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageGetPassword/confirmationResend.jsp");
					failureView.forward(req, res);
					return;
				}

//			=============================================================================================
//				BackstageAccountService backstageAccountSvc = new BackstageAccountService();
//				BackstageAccountVO backstageAccountVO = backstageAccountSvc.findByAcAndEmail(bmAccount, bmEmail);
//				if (backstageAccountVO == null) {
//					sendMsgs.add("查無此帳號和電子郵件!");
//				}
//				if (!sendMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//			=========================================資料驗證跳轉(Send the Success view) ================
//				session.setAttribute("backstageAccountVO", backstageAccountVO);
				String url = "/back-end/backstageGetPassword/confirmationResend.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			
			
			
			
//			===============================================驗證碼排程器==============================================
//			if ("TimeTest".equals(action)) {
//				timer = new Timer();
//				TimerTask task = new TimerTask() {
//					public void run() {
//						int i = 0;
//						i++;
//						if (i == 120) {
//							timer.cancel();
//							String url = "/back-end/passwordForgotten.jsp";
//							RequestDispatcher successView = req.getRequestDispatcher(url);
//							try {
//								successView.forward(req, res);
//							} catch (Exception e) {
//								e.printStackTrace();
//							}
//						}
//					}
//				};
//				Calendar cal = new GregorianCalendar();
//				timer.scheduleAtFixedRate(task, cal.getTime(), 1000);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
