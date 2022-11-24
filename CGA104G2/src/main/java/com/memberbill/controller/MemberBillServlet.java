package com.memberbill.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.card.model.CardService;
import com.card.model.CardVO;
import com.memberbill.model.MemberBillService;
import com.memberbill.model.MemberBillVO;
import com.transfer.model.TransferService;
import com.transfer.model.TransferVO;

//http://localhost:8081/xxx/
@WebServlet("/member/bill.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemberBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletResponse response;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MemberBillService memSvc = new MemberBillService();
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		Integer userId = 0;
		System.out.println(action);
		

		if ("getAll".equals(action)) {
			List<MemberBillVO> list = memSvc.getAll();
			req.setAttribute("list", list);
			System.out.println("list");
			req.getRequestDispatcher("/back-end/memberbill/getAll.jsp").forward(req, res);

			// 取得下拉選單日期
			TransferService transferService2 = new TransferService();
			List<String> vo2 = transferService2.getOneBillDate();// 查詢繳費 年/月
			// 放入session給前端用
			session.setAttribute("vo2", vo2);// set保存
		

		} else if ("memberphoto".equals(action)) {
			Integer MemberBillID = Integer.valueOf(req.getParameter("memberBillId"));
			byte[] memberPhoto = memSvc.getOnePhoto(MemberBillID);
			if (memberPhoto != null) {
				res.getOutputStream().write(memberPhoto);
			}
		}
		if ("getOne_For_Update".equals(action)) { // 抓近來都是String
			Integer memberBillId = Integer.parseInt(req.getParameter("memberBillId")); // 將取過來的String轉Integer(後端設定的數字才能判斷)
			String memberPay = req.getParameter("memberPay"); // getParameter從jsp取參數的方法// 將取過來的String轉Integer
			memSvc.update(memberBillId, memberPay);
			// forward to addMember.jsp//修改的內容在同個頁面顯示
			res.sendRedirect("bill.do?action=getAll"); // 除了forward另一種跳轉的方式sendRedirect
		}
//		if ("insert".equals(action)) {//新增照片進資料庫
//			// 以下為接收請求參數(Request Parameter)//把請求的參數取進來
//			List<MemberBillVO> list = memSvc.getUnpaid(userId);
//			Part file = req.getPart("file"); // 檔案用part裝
//			byte[] memberPhoto = file.getInputStream().readAllBytes(); // 把所有轉byte[]的檔案讀進來(取到)
//			MemberBillVO vo = new MemberBillVO(); // 從VO取
//			vo.setMemberPhoto(memberPhoto);
//			memSvc.uploadPhoto(vo); // service也要
//			req.getRequestDispatcher(req.getContextPath() +"/member/ecpay?action=insert").forward(req, res);
//		}

		if ("ID".equals(action)) { // 登入
			userId = Integer.valueOf(req.getParameter("ID"));
			session.setAttribute("memberId", userId);
			String url = (req.getContextPath() + "/front-end/memberbill/pay.jsp");//req.getContextPath() + 
			res.sendRedirect(url);

		}

		if ("memberphoto".equals(action)) {
			Integer memberBillID = Integer.valueOf(req.getParameter("memberBillId"));
			byte[] memberPhoto = memSvc.getOnePhoto(memberBillID);
			res.getOutputStream().write(memberPhoto);
		}

		if ("select_Transfer".equals(action)) {// 後台上方的查詢列(匯款及刷卡)

			/*************************** 1接收請求參數 **********************/

			String billDate = req.getParameter("billDate2");// 下拉選單的月份選擇
			/*************************** 2開始查詢資料 *****************************************/
			String memberPayMethod = req.getParameter("memberPayMethod");
			
			if(memberPayMethod == null) {
				res.setContentType("text/html;charset=utf-8");
				List<MemberBillVO> list = memSvc.getAll();
				req.setAttribute("list", list);
				req.getRequestDispatcher("/back-end/memberbill/getAll.jsp").forward(req, res);
				return;
			}

			if (memberPayMethod.equals("0")) {// 匯款頁面

				TransferService transferService = new TransferService();
				List<TransferVO> list = transferService.getAll(billDate);
				req.setAttribute("list", list);
				String url = "/back-end/memberbill/getTransfer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} else {// 刷卡頁面
				CardService cardService = new CardService();
				List<CardVO> cardlist = cardService.getAllCard(billDate);
				req.setAttribute("cardlist", cardlist);
				String url = "/back-end/memberbill/getCard.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			
		}
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
