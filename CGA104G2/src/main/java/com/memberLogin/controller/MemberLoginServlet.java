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
			String memberAc = req.getParameter("memberAc");
			String memberPw = req.getParameter("memberPw");
			HttpSession session = req.getSession();
//			========================================錯誤訊息=====================================================
			if ("textForLogin".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				if (memberAc == null || (memberAc.trim()).length() == 0) {
					errorMsgs.add("請輸入完整帳號和密碼！");
				}
//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin/memberLoginFinal.jsp");
					failureView.forward(req, res);
					return;
				}

				if (memberPw == null || (memberPw.trim()).length() == 0) {
					errorMsgs.add("請輸入完整帳號和密碼！");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin/memberLoginFinal.jsp");
					failureView.forward(req, res);
					return;
				}

//			=============================================================================================
				MemberLoginService memberLoginSvc = new MemberLoginService();
				MemberLoginVO memberLoginVO = memberLoginSvc.findByAcAndPwd(memberAc, memberPw);
				if (memberLoginVO == null) {
					errorMsgs.add("查無資料，請重新輸入！");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin/memberLoginFinal.jsp");
					failureView.forward(req, res);
					return;
				}
//			=========================================資料驗證跳轉(Send the Success view) ================
<<<<<<< HEAD
				session.setAttribute("memberLoginVO", memberLoginVO);
				session.setAttribute("memberAc", memberAc);
=======
				session.setAttribute("memberLoginVO", memberLoginVO); 
				session.setAttribute("memberId", memberLoginVO.getMemberId()); 
>>>>>>> refs/heads/HaoYu
				String url = "/front-end/web/front-index2.html";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
//			=========================================登出 =================================================
			if ("memberLogOut".equals(action)) {
				session.invalidate();
				String url = "/front-end/memberLogin/memberLogin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
