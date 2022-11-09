package com.memberLogOut.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/front-end/MemberLogOut.do")
public class MemberLogOutServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");

			if ("textForLogOut".equals(action)) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberLogin.jsp");
				failureView.forward(req, res);
				return;// �{�����_
			}
			;

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
