//package com.store.controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.google.gson.Gson;
//import com.store.model.StoreService;
//import com.store.model.StoreVO;
//
//@WebServlet("/test")
//public class TestServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setCharacterEncoding("UTF-8");
//		
//		Gson gson = new Gson();
//		StoreVO storeVO = gson.fromJson(req.getReader(), StoreVO.class);
//		StoreService storeSvc = new StoreService();
//		storeVO = storeSvc.addStore(storeVO);
//		resp.getWriter().append(gson.toJson(storeVO));
//	}
//}
