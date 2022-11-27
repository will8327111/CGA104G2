package com.bank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.model.BankService;
import com.bank.model.BankVO;

@WebServlet("/bank/do")
public class BankServlet extends HttpServlet{
protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException{
	BankService bank=new BankService();
	String action2=req.getParameter("action2");
//	if("select".equals(action2)) {
//		List<BankVO>list=bank.getAll();
//		req.setAttribute("list", list);//指定這個值
//		req.getRequestDispatcher("/front-end/memberbill/transfer.jsp").forward(req, res);//請求轉發
//	}
	
} 
}
