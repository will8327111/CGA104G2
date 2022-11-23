//package com.backstage.filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.backstageAccount.model.BackstageAccountVO;
//
//@WebFilter(urlPatterns = {"/back-end/backstageAccount/BackstageAccountInfo.do",
//						  "/back-end/web/backEndHomeMgr.html",
//						  "/back-end/web/backEndHomeEmp.html"
//						 })
//
//public class BackstageFilterIdentity implements Filter {
//
//	private FilterConfig config;
//
//	public void init(FilterConfig config) {
//		this.config = config;
//	}
//
//	public void destroy() {
//		config = null;
//	}
//
//	public void doFilter(ServletRequest request, ServletResponse response,
//			FilterChain chain) throws ServletException, IOException {
//		HttpServletRequest req = (HttpServletRequest) request;
//		HttpServletResponse res = (HttpServletResponse) response;
//		// 【取得 session】
//		HttpSession session = req.getSession();
//		// 【從 session 判斷此user是否登入過】
//		BackstageAccountVO backstageAccountVO = (BackstageAccountVO) session.getAttribute("backstageAccountVO");
//		
//		if(backstageAccountVO.getBmId() == 1){
//			System.out.println("123");
//			res.sendRedirect(req.getContextPath() + "/back-end/web/backEndHomeMgr.html");
//			chain.doFilter(request, response);
//		}else{
//			System.out.println("456");
//			res.sendRedirect(req.getContextPath() + "/back-end/web/backEndHomeEmp.html");
//			chain.doFilter(request, response);
//		}
//	}
//}
