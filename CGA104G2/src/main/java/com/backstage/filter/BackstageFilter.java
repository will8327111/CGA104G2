package com.backstage.filter;

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

@WebFilter(urlPatterns = {"/back-end/backstageAuthorization/*", 
						  "/back-end/backstageCapabilities/*",
						  "/back-end/backstageAccount/addInfo.jsp",
						  "/back-end/backstageAccount/backstageIndex.jsp",
						  "/back-end/backstageAccount/backstageInfo.jsp",
						  "/back-end/backstageAccount/listAllInfo.jsp",
						  "/back-end/backstageAccount/listOneInfo.jsp",
						  "/back-end/backstageAccount/updateOneInfo.jsp"
						 })

public class BackstageFilter implements Filter {

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
		Object backstageAccountVO = session.getAttribute("backstageAccountVO");
		if (backstageAccountVO == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/back-end/backstageAccount/backstageLogin.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}
}
