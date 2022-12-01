package com.maintenanceRecord.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.maintenanceRecord.model.MaintenanceRecordService;
import com.maintenanceRecord.model.MaintenanceRecordVO;
import com.privateReport1.model.PrivateReportService1;
import com.privateReport1.model.PrivateReportVO1;

@WebServlet("/back-end/maintenanceRecord/maintenanceRecordServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MaintenanceRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();

		if ("getOne_For_Update".equals(action)) {

			/*************************** 1.接收請求參數 ****************************************/
			Integer maintenanceId = Integer.parseInt(req.getParameter("maintenanceId"));
			Integer memberId = Integer.parseInt(req.getParameter("memberId"));
			/*************************** 2.開始查詢資料 ****************************************/
			MaintenanceRecordService maintenanceSvc = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc.findByMtId(maintenanceId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			session.setAttribute("maintenanceRecordVO", maintenanceRecordVO);
			session.setAttribute("memberId", memberId);

			String url = "/back-end/maintenanceRecord/updateOneMt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer maintenanceId = Integer.parseInt(req.getParameter("maintenanceId"));
			String replyOfMaintenance = req.getParameter("replyOfMaintenance").trim();
			String replyOfMaintenanceReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,300}$";
			Integer maintenanceStatus = Integer.parseInt(req.getParameter("maintenanceStatus"));

			if (replyOfMaintenance == null || replyOfMaintenance.trim().length() == 0) {
				errorMsgs.add("回覆內容請勿空白!");
			} else if (!replyOfMaintenance.trim().matches(replyOfMaintenanceReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("回覆內容長度必需在1到300之間");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/maintenanceRecord/updateOneMt.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.傳送圖片 *****************************************/
			List<byte[]> replyPic = new ArrayList<byte[]>();

			for (Part part : req.getParts()) {
				String filename = part.getSubmittedFileName();
				if (filename != null && filename.length() != 0) {
					try (InputStream is = part.getInputStream();
							BufferedInputStream bis = new BufferedInputStream(is)) {
						byte[] photo1 = new byte[bis.available()];
						bis.read(photo1);
						replyPic.add(photo1);

					} catch (IOException e) {
						e.printStackTrace(System.err);
					}

				}
			}

			/*************************** 3.開始修改資料 *****************************************/
			MaintenanceRecordService maintenanceSvc = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc.update(replyOfMaintenance, replyPic, maintenanceStatus,
					maintenanceId);

			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("maintenanceRecordVO", maintenanceRecordVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/back-end/maintenanceRecord/maintenanceRecordInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOneMtById".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			Integer maintenanceId = null;

			try {
				maintenanceId = Integer.parseInt(req.getParameter("maintenanceId"));
			} catch (Exception e) {
				errorMsgs.add("請輸入維修編號!");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/maintenanceRecord/maintenanceRecordInfo.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			MaintenanceRecordService maintenanceSvc = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc.findByMtId(maintenanceId);

			if (maintenanceRecordVO == null) {
				errorMsgs.add("查無此編號!");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/maintenanceRecord/maintenanceRecordInfo.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			session.setAttribute("maintenanceRecordVO", maintenanceRecordVO);
			String url = "/back-end/maintenanceRecord/showOneMtById.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

		}

		if ("getOneMtByName".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String memberNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
			String memberName = req.getParameter("memberName").trim();
			System.out.println(memberName);
			if (memberName == null || memberName.trim().length() == 0) {
				errorMsgs.add("住戶姓名請勿空白!");
			} else if (!memberName.trim().matches(memberNameReg)) {

				errorMsgs.add("住戶姓名不符合中文格式!");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/maintenanceRecord/maintenanceRecordInfo.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			MaintenanceRecordService maintenanceSvc = new MaintenanceRecordService();
			List<MaintenanceRecordVO> listByName = maintenanceSvc.findByMemberName(memberName);
			if (listByName.isEmpty()) {
				errorMsgs.add("查無此住戶!");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/maintenanceRecord/maintenanceRecordInfo.jsp");
				failureView.forward(req, res);
				return;
			}
			MaintenanceRecordService maintenanceSvc2 = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc2.findMemberName(memberName);
			session.setAttribute("maintenanceRecordVO", maintenanceRecordVO);
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			session.setAttribute("listByName", listByName);
			String url = "/back-end/maintenanceRecord/showOneMtByName.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("getAllSelected".equals(action)) {
			String url = "/back-end/maintenanceRecord/getAllSelectedMt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

// ==========================================以上為給後台的, 以下為是控制前台的=============================================================

		if ("getOneMtById2".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			String memberAc = req.getParameter("memberAc").trim();
			Integer maintenanceId = null;

			try {
				maintenanceId = Integer.parseInt(req.getParameter("maintenanceId"));
			} catch (Exception e) {
				errorMsgs.add("請輸入維修編號!");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/maintenanceRecord/showMt.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			MaintenanceRecordService maintenanceSvc2 = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc2.findByMtIdAndAc(maintenanceId, memberAc);

			if (maintenanceRecordVO == null) {
				errorMsgs.add("查無此編號!");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/maintenanceRecord/showMt.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("maintenanceRecordVO", maintenanceRecordVO);
			String url = "/front-end/maintenanceRecord/showOneMtById.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

		}

		if ("getAllSelected2".equals(action)) {
			String url = "/front-end/maintenanceRecord/getAllSelectedMt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("toMaintain".equals(action)) {
			/*************************** 1.接收請求參數 ****************************************/
			String memberAc = req.getParameter("memberAc");
			/*************************** 2.開始查詢資料 ****************************************/
			MaintenanceRecordService maintenanceSvc = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc.findInfoByAc(memberAc);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			session.setAttribute("maintenanceRecordVO", maintenanceRecordVO);
			String url = "/front-end/maintenanceRecord/toMaintain.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("maintain".equals(action)) { // 來自update_emp_input.jsp的請求
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer memberId = Integer.parseInt(req.getParameter("memberId"));
			Integer maintenanceStatus = Integer.parseInt(req.getParameter("maintenanceStatus"));
			String maintenanceContent = req.getParameter("maintenanceContent").trim();

			/*************************** 2.傳送圖片 *****************************************/
			List<byte[]> maintenancePic = new ArrayList<byte[]>();
			for (Part part : req.getParts()) {
				String filename = part.getSubmittedFileName();
				if (filename != null && filename.length() != 0) {
					try (InputStream is = part.getInputStream();
							BufferedInputStream bis = new BufferedInputStream(is)) {
						byte[] photo1 = new byte[bis.available()];
						bis.read(photo1);
						maintenancePic.add(photo1);

					} catch (IOException e) {
						e.printStackTrace(System.err);
					}

				}
			}
			/*************************** 3.開始修改資料 *****************************************/
			MaintenanceRecordService maintenanceSvc = new MaintenanceRecordService();
			MaintenanceRecordVO maintenanceRecordVO = maintenanceSvc.frontEndInsert(memberId, maintenanceContent,
					maintenancePic, maintenanceStatus);
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("maintenanceRecordVO", maintenanceRecordVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/front-end/maintenanceRecord/showMt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
	}
}
