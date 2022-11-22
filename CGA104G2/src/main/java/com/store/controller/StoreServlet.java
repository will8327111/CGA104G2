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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONObject;

import com.mail.model.MailService;
import com.mail.model.MailVO;
import com.mysql.cj.Session;
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
		HttpSession session = req.getSession();
		
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
			Double storeLon = Double.valueOf((String)obj.get("storeLon"));
			Double storeLat = Double.valueOf((String)obj.get("storeLat"));
			
			String storeName = String.valueOf((String) obj.get("storeName"));
			Integer storeTypeId = Integer.valueOf((String) obj.get("storeTypeId"));
			String storeLoc = String.valueOf((String) obj.get("storeLoc"));
			BigDecimal storeLon2 = BigDecimal.valueOf(storeLon);
			BigDecimal storeLat2 = BigDecimal.valueOf(storeLat);
			String addStorePhoto = String.valueOf((String) obj.get("storePhoto"));
			String storeInfo = String.valueOf((String) obj.get("storeInfo"));
			
			
			StoreVO storeVO = new StoreVO();
			storeVO.setStoreName(storeName);
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
			
			BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"utf-8"));
			String json = "";
			if(br != null) {
				json = br.readLine();
			}

			JSONObject obj =new JSONObject(json); 
			Double storeLon = Double.valueOf((String)obj.get("storeLon"));
			Double storeLat = Double.valueOf((String)obj.get("storeLat"));
			
			Integer storeId =  Integer.valueOf((String)obj.get("storeId"));
			String storeName = (String)obj.get("storeName");
			Integer storeTypeId =Integer.valueOf((String)obj.get("storeTypeId"));
			String storeLoc = (String)obj.get("storeLoc");
			BigDecimal storeLon2 = BigDecimal.valueOf(storeLon);
			BigDecimal storeLat2 = BigDecimal.valueOf(storeLat);
			String StorePhoto = (String)obj.get("storePhoto");
			String storeInfo = (String)obj.get("storeInfo");
			
			System.out.println(storeLon2);			
			System.out.println(storeTypeId);			
			System.out.println(storeId);			
			System.out.println(storeName);			
			System.out.println(storeLoc);			
			System.out.println(StorePhoto);			
			System.out.println(storeInfo);			
			
			StoreVO storeVO = new StoreVO();
			storeVO.setStoreId(storeId);
			storeVO.setStoreName(storeName);
			storeVO.setStoreTypeId(storeTypeId);
			storeVO.setStoreInfo(storeInfo);
			storeVO.setStoreLoc(storeLoc);
			storeVO.setStoreLon(storeLon2);
			storeVO.setStoreLat(storeLat2);
			storeVO.setBase64img(StorePhoto);
			/******************************************************************/
			StoreService storeSvc = new StoreService();
			storeVO = storeSvc.updateStore(storeVO);

			/******************************************************************/
		}
		if ("setOneStore".equals(action)) { 
			Integer storeId = Integer.valueOf(req.getParameter("storeId"));
			
			/******************************************************************/
			StoreService storeSvc = new StoreService();
			session.setAttribute("storeId", storeId);
			/******************************************************************/
		}
		if ("getOne_For_Display".equals(action)) { 

			Integer storeId = (Integer)session.getAttribute("storeId");
			StoreService storeSvc = new StoreService();
			out.write(storeSvc.getOneMail(storeId).toString());
		}
		
		if("selectStoreType".equals(action)) {
			StoreService storeSvc = new StoreService();
			out.write(storeSvc.findStoreType().toString());
		}
		
		if("search".equals(action)) {
			String storeTypeName = req.getParameter("storeTypeName");
			Integer storeId = Integer.valueOf(req.getParameter("storeId").trim());
			StoreVO storeVO = new StoreVO();
			storeVO.setStoreTypeName(storeTypeName);
			storeVO.setStoreId(storeId);
			
			
			StoreService storeSvc = new StoreService();
			out.write(storeSvc.search(storeTypeName,storeId).toString());
		}
	}

}
