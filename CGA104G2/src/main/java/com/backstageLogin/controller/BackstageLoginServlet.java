package com.backstageLogin.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Timer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.backstageMailService.model.*;

import com.backstageAccount.model.BackstageAccountService;
import com.backstageAccount.model.BackstageAccountVO;

@WebServlet("/back-end/backstageAccount/backstageLogin.do")
public class BackstageLoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("我有執行");
		try {
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			String bmAccount = req.getParameter("bmAccount");
			String bmPassword = req.getParameter("bmPassword");
			String bmEmail = req.getParameter("bmEmail");
			Timer timer;
			HttpSession session = req.getSession();
			
//			========================================錯誤訊息=====================================================
			if ("textForLogin".equals(action)) {
				
				System.out.println("我有執行");
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				if (((bmPassword == null || (bmPassword.trim()).length() == 0))
						&& ((bmAccount == null) || (bmAccount.trim()).length() == 0)) {
					errorMsgs.add("請輸入帳號和密碼!");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmAccount == null || (bmAccount.trim()).length() == 0) && (bmPassword != null)) {
					errorMsgs.add("請輸入帳號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmPassword == null || (bmPassword.trim()).length() == 0) && (bmAccount != null)) {
					errorMsgs.add("請輸入密碼");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}

//			===========================================依帳號密碼驗證==================================================
				BackstageAccountService backstageAccountSvc = new BackstageAccountService();
				BackstageAccountVO backstageAccountVO = backstageAccountSvc.findByAcAndPwd(bmAccount, bmPassword);
				if (backstageAccountVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageAccount/backstageLogin.jsp");
					failureView.forward(req, res);
					return;
				}
				
//	 			=======================================登入後以session存取所有管理員的資訊=================================================
				session.setAttribute("backstageAccountVO", backstageAccountVO); // 設定VO物件
//				String id = session.getId();
				session.setAttribute("bmId", backstageAccountVO.getBmId());
//				System.out.println(id);
//				=========================================資料驗證跳轉(Send the Success view) ================
				String url1 = "/back-end/web/backEndHomeMgr.html";
				String url2 = "/back-end/web/backEndHomeEmp.html";
				
//	 			======================================過濾員工權限=================================================
				if(backstageAccountVO.getBmId() == 1){
					RequestDispatcher successView = req.getRequestDispatcher(url1);
					successView.forward(req, res);
				}else{
					RequestDispatcher successView = req.getRequestDispatcher(url2);
					successView.forward(req, res);
				}
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
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmAccount == null || (bmAccount.trim()).length() == 0) && (bmEmail != null)) {
					sendMsgs.add("請輸入帳號");
				}
//				 Send the use back to the form, if there were errors
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}

				if ((bmEmail == null || (bmEmail.trim()).length() == 0) && (bmAccount != null)) {
					sendMsgs.add("請輸入Email");
				}
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
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
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageGetPassword/passwordForgotten.jsp");
					failureView.forward(req, res);
					return;
				}
//				=========================================驗證碼產生==============================================
				GenAuthCode randomCode = new GenAuthCode();
				String code = randomCode.getRandomPassword();
//				=========================================寄含有驗證碼的信===================================================
				MailService mailService = new MailService();
				String to = bmEmail;
				String subject = "忘記密碼驗證信";
				String ch_name = "使用者，";
				String alert = "請在120秒內將驗證碼輸入!" + "\n" + "逾時驗證碼將會失效且頁面將會重新跳轉至忘記密碼頁面!";
				String messageText = "Hello! " + ch_name + " 您的密碼為: " + code + "\n" + alert;
				mailService.sendMail(to, subject, messageText);
				System.out.println(code);
				req.setAttribute("code", code);
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
				String confirmCode = req.getParameter("confirmCode");
				if ((confirmCode == null || (confirmCode.trim()).length() == 0)) {
					sendMsgs.add("請輸入驗證碼!");
				}
				
				String code = req.getParameter("code");
//				
				if (!(code.equals(confirmCode))) {
					sendMsgs.add("輸入的驗證碼錯誤!");	
				}else {
					System.out.println("驗證成功");
				}
				
				if (!sendMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/backstageGetPassword/confirmationResend.jsp");
					failureView.forward(req, res);
					return;
				}
//			=========================================資料驗證跳轉(Send the Success view) ================
				String url = "/back-end/backstageGetPassword/confirmedSuccess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}

//			=========================================登出 =================================================
			if ("BackstageLogOut".equals(action)) {
				session.invalidate();
				String url = "/back-end/backstageAccount/backstageLogin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
