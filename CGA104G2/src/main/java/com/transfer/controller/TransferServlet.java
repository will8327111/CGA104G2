package com.transfer.controller;

import java.io.IOException;
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

import com.memberbill.model.MemberBillService;
import com.memberbill.model.MemberBillVO;
import com.transfer.model.TransferService;
import com.transfer.model.TransferVO;

@WebServlet("/transfer")
@MultipartConfig
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String action = req.getParameter("action");

		if ("insert".equals(action)) {
//			 (Integer) session.getAttribute("memberId");
			Integer memId =9;
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			
//			Integer memberBillId = Integer.valueOf(req.getParameter("billDate"));
			String billgroup = (String)req.getParameter("billGroup");
			String bankId = req.getParameter("bankId"); // 請求銀行資訊
			String bankNumber = req.getParameter("bankNumber").trim();// 請求後五碼
			String bankNumber1 = "^[0-9]{1,5}$";
			if (bankNumber == null || bankNumber.trim().length() == 0) {
				errorMsgs.add("後五碼請勿空白");
			} else if (!bankNumber.trim().matches(bankNumber1)) {
				errorMsgs.add("後五碼長度須為五個數字");
			}
			Integer bankNumber2 = Integer.valueOf(bankNumber);// 字串轉回int

			TransferVO transferVO = new TransferVO();
			transferVO.setBankId(bankId);
			transferVO.setBankNumber(bankNumber2);

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberbill/transfer.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 *****************************************/

			TransferService transferService = new TransferService();
			transferVO = transferService.insert(billgroup, bankId, bankNumber2, memId);

			/*************************** 3.開始新增照片 *****************************************/

			MemberBillService memberBillService = new MemberBillService();
			List<MemberBillVO> list = memberBillService.getUnpaid(memId);
			Part file = req.getPart("file"); // 檔案用part裝
			byte[] memberPhoto = file.getInputStream().readAllBytes(); // 把所有轉byte[]的檔案讀進來(取到)
			MemberBillVO vo = new MemberBillVO(); // 從VO取
			vo.setMemberPhoto(memberPhoto);
			vo.setBillGroup(billgroup); // 有帳單ID才能改變照片值
			memberBillService.uploadPhoto(vo);

			MemberBillVO vo1 = memberBillService.updateMemberPay(billgroup);//繳費狀態為待審核// 把方法傳進來

			/*************************** 4.新增完成,準備轉交(Send the Success view) *************/

			req.setAttribute("MemberBillVO", vo);
			req.setAttribute("transferVO", transferVO);// 參數傳遞// 資料庫update成功後,存入req(key.value)
			String url = "/front-end/memberbill/transfer_2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交getTransfer.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) { //改完"繳費狀態"會在同一頁顯示
			MemberBillService memberBillService = new MemberBillService();
			Integer memberBillId = Integer.parseInt(req.getParameter("memberBillId")); // 將取過來的String轉Integer(後端設定的數字才能判斷)
			String memberPay = req.getParameter("memberPay"); // getParameter從jsp取參數的方法// 將取過來的String轉Integer
			memberBillService.update(memberBillId, memberPay);
			res.sendRedirect("/back-end/memberbill/getTransfer.jsp"); // 除了forward另一種跳轉的方式sendRedirect
			
			
			
//			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 ****************************************/
//			String billDate = req.getParameter("String billDate");
//
//			/*************************** 2.開始查詢資料 ****************************************/
//			TransferService transferService = new TransferService();
//			List<TransferVO> transferVO = transferService.getAll(billDate);
//
//			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//			String param = "?memberId=" + ((TransferVO) transferVO).getMemberId() + "&memberBillId="
//					+ ((TransferVO) transferVO).getMemberBillId() + "&bankId=" + ((TransferVO) transferVO).getBankId()
//					+ "&bankNumber=" + ((TransferVO) transferVO).getBankNumber() + "&bankDate="
//					+ ((TransferVO) transferVO).getBankDate() + "&memberId=" + ((TransferVO) transferVO).getMemberId();

	// 送出新增後，狀態呼叫方法後變成"待審核"(傳進資料庫修改再取出顯示)
//			Integer memberBillId = Integer.valueOf(req.getParameter("memberBillId"));
//			MemberBillService memberBillService = new MemberBillService();
//			MemberBillVO memberBillVO = memberBillService.updateMemberPay(memberBillId);
//			req.setAttribute("memberBillVO", memberBillVO);
//			String url0 = "../../src/main/webapp/back-end/memberbill/getAll.jsp" + param;
////			res.sendRedirect("bill.do?action=getAll");			// 除了forward另一種跳轉的方式sendRedirect
//			RequestDispatcher successView0 = req.getRequestDispatcher(url0);// 成功轉交
//			successView0.forward(req, res);
			
		}
//		if ("transfer".equals(action)) {// 從資料庫抓出住戶未繳費的月份
//			String billGroup2 = (String)req.getParameter("bill_Group");
//			MemberBillService memberBillService = new MemberBillService();
//			String billGroup = billGroup2;											//req.getParameter("billGroup");//(Integer) session.getAttribute("memberId");
//			billGroup="9";
//			MemberBillVO billDateList = memberBillService.getBillDate(billGroup);
//			session.setAttribute("billDateList", billDateList);
//			res.sendRedirect(req.getContextPath() + "/front-end/memberbill/transfer.jsp");
//			System.out.print("onnn");
//		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		if ("transfer".equals(action)) {// 從資料庫抓出住戶未繳費的月份
			String billGroup2 = (String)req.getParameter("bill_Group");
			MemberBillService memberBillService = new MemberBillService();
//			Integer memberId = (Integer) session.getAttribute("memberId");// Attribute預設值為String所以要轉int
			String billGroup = "9";//req.getParameter("billGroup");//(Integer) session.getAttribute("memberId");
			MemberBillVO billDateList = memberBillService.getBillDate(billGroup);
			session.setAttribute("billDateList", billDateList);
			res.sendRedirect(req.getContextPath() + "/front-end/memberbill/transfer.jsp");
			System.out.print("on");
		}
	}
}
