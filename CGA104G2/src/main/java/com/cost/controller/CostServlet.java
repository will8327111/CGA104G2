package com.cost.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cost.model.CostService;
import com.cost.model.CostVO;

//http://localhost:8081/xxx/
@WebServlet("/cost")
public class CostServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		 if ("insert".equals(action)) {  // 來自addCost.jsp的請求 
			 List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String costName = req.getParameter("costName").trim();//費用名稱
					if (costName == null || costName.trim().length() == 0) {
						errorMsgs.add("費用名稱請勿空白");
					}	
					
				java.sql.Date startDate = null;//費用的開始時間
					try {
				        startDate = java.sql.Date.valueOf(req.getParameter("startDate").trim());
					}catch(IllegalArgumentException e) {
						startDate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入費用啟用日期!");
					}
					
				Integer cost = Integer.valueOf(req.getParameter("cost"));//坪數費用
				
				Integer enableStatus = Integer.valueOf(req.getParameter("enableStatus"));//啟用狀態
				String createUser = req.getParameter("createUser");//新增人員
				if (createUser == null || createUser.trim().length() == 0) {
					errorMsgs.add("欄位請勿空白");
				}	
				
				CostVO costVo=new CostVO();
				
				costVo.setCostName(costName);
				costVo.setStartDate(startDate);
				costVo.setCost(cost);
				costVo.setEnableStatus(enableStatus);
				costVo.setCreateUser(createUser);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("costVo", costVo); // 含有輸入格式錯誤的costVO物件,也存入req//保持打過的資料!!
							RequestDispatcher failureView = req.getRequestDispatcher("/back-end/memberbill/addCost.jsp");
							failureView.forward(req, res);
							return;
						}
		/***************************2.開始新增資料***************************************/
				CostService costSvc = new CostService();
				costVo = costSvc.addCost(costName,startDate,cost,enableStatus,createUser);
		/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/memberbill/listAllCost.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交addCost.jsp
				successView.forward(req, res);	
				
		 }
	}
}
