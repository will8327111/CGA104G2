package com.ame_state.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ame_state.model.Ame_StateService;
import com.ame_state.model.Ame_StateVO;

@WebServlet("/ame/ame_sta.do")

public class Ame_StateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		Ame_StateService ame_ssvc = new Ame_StateService();

		if ("doRecord".equals(action)) {

			List<Ame_StateVO> list = new ArrayList<Ame_StateVO>();
			Integer ameid = Integer.valueOf(req.getParameter("ameid"));
			list = ame_ssvc.showAme_Statime(ameid);
//			for(int i =0; i<list.size();i++) {
//				Ame_StateVO a = null;
//				a = list.get(i);
//				System.out.println(a.getAmeId());
//				System.out.println(a.getRecordStatime());
//				System.out.println(a.getAmeStateId());
//			}
			
			req.setAttribute("list", list);
			String url = "/ame/doRecord.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}
}
