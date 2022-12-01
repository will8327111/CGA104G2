package com.privateReport1.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sound.midi.Soundbank;

import com.privateReport1.model.*;

@WebServlet("/back-end/privateReport1/privateReportServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class PrivateReportServlet1 extends HttpServlet {
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
			Integer privateReportId = Integer.parseInt(req.getParameter("privateReportId"));
			Integer memberId = Integer.parseInt(req.getParameter("memberId"));
			/*************************** 2.開始查詢資料 ****************************************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.findByReportId(privateReportId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			session.setAttribute("privateReportVO1", privateReportVO1);
			session.setAttribute("memberId", memberId);

			String url = "/back-end/privateReport/updateOneReport.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer privateReportId = Integer.parseInt(req.getParameter("privateReportId"));
			String replyOfReport = req.getParameter("replyOfReport").trim();
			String replyOfReportReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,300}$";
			Integer privateReportStatus = Integer.parseInt(req.getParameter("privateReportStatus"));

			if (replyOfReport == null || replyOfReport.trim().length() == 0) {
				errorMsgs.add("回覆內容請勿空白!");
			} else if (!replyOfReport.trim().matches(replyOfReportReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("回覆內容長度必需在1到300之間");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/privateReport/updateOneReport.jsp");
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
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.update(replyOfReport, replyPic, privateReportStatus,
					privateReportId);

			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("privateReportVO1", privateReportVO1); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/back-end/privateReport/privateReportInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOneReportById".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			Integer privateReportId = null;

			try {
				privateReportId = Integer.parseInt(req.getParameter("privateReportId"));
			} catch (Exception e) {
				errorMsgs.add("請輸入檢舉編號!");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/privateReport/privateReportInfo.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.findByReportId(privateReportId);

			if (privateReportVO1 == null) {
				errorMsgs.add("查無此編號!");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/privateReport/privateReportInfo.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			session.setAttribute("privateReportVO1", privateReportVO1);
			String url = "/back-end/privateReport/showOneReportById.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

		}

		if ("getOneReportByName".equals(action)) {
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
						.getRequestDispatcher("/back-end/privateReport/privateReportInfo.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			List<PrivateReportVO1> listByName = privateReportSvc1.findByMemberName(memberName);
			if (listByName.isEmpty()) {
				errorMsgs.add("查無此住戶!");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/privateReport/privateReportInfo.jsp");
				failureView.forward(req, res);
				return;
			}
			PrivateReportService1 privateReportSvc2 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc2.findMemberName(memberName);
			session.setAttribute("privateReportVO1", privateReportVO1);
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			session.setAttribute("listByName", listByName);
			String url = "/back-end/privateReport/showOneReportByName.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("getAllSelected".equals(action)) {
			String url = "/back-end/privateReport/getAllSelectedReport.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

// ==========================================以上為給後台的, 以下為是控制前台的=============================================================

		if ("getOneReportById2".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			String memberAc = req.getParameter("memberAc").trim();
			Integer privateReportId = null;

			try {
				privateReportId = Integer.parseInt(req.getParameter("privateReportId"));
			} catch (Exception e) {
				errorMsgs.add("請輸入檢舉編號!");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/privateReport/showReport.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.findByReportIdAndAc(privateReportId, memberAc);

			if (privateReportVO1 == null) {
				errorMsgs.add("查無此編號!");
			}

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("errorMsgs", errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/privateReport/showReport.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("privateReportVO1", privateReportVO1);
			String url = "/front-end/privateReport/showOneReportById.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

		}

		if ("getAllSelected2".equals(action)) {
			String url = "/front-end/privateReport/getAllSelectedReport.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("toReport".equals(action)) {
			/*************************** 1.接收請求參數 ****************************************/
			String memberAc = req.getParameter("memberAc");
			/*************************** 2.開始查詢資料 ****************************************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.findInfoByAc(memberAc);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			session.setAttribute("privateReportVO1", privateReportVO1);
			String url = "/front-end/privateReport/toReport.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}

		if ("report".equals(action)) { // 來自update_emp_input.jsp的請求
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer memberId = Integer.parseInt(req.getParameter("memberId"));
			Integer privateReportStatus = Integer.parseInt(req.getParameter("privateReportStatus"));
			String privateReportContent = req.getParameter("privateReportContent").trim();
			
			/*************************** 2.傳送圖片 *****************************************/
			List<byte[]> privateReportPic = new ArrayList<byte[]>();
			for (Part part : req.getParts()) {
				String filename = part.getSubmittedFileName();
				if (filename != null && filename.length() != 0) {
					try (InputStream is = part.getInputStream();
							BufferedInputStream bis = new BufferedInputStream(is)) {
						byte[] photo1 = new byte[bis.available()];
						bis.read(photo1);
						privateReportPic.add(photo1);

					} catch (IOException e) {
						e.printStackTrace(System.err);
					}

				}
			}
			/*************************** 3.開始修改資料 *****************************************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.frontEndInsert(memberId, privateReportContent,
					privateReportPic, privateReportStatus);
			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("privateReportVO1", privateReportVO1); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/front-end/privateReport/showReport.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
	}
}
