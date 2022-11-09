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

		if ("getOne_for_Authorization".equals(action)) { // 來自listAllEmp.jsp
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));
			req.getSession().setAttribute("bmId", bmId);
			String url = "/back-end/backstageAuthorization/listOneAuthorization.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer bmId = Integer.parseInt(req.getParameter("bmId"));

			/*************************** 2.開始查詢資料 ****************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			BackstageAccountVO backstageAccountVO = backstageAccountSvc.findByPrimaryKey(bmId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			session.setAttribute("backstageAccountVO", backstageAccountVO);
			
//			String param = "?bmId=" + backstageAccountVO.getBmId()+
//					"&bmName=" + backstageAccountVO.getBmName()+
//					"&bmAccount=" + backstageAccountVO.getBmAccount()+
//					"&bmPassword=" + backstageAccountVO.getBmPassword()+
//					"&bmEmail=" + backstageAccountVO.getBmEmail()+
//					"&bmStatus=" + backstageAccountVO.getBmStatus();
					
			String url = "/back-end/backstageAccount/updateOneInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer bmId = Integer.valueOf(req.getParameter("bmId").trim());

			String bmName = req.getParameter("bmName");
			String bmNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (bmName == null || bmName.trim().length() == 0) {
				errorMsgs.add("管理員姓名: 請勿空白");
			} else if (!bmName.trim().matches(bmNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("管理員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			String bmAccount = req.getParameter("bmAccount").trim();
			if (bmAccount == null || bmAccount.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}

			String bmPassword = req.getParameter("bmPassword").trim();
			if (bmPassword == null || bmPassword.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}

			String bmEmail = req.getParameter("bmEmail").trim();
			if (bmEmail == null || bmEmail.trim().length() == 0) {
				errorMsgs.add("電子郵件請勿空白");
			}

			Integer bmStatus = Integer.parseInt(req.getParameter("bmStatus").trim());

			BackstageAccountVO backstageAccountVO = new BackstageAccountVO();
			backstageAccountVO.setBmId(bmId);
			backstageAccountVO.setBmName(bmName);
			backstageAccountVO.setBmAccount(bmAccount);
			backstageAccountVO.setBmPassword(bmPassword);
			backstageAccountVO.setBmEmail(bmEmail);
			backstageAccountVO.setBmStatus(bmStatus);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("BackstageAccountVO", backstageAccountVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageAccount/updateOneInfo.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			backstageAccountVO = backstageAccountSvc.update(bmId, bmName, bmAccount, bmPassword, bmEmail, bmStatus);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("backstageAccountVO", backstageAccountVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/back-end/backstageAccount/listAllInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String bmName = req.getParameter("bmName");
			String bmNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (bmName == null || bmName.trim().length() == 0) {
				errorMsgs.add("管理員姓名: 請勿空白");
			} else if (!bmName.trim().matches(bmNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("管理員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			String bmAccount = req.getParameter("bmAccount").trim();
			if (bmAccount == null || bmAccount.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}

			String bmPassword = req.getParameter("bmPassword").trim();
			if (bmPassword == null || bmPassword.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}

			String bmEmail = req.getParameter("bmEmail").trim();
			if (bmEmail == null || bmEmail.trim().length() == 0) {
				errorMsgs.add("電子郵件請勿空白");
			}

			Integer bmStatus = null;
			try {
				bmStatus = Integer.valueOf(req.getParameter("bmStatus").trim());
			} catch (NumberFormatException e) {
				bmStatus = 0;
				errorMsgs.add("狀態不得為空");
			}

			BackstageAccountVO backstageAccountVO = new BackstageAccountVO();
//			backstageAccountVO.setBmId(bmId);
			backstageAccountVO.setBmName(bmName);
			backstageAccountVO.setBmAccount(bmAccount);
			backstageAccountVO.setBmPassword(bmPassword);
			backstageAccountVO.setBmEmail(bmEmail);
			backstageAccountVO.setBmStatus(bmStatus);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("backstageAccountVO", backstageAccountVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/backstageAccount/addInfo.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始新增資料 *****************************************/
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			backstageAccountVO = backstageAccountSvc.insert(bmName, bmAccount, bmPassword, bmEmail, bmStatus);

			/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("backstageAccountVO", backstageAccountVO); // 資料庫insert成功後,正確的的empVO物件,存入req
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
			BackstageAccountService backstageAccountSvc = new BackstageAccountService();
			PrintWriter out = res.getWriter();
			out.write(backstageAccountSvc.getAll().toString());

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/backstageAccount/listAllInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

	}

}
