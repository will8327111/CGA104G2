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

@WebServlet("/member/transfer")
@MultipartConfig
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String action = req.getParameter("action");	
		TransferService transferService = new TransferService();
		
		if("select_memberPay".equals(action)) {
			String memberPay = req.getParameter("memberPay");
			String billDate = (String)session.getAttribute("billDate");
			
			List<TransferVO> list = transferService.getMemberPay(memberPay,billDate);
			req.setAttribute("list", list);
			String url = "/back-end/memberbill/getTransfer.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		HttpSession session = req.getSession();

	}
}
