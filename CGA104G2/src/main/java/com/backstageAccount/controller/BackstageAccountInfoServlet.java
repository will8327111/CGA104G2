package com.backstageAccount.controller;

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
import javax.sound.midi.Soundbank;

import com.backstageAccount.model.BackstageAccountService;
import com.backstageAccount.model.BackstageAccountVO;

@WebServlet("/back-end/backstageAccount/BackstageAccountInfo.do")
public class BackstageAccountInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();

		if ("getOne_for_Authorization".equals(action)) {
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));
			session.setAttribute("bmId", bmId);
			String url = "/back-end/backstageAuthorization/listOneAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));

			/*************************** 2.開始查詢資料 ****************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			BackstageAccountVO backstageAccountVO = backstageAccountSvc.findByPrimaryKey(bmId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("backstageAccountVO", backstageAccountVO);

			String param = "?bmId=" + backstageAccountVO.getBmId() + "&bmName=" + backstageAccountVO.getBmName()
					+ "&bmAccount=" + backstageAccountVO.getBmAccount() + "&bmPassword="
					+ backstageAccountVO.getBmPassword() + "&bmEmail=" + backstageAccountVO.getBmEmail() + "&bmStatus="
					+ backstageAccountVO.getBmStatus();
			String url = "/back-end/backstageAccount/updateOneInfo.jsp" + param;
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("update".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			Map<String, String> errorMsgs3 = new LinkedHashMap<String, String>();
			List<String> errorMsgs2 = new LinkedList<String>();

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer bmId = Integer.valueOf(req.getParameter("bmId").trim());

			String bmName = req.getParameter("bmName");
			String bmNameReg = "^[(\u4e00-\u9fa5)]{2,5}$";
			String bmAcAndPwReg = "^[(a-zA-Z0-9_)]{6,12}$";
			String bmEmailReg = "^[a-zA-Z0-9_!#$%&'\\*+/=?{|}~^.-]+@[a-zA-Z0-9.-]+$";
			if (bmName == null || bmName.trim().length() == 0) {
				errorMsgs.put("bmName", "管理員姓名: 請勿空白");
			} else if (!bmName.trim().matches(bmNameReg)) {
				errorMsgs.put("bmName", "管理員姓名: 只能是中文字母, 且長度必需在2到5之間");
			}

			String bmPassword = req.getParameter("bmPassword").trim();
			if (bmPassword == null || bmPassword.trim().length() == 0) {
				errorMsgs.put("bmPassword", "密碼: 請勿空白");
			} else if (!bmPassword.trim().matches(bmAcAndPwReg)) {
				errorMsgs.put("bmPassword", "管理員密碼: 只能是英文字母或數字, 且長度必需在6到12之間");
			}

			String bmEmail = req.getParameter("bmEmail").trim();
			if (bmEmail == null || bmEmail.trim().length() == 0) {
				errorMsgs.put("bmEmail", "電子郵件: 請勿空白");
			} else if (!bmEmail.trim().matches(bmEmailReg)) {
				errorMsgs.put("bmEmail", "電子郵件: 請符合電子郵件格式!");
			}

			Integer bmStatus = Integer.parseInt(req.getParameter("bmStatus").trim());

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
//				req.setAttribute("backstageAccountVO", backstageAccountVO); 
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageAccount/updateOneInfo.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			BackstageAccountService backstageAccountSvc2 = new BackstageAccountService();
			BackstageAccountVO backstageAccountVO2 = backstageAccountSvc2.updateNeeds(bmName, bmPassword,
					bmEmail, bmStatus, bmId);

			if (backstageAccountVO2 != null) {
				errorMsgs2.add("看起來似乎沒修改東西呢!");
			}
			;

			if (!errorMsgs2.isEmpty()) {
				req.setAttribute("errorMsgs2", errorMsgs2);
//					req.setAttribute("backstageAccountVO", backstageAccountVO); 
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageAccount/updateOneInfo.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			
			BackstageAccountVO backstageAccountVO3 = backstageAccountSvc2.findByEmail(bmEmail);
			
			if (backstageAccountVO3 != null) {
				errorMsgs3.put("bmEmail", "電子郵件: 已有他人使用此電子郵件!");
			}
			
			if (!errorMsgs3.isEmpty()) {
				req.setAttribute("errorMsgs3", errorMsgs3);
//				req.setAttribute("backstageAccountVO", backstageAccountVO); 
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageAccount/updateOneInfo.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			

			BackstageAccountVO backstageAccountVO = new BackstageAccountVO();
			backstageAccountVO.setBmId(bmId);
			backstageAccountVO.setBmName(bmName);
			backstageAccountVO.setBmPassword(bmPassword);
			backstageAccountVO.setBmEmail(bmEmail);
			backstageAccountVO.setBmStatus(bmStatus);
			/*************************** 2.開始修改資料 *****************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			backstageAccountVO = backstageAccountSvc.update(bmId, bmName, bmPassword, bmEmail, bmStatus);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("backstageAccountVO", backstageAccountVO);
			String url = "/back-end/backstageAccount/infoAfterUpdated.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("insert".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String bmName = req.getParameter("bmName");
			String bmNameReg = "^[(\u4e00-\u9fa5)]{2,5}$";
			String bmAcAndPwReg = "^[(a-zA-Z0-9_)]{6,12}$";
			String bmEmailReg = "^[a-zA-Z0-9_!#$%&'\\*+/=?{|}~^.-]+@[a-zA-Z0-9.-]+$";
			if (bmName == null || bmName.trim().length() == 0) {
				errorMsgs.put("bmName", "管理員姓名: 請勿空白");
			} else if (!bmName.trim().matches(bmNameReg)) {
				errorMsgs.put("bmName", "管理員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			String bmAccount = req.getParameter("bmAccount").trim();
			if (bmAccount == null || bmAccount.trim().length() == 0) {
				errorMsgs.put("bmAccount", "帳號: 請勿空白");
			} else if (!bmAccount.trim().matches(bmAcAndPwReg)) {
				errorMsgs.put("bmAccount", "管理員帳號: 只能是英文字母或數字, 且長度必需在6到12之間");
			}

			String bmPassword = req.getParameter("bmPassword").trim();
			if (bmPassword == null || bmPassword.trim().length() == 0) {
				errorMsgs.put("bmPassword", "密碼: 請勿空白");
			} else if (!bmPassword.trim().matches(bmAcAndPwReg)) {
				errorMsgs.put("bmPassword", "管理員密碼: 只能是英文字母或數字, 且長度必需在6到12之間");
			}

			String bmEmail = req.getParameter("bmEmail").trim();
			if (bmEmail == null || bmEmail.trim().length() == 0) {
				errorMsgs.put("bmEmail", "電子郵件: 請勿空白");
			} else if (!bmEmail.trim().matches(bmEmailReg)) {
				errorMsgs.put("bmEmail", "電子郵件: 請符合電子郵件格式!");
			}

			Integer bmStatus = Integer.parseInt(req.getParameter("bmStatus").trim());
			/**********************************************************************************/
			BackstageAccountService backstageAccountSvc2 = new BackstageAccountService();
			BackstageAccountService backstageAccountSvc3 = new BackstageAccountService();
			BackstageAccountVO backstageAccountVO2 = backstageAccountSvc2.findByAccount(bmAccount);
			BackstageAccountVO backstageAccountVO3 = backstageAccountSvc3.findByEmail(bmEmail);

			if (backstageAccountVO2 != null) {
				errorMsgs.put("bmAccount", "帳號: 此帳號已被他人使用!請重新輸入!");
			}

			if (backstageAccountVO3 != null) {
				errorMsgs.put("bmEmail", "電子郵件: 已信箱已被他人使用!請重新輸入!");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageAccount/addInfo.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			BackstageAccountVO backstageAccountVO = new BackstageAccountVO();
			backstageAccountVO.setBmName(bmName);
			backstageAccountVO.setBmAccount(bmAccount);
			backstageAccountVO.setBmPassword(bmPassword);
			backstageAccountVO.setBmEmail(bmEmail);
			backstageAccountVO.setBmStatus(bmStatus);

			/*************************** 2.開始新增資料 *****************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			backstageAccountVO = backstageAccountSvc.insert(bmName, bmAccount, bmPassword, bmEmail, bmStatus);

			/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
			String url = "/back-end/backstageAccount/listAllInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));

			/*************************** 2.開始刪除資料 ***************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			backstageAccountSvc.delete(bmId);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/backstageAccount/listAllInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("getAll".equals(action)) { // 來自listAllEmp.jsp

			String url = "/back-end/backstageAccount/listAllInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

	}

}
