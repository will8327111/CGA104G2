package com.bulletinboard.controller;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.util.*;
import java.sql.Date;
import com.bulletinboard.model.*;


@WebServlet("/bulletinboard/bulletinboard.do")
@MultipartConfig(fileSizeThreshold=1024*1024*10,  // 10 MB
        maxFileSize=1024*1024*50,       // 50 MB
        maxRequestSize=1024*1024*100)    // 100 MB

public class BulletinboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();

        if ("getOneBb_For_Display".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /*==========1.接收請求參數==========*/
            String str = req.getParameter("bbsubid");
            if (str == null || (str.trim()).length() == 0) {
                errorMsgs.add("輸入值不可空白，請輸入公佈欄編號");
            }
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bulletinboard/bb_select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            Integer bbSubId = null;
            try {
                bbSubId = Integer.valueOf(str);
            } catch (Exception e) {
                errorMsgs.add("公佈欄編號格式不正確，請重新輸入");
            }
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bulletinboard/bb_select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            /*==========2.查詢資料==========*/

            BulletinboardService bulletinboardSvc = new BulletinboardService();
            BulletinboardVO bulletinboardVO = bulletinboardSvc.getOneBulletinboard(bbSubId);
            if (bulletinboardVO == null) {
                errorMsgs.add("查無資料");
            }

            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/bulletinboard/bb_select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************3.查詢完成,準備轉交(Send the Success view)*************/
            req.setAttribute("bulletinboardVO", bulletinboardVO);
            String url = "/back-end/bulletinboard/listOneBb.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("getOneBb_For_Update".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數****************************************/
            Integer bbSubId= Integer.valueOf(req.getParameter("bbsubid"));

            /***************************2.開始查詢資料****************************************/
            BulletinboardService bulletinboardSvc = new BulletinboardService();
            BulletinboardVO bulletinboardVO = bulletinboardSvc.getOneBulletinboard(bbSubId);

            /***************************3.查詢完成,準備轉交(Send the Success view)************/
            req.setAttribute("bulletinboardVO", bulletinboardVO);
            String url = "/back-end/bulletinboard/update_bb_input.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
//修改
        if ("update".equals(action)) { // 來自update_member_input.jsp的請求

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
            Integer bbSubId = Integer.valueOf(req.getParameter("bbsubid").trim());

            String bbClass = req.getParameter("bbclass").trim();
            if (bbClass == null || bbClass.length() == 0) {
                errorMsgs.add("請選擇公佈欄欄位");
            }

            String bbTitle = req.getParameter("bbtitle").trim();
            if (bbTitle == null || bbTitle.trim().length() == 0) {
                errorMsgs.add("請輸入公佈欄標題");
            }

            String bbContent = req.getParameter("bbcontent");
            if (bbContent == null || bbContent.length() == 0) {
                errorMsgs.add("請輸入欲發佈的文章內容");
            }

            Date bbPostdate = Date.valueOf(req.getParameter("bbpostdate").trim());
//            Date bbPostdate =  null;
//            try {
//                bbPostdate = Date.valueOf(req.getParameter("bbpostdate").trim());
//            } catch (IllegalArgumentException e) {
//                bbPostdate = new Date(System.currentTimeMillis());
//                errorMsgs.add("發佈日期沒有輸入或是格式錯誤,請重新輸入!");
//            }

            Date bbUpdate = Date.valueOf(req.getParameter("bbupdate").trim());
//            try {
//                bbUpdate = Date.valueOf(req.getParameter("bbupdate").trim());
//            } catch (IllegalArgumentException e) {
//                bbUpdate = new Date(System.currentTimeMillis());
//                errorMsgs.add("更新日期沒有輸入或是格式錯誤,請重新輸入!");
//            }

            Integer bbArticalState = null;
            try {
                bbArticalState = Integer.valueOf(req.getParameter("bbarticalstate").trim());
            } catch (NumberFormatException e) {
                bbArticalState = 0;
                errorMsgs.add("請填入正確格式.");
            }
            Integer bmId = Integer.valueOf(req.getParameter("bmid").trim());

//            Part part=req.getPart("bbpic");
//            byte[] bbPic = part.getInputStream().readAllBytes();

            BulletinboardVO bulletinboardVO = new BulletinboardVO();
            bulletinboardVO.setBbSubId(bbSubId);
            bulletinboardVO.setBbClass(bbClass);
            bulletinboardVO.setBbTitle(bbTitle);
            bulletinboardVO.setBbContent(bbContent);
            bulletinboardVO.setBbPostdate(bbPostdate);
            bulletinboardVO.setBbUpdate(bbUpdate);
            bulletinboardVO.setBbArticalState(bbArticalState);

            bulletinboardVO.setBmId(bmId);
//            bulletinboardVO.setBbPic(bbPic);

            if (!errorMsgs.isEmpty()) {
                req.setAttribute("bulletinboardVO", bulletinboardVO);
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/bulletinboard/update_bb_input.jsp");
                failureView.forward(req, res);
                return; //程式中斷
            }

            /***************************2.開始修改資料*****************************************/
            BulletinboardService bulletinboardSvc = new BulletinboardService();
            bulletinboardVO = bulletinboardSvc.updateBulletinboard(bbSubId,bbClass, bbTitle,bbContent,
                    bbPostdate, bbUpdate, bbArticalState, bmId);

            /***************************3.修改完成,準備轉交(Send the Success view)*************/
            req.setAttribute("bulletinboardVO", bulletinboardVO);
            String url = "/back-end/bulletinboard/listAllBboard.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

//新增
        if ("insert".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
            String bbClass = req.getParameter("bbclass").trim();;
           if (bbClass == null || bbClass.trim().length() == 0) {
               errorMsgs.add("請選擇公佈欄欄位");
            }

            String bbTitle = req.getParameter("bbtitle").trim();
           if (bbTitle == null || bbTitle.trim().length() == 0) {
                errorMsgs.add("請輸入標題內容");
            }

            String bbContent = req.getParameter("bbcontent").trim();
            if (bbContent == null || bbContent.trim().length() == 0) {
                errorMsgs.add("請輸入文章內容");
            }

            java.sql.Date bbPostdate = null;
            try {
                bbPostdate = java.sql.Date.valueOf(req.getParameter("bbpostdate").trim());
            } catch (IllegalArgumentException e) {
                bbPostdate = new Date(System.currentTimeMillis());
                errorMsgs.add("發佈日期沒有選擇,請重新輸入!");
            }

            java.sql.Date bbUpdate = null;
            try {
                bbUpdate = java.sql.Date.valueOf(req.getParameter("bbupdate").trim());
            } catch (IllegalArgumentException e) {
                bbUpdate = new Date(System.currentTimeMillis());
                errorMsgs.add("更新日期沒有選擇,請重新輸入!");
            }

            Integer bbArticalState=null;
            try {
                bbArticalState = Integer.valueOf(req.getParameter("bbarticalstate"));
            } catch (NumberFormatException e) {
                bbArticalState= 0;
                errorMsgs.add("請選擇發佈狀態");
            }
            Integer bmId = Integer.valueOf(req.getParameter("bmid").trim());

//            Part part=req.getPart("bbpic");
//            byte[] bbPic = part.getInputStream().readAllBytes();
//
            BulletinboardVO bulletinboardVO = new BulletinboardVO();

            bulletinboardVO.setBbClass(bbClass);
            bulletinboardVO.setBbTitle(bbTitle);
            bulletinboardVO.setBbContent(bbContent);
            bulletinboardVO.setBbPostdate(bbPostdate);
            bulletinboardVO.setBbUpdate(bbUpdate);
            bulletinboardVO.setBbArticalState(bbArticalState);
            bulletinboardVO.setBmId(bmId);

//            bulletinboardVO.setBbPic(bbPic);

            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                req.setAttribute("bulletinboardVO", bulletinboardVO);
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/bulletinboard/addBboard.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************2.開始新增資料***************************************/
            BulletinboardService bulletinboardSvc = new BulletinboardService();
            bulletinboardVO = bulletinboardSvc.addBulletinboard(bbClass, bbTitle,bbContent,
                    bbPostdate,bbUpdate,bbArticalState,bmId);

            /***************************3.新增完成,準備轉交(Send the Success view)***********/
            String url = "/back-end/bulletinboard/listAllBboard.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("delete".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數***************************************/
            Integer bbSubId = Integer.valueOf(req.getParameter("bbsubid"));

            /***************************2.開始刪除資料***************************************/
            BulletinboardService bulletinboardSvc = new BulletinboardService();
            bulletinboardSvc.deleteBulletinboard(bbSubId);

            /***************************3.刪除完成,準備轉交(Send the Success view)***********/
            String url = "/back-end/bulletinboard/listAllBboard.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);

        }

        //查詢類別
        if ("getClass".equals(action)) {

                /*==========1.接收請求參數==========*/
                String bbClass = req.getParameter("bbclass");

                /*==========2.查詢資料==========*/

                BulletinboardService bulletinboardSvc = new BulletinboardService();
                BulletinboardVO bulletinboardVO= bulletinboardSvc.findClass(bbClass);

                /***************************3.查詢完成,準備轉交(Send the Success view)*************/
                session.setAttribute("bulletinboardVO", bulletinboardVO);
                String url = "/front-end/bulletinboard/bbNewsClass.jsp";
                RequestDispatcher successView = req.getRequestDispatcher(url);
                successView.forward(req, res);
            }

        if ("getBbSelect".equals(action)) {
            String url = "/front-end/bulletinboard/bbNewsClass.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        }
}


