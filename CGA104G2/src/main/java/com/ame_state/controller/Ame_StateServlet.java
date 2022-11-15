package com.ame_state.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ame_state.model.Ame_StateService;
import com.ame_state.model.Ame_StateVO;
import com.record.model.RecordService;

@WebServlet("/ame_sta.do")

public class Ame_StateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		Ame_StateService ame_ssvc = new Ame_StateService();

		if ("doRecord".equals(action)) {

			Integer ameid = Integer.valueOf(req.getParameter("ameid"));

			req.setAttribute("ameid", ameid);
			String url = "/front-end/ame/doRecord.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("doRecord2".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String ame_StaDate = req.getParameter("ame_StaDate");
			Integer ameid = Integer.valueOf(req.getParameter("ameid"));
			Map<String, String> map = ame_ssvc.showAme_Statime(ameid);
			String sta = map.get(ame_StaDate);
			String[] staArr = sta.split("");

			int count = 0;
			for (int i = 0; i < staArr.length; i++) {
				if (staArr[i].equals("1")) {
					count++;
				}
				if (count == 24) {

					errorMsgs.add("當日已無時段可預約");
					
					req.setAttribute("ame_StaDate", ame_StaDate);
					req.setAttribute("ameid", ameid);
					String url = "/front-end/ame/doRecord.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
				}
			}

			ArrayList<String> statime = new ArrayList<String>(Arrays.asList(staArr));
			req.setAttribute("statime", statime);
			req.setAttribute("ameid", ameid);
			req.setAttribute("ame_StaDate", ame_StaDate);

			String url = "/front-end/ame/doRecord2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("doRecord3".equals(action)) {
			String ostatime = req.getParameter("statime");
			String ame_StaDate = req.getParameter("ame_StaDate");
			Integer ameid = Integer.valueOf(req.getParameter("ameid"));
			Integer statime_ind = Integer.valueOf(req.getParameter("statime_ind"));

			String[] nstatime = ostatime.replaceFirst("\\[", "").replaceFirst("\\]", "").split(", ");
			nstatime[statime_ind] = "1";
			String recordStatime = Arrays.stream(nstatime).collect(Collectors.joining());

			java.sql.Date date = java.sql.Date.valueOf(ame_StaDate);
			
//			Time recordStatime = 
			
			Ame_StateVO ame_StateVO = ame_ssvc.selectByIdDate(ameid, date);
			Integer ameStateId = ame_StateVO.getAmeStateId();
			if (ame_ssvc.update(recordStatime, ameStateId)) {
//				RecordService rs = new RecordService();
//				int memberId = 1;
//				rs.addRecord(memberId, ameid, ame_StaDate, null, ameStateId)
				
			} else {
				System.out.println("失敗喔");
			}

			String url = "/front-end/ame/showAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
	}
}
