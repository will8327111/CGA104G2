package com.bulletinboardpic.controller;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
@WebServlet("/bulletinboardpic/UploadBbPic")
public class BulletinBoardPicServlet extends HttpServlet {

    Connection con;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("image/gif");
        ServletOutputStream out = res.getOutputStream();

        try {
            Statement stmt = con.createStatement();
            String BB_SUB_ID=req.getParameter("bbsubid").trim();
            ResultSet rs = stmt.executeQuery(
                    "select BB_PIC FROM community_management.bulletin_board_pictures\n" +
                            "where BB_SUB_ID="+BB_SUB_ID);

            if (rs.next()) {

                BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("BB_PIC"));
                byte[] buf = new byte[4 * 1024]; // 4K buffer
                int len;
                while ((len = in.read(buf)) != -1) {
                    out.write(buf, 0, len);
                }
                in.close();
            } else {
                //res.sendError(HttpServletResponse.SC_NOT_FOUND);
                InputStream in=getServletContext().getResourceAsStream("/resources/img/NoData/none.png");
                byte[] b=in.readAllBytes();
                out.write(b);
                in.close();
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            //System.out.println(e);
            InputStream in=getServletContext().getResourceAsStream("/resources/img/none.png");
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