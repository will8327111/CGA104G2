package com.ame.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.ame.model.AmeService;
import com.ame.model.AmeVO;

@WebServlet("/ame/ame.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class Ame_Servlet extends HttpServlet {

	protected void doGet(
			HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(
			HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("search".equals(action)) {
			String url ="/back-end/ame/showAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("addView".equals(action)) {
			String url = "/back-end/ame/addAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("addOneAme".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
	String amename = req.getParameter("amename");
			String enameReg = "^[(\u4e00-\u9fa5)(a-z A-Z 0-9 -)]{2,10}$";
			if (amename == null || amename.trim().length() == 0) {
				errorMsgs.add("公設名稱: 不能為空白");
			}else if (!amename.trim().matches(enameReg)) {
				errorMsgs.add("公設名稱: 只能是中、英文、數字和- , 且長度必需在2到10之間");
			}
			Integer amemax = null;
			try {
	amemax = Integer.valueOf(req.getParameter("amemax").trim());
			}catch (Exception e) {
				errorMsgs.add("人數上限請輸入數字");
			}
			
	String ameintroduce	= req.getParameter("ameintroduce");
			if (ameintroduce == null || ameintroduce.trim().length() == 0) {
				errorMsgs.add("公設介紹: 不能為空白");
			}
			Integer amepoint = null;
			try {
	amepoint = Integer.valueOf(req.getParameter("amepoint"));
			} catch (Exception e) {
				errorMsgs.add("需求點數請輸入數字");
			}
			
	 Integer opentime = Integer.valueOf(req.getParameter("opentime"));
	Integer closetime = Integer.valueOf(req.getParameter("closetime"));
			if(closetime == 0 ) {
			errorMsgs.add("關閉時間未選 請重新設定時間");
			}
			
			if (opentime >= closetime) {
				errorMsgs.add("開放時間不能大於,等於關閉時間 請重新設定時間");
			}
			
			String dt = "111111111111111111111111";
			StringBuffer sb = new StringBuffer();
			
			int oc = closetime - opentime;
			StringBuffer sb2 = new StringBuffer("");
			for (int i = 0; i < oc; i ++) {
				sb2.append("0");
			}
			
			sb.append(dt.substring(0, opentime));
			sb.append(sb2);
			sb.append(dt.substring(closetime, 24)) ;
			String ameopening = sb.toString();
			

//		    Part part = req.getPart("ameimg");
//		    InputStream in = part.getInputStream();
//		    ByteArrayOutputStream out = new ByteArrayOutputStream();
//		    byte[] buff = new byte[1024];
//		    int len;
//		    while((len = in.read(buff)) != -1) {
//		      out.write(buff, 0, len);
//		    }
//		    byte[] ameimg = out.toByteArray();
			
			Part part = req.getPart("ameimg");
			byte[] ameimg = part.getInputStream().readAllBytes();
			
			AmeVO ameVO = new AmeVO();
			ameVO.setAmeName(amename);
			ameVO.setAmeMax(amemax);
			ameVO.setAmeIntroduce(ameintroduce);
			ameVO.setAmePoint(amepoint);
			ameVO.setAmeOpening(ameopening);
			ameVO.setAmeImg(ameimg);
			
			if (!errorMsgs.isEmpty()) {
				System.out.println(errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/ame/addAme.jsp");
				failureView.forward(req, res);
				return ;
			} 

			AmeService ameSvc = new AmeService();
			ameVO = ameSvc.addAme(amename, ameintroduce, amepoint, amemax, ameopening, ameimg);
			
			String url = "/back-end/ame/controlAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
		}
		
		if("control".equals(action)) {
			
			String url = "/back-end/ame/controlAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}	
		
		if ("deleteAme".equals(action)) {
			
			Integer ameid = Integer.valueOf(req.getParameter("ameid"));
			
			AmeService ameSVC = new AmeService();
			ameSVC.deleteAme(ameid);
			
			String url = "/back-end/ame/controlAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("change".equals(action)) {
			
			Integer ameid = Integer.valueOf(req.getParameter("ameid"));
			AmeService ameSVC = new AmeService();
			AmeVO ameVO = ameSVC.getOneAme(ameid);
			
			
			String op = ameVO.getAmeOpening();
			List<Character> li = new ArrayList<Character>(); 
					
			for(int i =0 ;i<=op.length()-1;i++){
				li.add(op.charAt(i));
			}
					
			req.setAttribute("ameVO", ameVO);
			req.setAttribute("list", li);
			String url = "/back-end/ame/updateAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("updateAme".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
	Integer ameid = Integer.valueOf(req.getParameter("ameid"));
	String amename = req.getParameter("amename");
			String enameReg = "^[(\u4e00-\u9fa5)(a-z A-Z 0-9 -)]{2,10}$";
			if (amename == null || amename.trim().length() == 0) {
				errorMsgs.add("公設名稱: 不能為空白");
			}else if (!amename.trim().matches(enameReg)) {
				errorMsgs.add("公設名稱: 只能是中、英文、數字和- , 且長度必需在2到10之間");
			}
			Integer amemax = null;
			try {
	amemax = Integer.valueOf(req.getParameter("amemax").trim());
			}catch (Exception e) {
				errorMsgs.add("人數上限請輸入數字");
			}
			
	String ameintroduce	= req.getParameter("ameintroduce");
			if (ameintroduce == null || ameintroduce.trim().length() == 0) {
				errorMsgs.add("公設介紹: 不能為空白");
			}
			Integer amepoint = null;
			try {
	amepoint = Integer.valueOf(req.getParameter("amepoint"));
			} catch (Exception e) {
				errorMsgs.add("需求點數請輸入數字");
			}
			
	 Integer opentime = Integer.valueOf(req.getParameter("opentime"));	
	Integer closetime = Integer.valueOf(req.getParameter("closetime"));	
			
			if (opentime >= closetime) {
				errorMsgs.add("開放時間不能大於,等於關閉時間 請重新設定時間");
			}
			
			String dt = "111111111111111111111111";
			StringBuffer sb = new StringBuffer();
			
			int oc = closetime - opentime;
			StringBuffer sb2 = new StringBuffer("");
			for (int i = 0; i < oc; i ++) {
				sb2.append("0");
			}
			
			sb.append(dt.substring(0, opentime));
			sb.append(sb2);
			sb.append(dt.substring(closetime, 24)) ;
			String ameopening = sb.toString();
			

//		  Part part = req.getPart("ameimg");
//		    InputStream in = part.getInputStream();
//		    ByteArrayOutputStream out = new ByteArrayOutputStream();
//		    byte[] buff = new byte[1024];
//		    int len;
//		    while((len = in.read(buff)) != -1) {
//		      out.write(buff, 0, len);
//		    }
//		    byte[] ameimg = out.toByteArray();
			
			Part part = req.getPart("ameimg");
			byte[] ameimg = part.getInputStream().readAllBytes();
			if (ameimg.length==0) {
				AmeService ameSvc2 = new AmeService();
			    ameimg = ameSvc2.getOneAme(ameid).getAmeImg();
			} 
			
			AmeVO ameVO = new AmeVO();
			ameVO.setAmeId(ameid);
			ameVO.setAmeName(amename);
			ameVO.setAmeMax(amemax);
			ameVO.setAmeIntroduce(ameintroduce);
			ameVO.setAmePoint(amepoint);
			ameVO.setAmeOpening(ameopening);
			ameVO.setAmeImg(ameimg);
			
			if (!errorMsgs.isEmpty()) {
				System.out.println(errorMsgs);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/ame/updateAme.jsp");
				failureView.forward(req, res);
				return ;
			} 
			
			AmeService ameSvc = new AmeService();
			ameVO = ameSvc.updateAme(ameid, amename, ameintroduce, amepoint, amemax, ameopening, ameimg);
			
			String url = "/back-end/ame/controlAme.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

		}
		
	}

}
