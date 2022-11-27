package com.memberLogin.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberLogin.model.MemberLoginService;
import com.memberLogin.model.MemberLoginVO;

@WebServlet("/front-end/memberLogin/MemberLogin.do")
public class MemberLoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			String member_ac = req.getParameter("member_ac");
			String member_pw = req.getParameter("member_pw");
			HttpSession session = req.getSession();
//			========================================錯誤訊息=====================================================
			if ("textForLogin".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				if (member_ac == null || (member_ac.trim()).length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin/memberLogin.jsp");
					failureView.forward(req, res);
					return;
				}

				if (member_pw == null || (member_pw.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin/memberLogin.jsp");
					failureView.forward(req, res);
					return;
				}

//			=============================================================================================
				MemberLoginService memberLoginSvc = new MemberLoginService();
				MemberLoginVO memberLoginVO = memberLoginSvc.findByAcAndPwd(member_ac, member_pw);
				if (memberLoginVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin/memberLogin.jsp");
					failureView.forward(req, res);
					return;
				}
//			=========================================資料驗證跳轉(Send the Success view) ================
				session.setAttribute("memberLoginVO", memberLoginVO); 
				String url = "/front-end/web/front-index2.html";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
