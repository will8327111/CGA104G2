package com.member.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;
@WebServlet("/member/PicuploadServlet")
public class PicuploadServlet extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String MEMBER_ID=req.getParameter("memberid").trim();
			ResultSet rs = stmt.executeQuery(
				"SELECT MEMBER_PIC FROM community_management.member where MEMBER_ID = "+MEMBER_ID);

			if (rs.next()) {

				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("MEMBER_PIC"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				//res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream in=getServletContext().getResourceAsStream("/NoData/none2.jpg");
			byte[] b=in.readAllBytes();
			out.write(b);
			in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			//System.out.println(e);
			InputStream in=getServletContext().getResourceAsStream("/NoData/null.jpg");
			byte[] b= new byte[in.available()];
		in.read(b);
		out.write(b);
		in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}