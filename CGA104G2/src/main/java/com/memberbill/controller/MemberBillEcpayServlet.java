package com.memberbill.controller;

import java.io.IOException;
import java.io.Writer;
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

import com.bank.model.BankService;
import com.bank.model.BankVO;
import com.memberLogin.model.MemberLoginVO;
import com.memberbill.model.MemberBillService;
import com.memberbill.model.MemberBillVO;
import com.transfer.model.TransferService;
import com.transfer.model.TransferVO;

//http://localhost:8081/xxx/
@WebServlet("/member/ecpay")
@MultipartConfig
public class MemberBillEcpayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");

		MemberBillService memSvc = new MemberBillService();
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		

		// 刷卡按鈕點即至綠界頁面
		if ("buyToken".equals(action)) {
			System.out.println("近來");
		  
			
			MemberLoginVO  memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");
			Integer memId = memberLoginVO.getMemberId();
			Integer sum = Integer.parseInt(req.getParameter("sum"));
			Integer memberBillId = Integer.parseInt(req.getParameter("memberBillId"));
			
			memSvc.getAllCost(memId);
			Writer out = res.getWriter();

			StringBuffer st = new StringBuffer();// 可存蓄和操作字符
			String url = st.append(req.getScheme()).append("://").append(req.getServerName()).append(":")
					.append(req.getServerPort()).append(req.getContextPath()).toString();
			
//			Integer memberBillId = 25411;//memberBillId 先寫死
			String result = memSvc.buyToken(sum, url, memId,memberBillId);
			System.out.println(result);// 測試
			
			req.setAttribute("result", result);
			String url1 = "/front-end/memberbill/test.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url1);
			successView.forward(req, res);

		}
		// 匯款按鈕至匯款頁面
		if ("transfer".equals(action)) {
//			Integer memId = (Integer) req.getSession().getAttribute("memberId");
			//改
			MemberLoginVO  memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");
			Integer memId = memberLoginVO.getMemberId();
			
			BankService bank = new BankService();
			List<BankVO> list = bank.getAll();
			List<MemberBillVO> list1 = memSvc.getBillDate(memId);
			req.setAttribute("list1", list1);
			System.out.println(list1);
			String url = "/front-end/memberbill/transfer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

			System.out.print("innn");
		}
		// 匯款資料新增進DB
		if ("insert".equals(action)) {
	
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			//改
			MemberLoginVO  memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");
			Integer memId = memberLoginVO.getMemberId();
			
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			byte[] memberPhoto = req.getPart("file").getInputStream().readAllBytes();
			Integer memberPayMethod=0;
			List<MemberBillVO> list = memSvc.getBillDate(memId);
			req.setAttribute("list1", list);
			Integer memberBillId=Integer.valueOf(req.getParameter("billDate"));
			
			String bankId=req.getParameter("bankId"); // 請求銀行資訊
			
			String bankNumber = req.getParameter("bankNumber").trim();// 請求後五碼
			if (bankNumber == null || bankNumber.trim().length() == 0) {
				errorMsgs.add("後五碼請勿空白");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberbill/transfer.jsp");
				failureView.forward(req, res);
				return;
			} else if (bankNumber.trim().length() != 5) {
				
				errorMsgs.add("後五碼長度須為五個數字");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/memberbill/transfer.jsp");
				failureView.forward(req, res);
				return;
			}
			
				
			
			
			Integer bankNumber2 = Integer.valueOf(bankNumber);// 字串轉回int
			TransferVO transferVO = new TransferVO();
			transferVO.setBankId(bankId);
			transferVO.setBankNumber(bankNumber2);

			

			/*************************** 2.開始新增資料 *****************************************/

			TransferService transferService = new TransferService();
			transferVO = transferService.insert(memberBillId, bankId, bankNumber2, memId, memberPhoto, memberPayMethod);

			/*************************** 3.開始新增照片 *****************************************/
//
			MemberBillService memberBillService = new MemberBillService();
//			List<MemberBillVO> list = memberBillService.getUnpaid(memId);
//			Part file = req.getPart("file"); // 檔案用part裝
//			byte[] memberPhoto = file.getInputStream().readAllBytes(); // 把所有轉byte[]的檔案讀進來(取到)
			MemberBillVO vo = new MemberBillVO(); // 從VO取
			vo.setMemberPhoto(memberPhoto);
			vo.setMemberBillId(memId); // 有帳單ID才能改變照片值
			memberBillService.uploadPhoto(vo);
			MemberBillVO vo1 = memberBillService.updateMemberPay(memberBillId);// 繳費狀態為待審核// 把方法傳進來
			System.out.println("我有執行");

			/*************************** 4.新增完成,準備轉交(Send the Success view) *************/

			req.setAttribute("transferVO", transferVO);// 參數傳遞// 資料庫update成功後,存入req(key.value)
			String url = "/front-end/memberbill/transfer_2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交getTransfer.jsp
			successView.forward(req, res);
		}
	}
}
