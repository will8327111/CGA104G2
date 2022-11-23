package com.privateReport1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.privateReport1.model.*;


@WebServlet("/back-end/privateReport1/privateReportServlet.do")
public class PrivateReportServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		

		if ("getOne_For_Update".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer privateReportId = Integer.parseInt(req.getParameter("privateReportId"));

			/*************************** 2.開始查詢資料 ****************************************/
			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
			PrivateReportVO1 privateReportVO1 = privateReportSvc1.findByReportId(privateReportId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("privateReportVO1", privateReportVO1);

			String param = "?privateReportId=" + privateReportVO1.getPrivateReportId() 
						+ "&privateReportContent=" + privateReportVO1.getPrivateReportContent()
						+ "&replyPic=" + privateReportVO1.getReplyPic();
			
			String url = "/back-end/privateReport/updateOneReport.jsp" + param;
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
//		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
//
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//			String replyOfReport = req.getParameter("replyOfReport").trim();
//			
//			String replyOfReportReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{5,300}$";
//			
//			if (replyOfReport == null || replyOfReport.trim().length() == 0) {
//				errorMsgs.put("replyOfReport", "回覆內容: 請勿空白");
//			} else if (!replyOfReport.trim().matches(replyOfReportReg)) { // 以下練習正則(規)表示式(regular-expression)
//				errorMsgs.put("replyOfReport", "回覆內容: 只能是中文字母, 且長度必需在5到300之間");
//			}

//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/back-end/privateReport/updateOneReport.jsp");
//				failureView.forward(req, res);
//				return; // 程式中斷
//			}
//
//			/*************************** 2.傳送圖片 *****************************************/
//			Byte[] replyPic = req.("replyPic");
//			
//			String saveDirectory = "C:\\Users\\Tibame_T14\\Desktop\\images_uploaded";
//			String realPath = getServletContext().getRealPath(saveDirectory);
//			System.out.println("realPath="+realPath); 
//			if (!fsaveDirectory.exists())
//				 fsaveDirectory.mkdirs();
//			
//			Collection<Part> parts = req.getParts(); // Servlet3.0新增了Part介面，讓我們方便的進行檔案上傳處理
//			out.write("<h2> Total parts : " + parts.size() + "</h2>");
//
//			for (Part part : parts) {
//				String filename = part.getSubmittedFileName();
//				if (filename!= null && filename.length()!=0 && part.getContentType()!=null) {
//					out.println("<PRE>");
//					out.println("name: " + part.getName());
//					out.println("filename: " + filename);
//					out.println("ContentType: " + part.getContentType());
//					out.println("size: " + part.getSize());
//					
//					File f = new File(fsaveDirectory, filename);
//					out.println("File: " + f);
//
//					// 利用File物件,寫入目地目錄,上傳成功
//					part.write(f.toString());
//
//					// 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
////					InputStream in = part.getInputStream();
////					byte[] buf = new byte[in.available()];   // byte[] buf = in.readAllBytes();  // Java 9 的新方法
////					in.read(buf);
////					in.close();
////					out.println("buffer length: " + buf.length);
//					
//					// 額外測試秀圖
//					out.println("<br><img src=\""+req.getContextPath()+saveDirectory+"/"+filename+"\">");
//
//					out.println();
//					out.println("</PRE>");
//				}
//			}
//			
//			/*************************** 3.開始修改資料 *****************************************/
//			PrivateReportService1 privateReportSvc1 = new PrivateReportService1();
//			PrivateReportVO1 privateReportVO1 = privateReportSvc1.update(replyOfReport, replypic);
//			privateReportVO1.setReplyOfReport(replyOfReport);
//			privateReportVO1.setReplyPic(replypic);
//
//			/*************************** 4.修改完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("privateReportVO1", privateReportVO1); // 資料庫update成功後,正確的的empVO物件,存入req
//			String url = "/back-end/privateReport/privateReportInfo.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//			successView.forward(req, res);
//		}
		
		
		if ("getAllReport".equals(action)) { 
			String url = "/back-end/privateRepor/privateReporInfo.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
			
		}
		
		
		
	}

}
