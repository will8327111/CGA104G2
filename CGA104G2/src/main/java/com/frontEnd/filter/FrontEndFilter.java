package com.frontEnd.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/front-end/activity/*",
						  "/front-end/ame/*",
						  "/front-end/mail/*", 
						  "/front-end/maintenanceRecord/*", 
						  "/front-end/member/*", 
						  "/front-end/memberbill/*", 
						  "/front-end/privateReport/*", 
						  "/front-end/store/*",
						  "/front-end/web/*",
						 })

public class FrontEndFilter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		Object memberLoginVO = session.getAttribute("memberLoginVO");
		if (memberLoginVO == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/front-end/memberLogin/memberLoginFinal.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}
}
