package com.store.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
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

import org.json.JSONObject;

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
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		
		if ("getAll".equals(action)) { 
			StoreService storeSvc = new StoreService();
		    out.write(storeSvc.getAll().toString());	

		}
		
		if ("insert".equals(action)) {
			BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"utf-8"));
			String json = "";
			if(br != null) {
				json = br.readLine();
			}
			
			JSONObject obj = new JSONObject(json); 
			JSONObject addMail = obj.getJSONObject("value");
			
			Double storeLon = Double.valueOf((String)addMail.get("storeLon"));
			Double storeLat = Double.valueOf((String)addMail.get("storeLat"));
			
			Integer storeTypeId = Integer.valueOf((String) addMail.get("storeTypeId"));
			String storeLoc = String.valueOf((String) addMail.get("storeLoc"));
			BigDecimal storeLon2 = BigDecimal.valueOf(storeLon);
			BigDecimal storeLat2 = BigDecimal.valueOf(storeLat);
			String addStorePhoto = String.valueOf((String) addMail.get("storePhoto"));
			String storeInfo = String.valueOf((String) addMail.get("storeInfo"));
			
			
			StoreVO storeVO = new StoreVO();
			storeVO.setStoreTypeId(storeTypeId);
			storeVO.setStoreLoc(storeLoc);
			storeVO.setStoreLon(storeLon2);
			storeVO.setStoreLat(storeLat2);
			storeVO.setBase64img(addStorePhoto);
			storeVO.setStoreInfo(storeInfo);
			
			StoreService storeSvc = new StoreService();
			storeSvc.addStore(storeVO);
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
		if("selectStoreType".equals(action)) {
			StoreService storeSvc = new StoreService();
			out.write(storeSvc.findStoreType().toString());
		}
		
		if("search".equals(action)) {
			String mailType = req.getParameter("mailType");
			Integer mailId = Integer.valueOf(req.getParameter("mailId").trim());
			MailService mailSvc = new MailService();
//			if(mailId == 0) {
//				out.write(mailSvc.singleSearch(mailType).toString());
//			}
			System.out.println(mailType);
			System.out.println(mailId);
			out.write(mailSvc.search(mailType,mailId).toString());
		}
	}

}
