package com.backstage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

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


		if ("getAll".equals(action)) { // 來自listAllEmp.jsp
			BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
			PrintWriter out = res.getWriter();
			out.write(backstageAuthorizationSvc.getAll().toString());

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/backstageAuthorization/listAllAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			Integer bmId = null;
			try {
				bmId = Integer.valueOf(req.getParameter("bmId").trim());
			} catch (NumberFormatException e) {
				errorMsgs.add("管理員編號不得為空");
			}

			Integer bmCapabilitiesId = null;
			try {
				bmCapabilitiesId = Integer.valueOf(req.getParameter("bmCapabilitiesId").trim());
			} catch (NumberFormatException e) {
				errorMsgs.add("權限功能編號不得為空");
			}

			/*************************************************/
			BackstageAuthorizationVO backstageAuthorizationVO = new BackstageAuthorizationVO();
			backstageAuthorizationVO.setBmId(bmId);
			backstageAuthorizationVO.setBmCapabilitiesId(bmCapabilitiesId);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("backstageAuthorizationVO", backstageAuthorizationVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageAuthorization/addAuthorization.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始新增資料 *****************************************/
			BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
			backstageAuthorizationVO = backstageAuthorizationSvc.insert(bmId, bmCapabilitiesId);

			/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
			req.setAttribute("backstageAuthorizationVO", backstageAuthorizationVO); // 資料庫insert成功後,正確的的empVO物件,存入req
			String url = "/back-end/backstageAuthorization/listAllAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			/*************************** 1.接收請求參數 ***************************************/
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId"));

			/*************************** 2.開始刪除資料 ***************************************/
			BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
			backstageAuthorizationSvc.delete(bmId, bmCapabilitiesId);
			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/backstageAuthorization/listAllAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

	}
}
