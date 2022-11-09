package com.store.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mail.model.MailService;
import com.mail.model.MailVO;
import com.store.model.StoreService;
import com.store.model.StoreVO;

@WebServlet("/back-end/store/store.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class StoreServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		
		if ("getAll".equals(action)) { 
			StoreService storeSvc = new StoreService();
		    out.write(storeSvc.getAll().toString());	

		}
		
		if ("insert".equals(action)) {
			Integer storeTypeId = null;
			try {
				storeTypeId = Integer.valueOf(req.getParameter("storeTypeId").trim());
			} catch (Exception e) {
				System.out.println("請輸入商店項目編號");
			}
			
			String storeInfo = req.getParameter("storeInfo").trim();
			
			String storeLoc = req.getParameter("storeLoc").trim();
			
			String bigDecimal = req.getParameter("storeLon").trim();
			BigDecimal storeLon = new BigDecimal(bigDecimal);
			
			String bigDecimal2 = req.getParameter("storeLat").trim();
			BigDecimal storeLat = new BigDecimal(bigDecimal2);
			
			Part part = req.getPart("storePhoto");
			byte[] storePhoto = null;
			InputStream is = part.getInputStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			storePhoto = new byte[bis.available()];
			bis.read(storePhoto);
			is.close();
			
			/*************************** 2.開始加入資料 ***************************************/
			StoreService storeSvc = new StoreService();
			StoreVO storeVO = new StoreVO();
			storeVO = storeSvc.addStore(storeTypeId, storeInfo, storeLoc, storeLon, storeLat,storePhoto);
			
			/*************************** 3.加入完成,準備轉交(Send the Success view) ***********/
			String url = "/back-end/store/storeIndex.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/***************************  ***************************************/
			Integer storeId = Integer.valueOf(req.getParameter("storeId"));

			/******************************************************************/
			StoreService storeSvc = new StoreService();
			storeSvc.deleteStore(storeId);
		}
		
		if ("update".equals(action)) {
			
			Integer storeId = Integer.valueOf(req.getParameter("storeId").trim());
			Integer storeTypeId =  Integer.valueOf(req.getParameter("storeTypeId").trim());
			String storeInfo = req.getParameter("storeInfo");
			String storeLoc = req.getParameter("storeLoc");
			String bigDecimal = req.getParameter("storeLon").trim();
			BigDecimal storeLon = new BigDecimal(bigDecimal);
			String bigDecimal2 = req.getParameter("storeLat").trim();
			BigDecimal storeLat = new BigDecimal(bigDecimal2);
			
			Part part = req.getPart("storePhoto");
			byte[] storePhoto = null;
			InputStream is = part.getInputStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			storePhoto = new byte[bis.available()];
			bis.read(storePhoto);
			is.close();

			
			StoreVO storeVO = new StoreVO();
			storeVO.setStoreId(storeId);
			storeVO.setStoreTypeId(storeTypeId);
			storeVO.setStoreInfo(storeInfo);
			storeVO.setStoreLoc(storeLoc);
			storeVO.setStoreLon(storeLon);
			storeVO.setStoreLat(storeLat);
			storeVO.setStorePhoto(storePhoto);
			/******************************************************************/
			StoreService storeSvc = new StoreService();
			storeVO = storeSvc.updateStore(storeId,storeTypeId, storeInfo,storeLoc,storeLon,storeLat,storePhoto);

			/******************************************************************/
			req.setAttribute("storeVO", storeVO); 
			String url = "/back-end/store/storeIndex.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
		
		if ("getOne_For_Update".equals(action)) { 
			Integer storeId = Integer.valueOf(req.getParameter("storeId"));
			
			/******************************************************************/
			StoreService storeSvc = new StoreService();
			StoreVO storeVO = storeSvc.getOneMail(storeId);

			/******************************************************************/
			req.setAttribute("storeVO", storeVO); 
			String url = "/back-end/store/listOneStore.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
	}

}
