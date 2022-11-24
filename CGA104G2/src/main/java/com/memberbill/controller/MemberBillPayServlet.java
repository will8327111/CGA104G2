package com.memberbill.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Spring;

import org.hibernate.event.service.spi.DuplicationStrategy.Action;
import org.json.JSONObject;

import com.billgroup.model.BillGroupService;
import com.card.model.CardService;
import com.card.model.CardVO;
import com.memberbill.model.MemberBillService;
import java.lang.StringBuilder;

@WebServlet("/member/pay")

public class MemberBillPayServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			res.setContentType("text/html;charset=utf-8");
			
			String MemberData=req.getParameter("CustomField1");
			String[] spilt=MemberData.split(",");
			Integer memId=Integer.parseInt(spilt[0]);
			Integer sum=Integer.parseInt(spilt[1]);
			System.out.println(""+memId+","+sum);

			
			BillGroupService billGroupService=new BillGroupService();
			String billGroup = billGroupService.getBillGroup(memId);
			
			CardVO cardVO = new CardVO();
			cardVO.setBillGroup(billGroup);
			cardVO.setMemberId(memId);
			
			MemberBillService memSvc = new MemberBillService();
			memSvc.insert(memId,sum);
			
			CardService cardService = new CardService();
			cardService.insert(cardVO);
			
			ServletContext sc=this.getServletContext();
			String contextPath = sc.getContextPath();
			String url = contextPath+"/front-end/memberbill/card.jsp";
			res.sendRedirect(url);
		}
	}


