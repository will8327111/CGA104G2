package com.backstageCapabilities.controller;

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
import com.backstageCapabilities.model.BackstageCapabilitiesService;
import com.backstageCapabilities.model.BackstageCapabilitiesVO;

@WebServlet("/back-end/backstageCapabilities/BackstageCapabilities.do")
public class BackstageCapabilitiesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();

		if ("getOne_For_Display".equals(action)) {
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId"));
			BackstageCapabilitiesService backstageCapabilitiesSvc = new BackstageCapabilitiesService();
			BackstageCapabilitiesVO backstageCapabilitiesVO = backstageCapabilitiesSvc
					.findByPrimaryKey(bmCapabilitiesId);
//				req.setAttribute("BackstageCapabilitiesVO", backstageCapabilitiesVO);
			RequestDispatcher successView = req
					.getRequestDispatcher("/back-end/backstageCapabilities/listOneCapability.jsp");
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId"));
			/*************************** 2.開始查詢資料 ****************************************/
			BackstageCapabilitiesService backstageCapabilitiesSvc = new BackstageCapabilitiesService();
			BackstageCapabilitiesVO backstageCapabilitiesVO = backstageCapabilitiesSvc
					.findByPrimaryKey(bmCapabilitiesId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			session.setAttribute("backstageCapabilitiesVO", backstageCapabilitiesVO);
			String param = "?bmCapabilitiesId=" + backstageCapabilitiesVO.getBmCapabilitiesId() + "&bmCapabilitiesName="
					+ backstageCapabilitiesVO.getBmCapabilitiesName() + "&bmCapabilitiesContent="
					+ backstageCapabilitiesVO.getBmCapabilitiesContent();
			String url = "/back-end/backstageCapabilities/updateOneCapability.jsp" + param;
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId").trim());

			String bmCapabilitiesName = req.getParameter("bmCapabilitiesName");
			String bmNameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
			String bmCapabilitiesContentReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{5,300}$";
			if (bmCapabilitiesName == null || bmCapabilitiesName.trim().length() == 0) {
				errorMsgs.put("bmCapabilitiesName", "權限功能名稱: 請勿空白");
			} else if (!bmCapabilitiesName.trim().matches(bmNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.put("bmCapabilitiesName", "權限功能名稱: 只能是中文字母, 且長度必需在2到10之間");
			}

			String bmCapabilitiesContent = req.getParameter("bmCapabilitiesContent").trim();
			if (bmCapabilitiesContent == null || bmCapabilitiesContent.trim().length() == 0) {
				errorMsgs.put("bmCapabilitiesContent", "權限功能內容: 請勿空白");
			} else if (!bmCapabilitiesContent.trim().matches(bmCapabilitiesContentReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.put("bmCapabilitiesContent", "權限功能內容: 只能是中、英文字母、數字和_ , 且長度必需在5到300之間");
			}

			BackstageCapabilitiesService backstageCapabilitieistSvc2 = new BackstageCapabilitiesService();
			BackstageCapabilitiesVO backstageCapabilitiesVO2 = backstageCapabilitieistSvc2.findByCapName(bmCapabilitiesName);
			if (backstageCapabilitiesVO2 != null) {
				errorMsgs.put("bmCapabilitiesName", "權限功能名稱: 請勿與原名稱相同或是已有重複名稱!");
			}
			
			BackstageCapabilitiesVO backstageCapabilitiesVO = new BackstageCapabilitiesVO();
			backstageCapabilitiesVO.setBmCapabilitiesName(bmCapabilitiesName);
			backstageCapabilitiesVO.setBmCapabilitiesContent(bmCapabilitiesContent);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("BackstageCapabilitiesVO", backstageCapabilitiesVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageCapabilities/updateOneCapability.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			BackstageCapabilitiesService backstageCapabilitiesSvc = new BackstageCapabilitiesService();
			backstageCapabilitiesVO = backstageCapabilitiesSvc.update(bmCapabilitiesId, bmCapabilitiesName,
					bmCapabilitiesContent);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("backstageCapabilitiesVO", backstageCapabilitiesVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/back-end/backstageCapabilities/capabilityAfterUpdated.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自update_emp_input.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String bmCapabilitiesName = req.getParameter("bmCapabilitiesName");
			String bmNameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
			String bmCapabilitiesContentReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{5,300}$";
			if (bmCapabilitiesName == null || bmCapabilitiesName.trim().length() == 0) {
				errorMsgs.put("bmCapabilitiesName", "權限功能名稱: 請勿空白");
			} else if (!bmCapabilitiesName.trim().matches(bmNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.put("bmCapabilitiesName", "權限功能名稱: 只能是中文字母 , 且長度必需在2到10之間");
			}

			String bmCapabilitiesContent = req.getParameter("bmCapabilitiesContent").trim();
			if (bmCapabilitiesContent == null || bmCapabilitiesContent.trim().length() == 0) {
				errorMsgs.put("bmCapabilitiesContent", "權限功能內容: 請勿空白");
			} else if (!bmCapabilitiesContent.trim().matches(bmCapabilitiesContentReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.put("bmCapabilitiesContent", "權限功能名稱: 只能是中、英文字母、數字和_ , 且長度必需在5到300之間");
			}
			
			
			BackstageCapabilitiesService backstageCapabilitieistSvc2 = new BackstageCapabilitiesService();
			BackstageCapabilitiesVO backstageCapabilitiesVO2 = backstageCapabilitieistSvc2.findByCapName(bmCapabilitiesName);
			if (backstageCapabilitiesVO2 != null) {
				errorMsgs.put("bmCapabilitiesName", "權限功能名稱: 請勿與原名稱相同或是已有重複名稱!");
			}

			BackstageCapabilitiesVO backstageCapabilitiesVO = new BackstageCapabilitiesVO();
			backstageCapabilitiesVO.setBmCapabilitiesName(bmCapabilitiesName);
			backstageCapabilitiesVO.setBmCapabilitiesContent(bmCapabilitiesContent);

			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("backstageCapabilitiesVO", backstageCapabilitiesVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/backstageCapabilities/addCapabilities.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
		
			/*************************** 2.開始新增資料 *****************************************/
			BackstageCapabilitiesService backstageCapabilitiesSvc = new BackstageCapabilitiesService();
			backstageCapabilitiesVO = backstageCapabilitiesSvc.insert(bmCapabilitiesName, bmCapabilitiesContent);

			/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("backstageCapabilitiesVO", backstageCapabilitiesVO); // 資料庫insert成功後,正確的的empVO物件,存入req
			String url = "/back-end/backstageCapabilities/listAllCapabilities.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer bmCapabilitiesId = Integer.parseInt(req.getParameter("bmCapabilitiesId"));

			/*************************** 2.開始刪除資料 ***************************************/
			BackstageCapabilitiesService backstageCapabilitiesSvc = new BackstageCapabilitiesService();
			backstageCapabilitiesSvc.delete(bmCapabilitiesId);
			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/backstageCapabilities/listAllCapabilities.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("getAll".equals(action)) { // 來自listAllEmp.jsp
			String url = "/back-end/backstageCapabilities/listAllCapabilities.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

	}

}
