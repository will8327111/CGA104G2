package com.backstageAuthorization.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backstageAccount.model.BackstageAccountService;
import com.backstageAccount.model.BackstageAccountVO;
import com.backstageAuthorization.model.BackstageAuthorizationService;
import com.backstageAuthorization.model.BackstageAuthorizationVO;
import com.backstageCapabilities.model.BackstageCapabilitiesService;
import com.backstageCapabilities.model.BackstageCapabilitiesVO;

@WebServlet("/back-end/backstageAuthorization/BackstageAuthorization.do")
public class BackstageAuthorizationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		
		if ("getAll".equals(action)) { 
			String url = "/back-end/backstageAuthorization/listAllAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("selectOneAuthorization".equals(action)) { 
			Integer bmId = Integer.parseInt(req.getParameter("selectedBmId"));
			req.setAttribute("bmId", bmId);
			String url = "/back-end/backstageAuthorization/selectOneAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.?????????????????? - ??????????????????????????? **********************/
			Integer bmId = Integer.parseInt(req.getParameter("bmId").trim());
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId").trim());
			/*************************************************/
			BackstageAuthorizationService backstageAuthorizationSvc2 = new BackstageAuthorizationService();
			BackstageAuthorizationVO backstageAuthorizationVO2 = backstageAuthorizationSvc2.findByBmIdAndCapId(bmId, bmCapabilitiesId);
			
			if(backstageAuthorizationVO2 != null) {
				errorMsgs.add("??????: ???????????????????????????!");
			};
			
			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("backstageAuthorizationVO", backstageAuthorizationVO); // ???????????????????????????empVO??????,?????????req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageAuthorization/addAuthorization.jsp");
				failureView.forward(req, res);
				return; // ????????????
			}
			
			BackstageAuthorizationVO backstageAuthorizationVO = new BackstageAuthorizationVO();
			backstageAuthorizationVO.setBmId(bmId);
			backstageAuthorizationVO.setBmCapabilitiesId(bmCapabilitiesId);
			/*************************** 2.?????????????????? *****************************************/
			BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
			backstageAuthorizationVO = backstageAuthorizationSvc.insert(bmId, bmCapabilitiesId);
			
			/*************************** 3.????????????,????????????(Send the Success view) *************/

			String url = "/back-end/backstageAuthorization/listAllAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????????,??????listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // ??????listAllEmp.jsp

			/*************************** 1.?????????????????? ***************************************/
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId"));

			/*************************** 2.?????????????????? ***************************************/
			BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
			backstageAuthorizationSvc.delete(bmId, bmCapabilitiesId);
			/*************************** 3.????????????,????????????(Send the Success view) ***********/
			String url = "/back-end/backstageAuthorization/listAllAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ???????????????,????????????????????????????????????
			successView.forward(req, res);
		}

	}
}
