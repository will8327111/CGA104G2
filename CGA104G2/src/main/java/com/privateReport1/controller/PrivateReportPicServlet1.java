package com.privateReport1.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/back-end/privateReport1/privateReportPicServlet.do")
public class PrivateReportPicServlet1 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Community_Management?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei";
	String account = "root";
	String password = "password";
	
	Connection con = null;
	PreparedStatement pstmt = null;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		String action = req.getParameter("action");
		
		if ("showPic".equals(action)) {
			Integer privateReportId = Integer.parseInt(req.getParameter("privateReportId"));
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, account, password);
				Statement stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("SELECT REPLY_PIC FROM PRIVATE_REPORT WHERE PRIVATE_REPORT_ID =" + privateReportId);
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("REPLY_PIC"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				}
			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/NoData/null.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}

		}
		
		if ("showMemberPic".equals(action)) {
			Integer privateReportId = Integer.parseInt(req.getParameter("privateReportId"));
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, account, password);
				Statement stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("SELECT PRIVATE_REPORT_PIC, REPLY_PIC FROM PRIVATE_REPORT WHERE PRIVATE_REPORT_ID =" + privateReportId);
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("PRIVATE_REPORT_PIC"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				}
			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/NoData/null.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}

		}
	}
}
