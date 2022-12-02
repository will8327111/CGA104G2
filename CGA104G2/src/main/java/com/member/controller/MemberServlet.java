package com.member.controller;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.net.http.HttpClient;
import java.util.*;

import com.member.model.*;
import com.memberLogin.model.MemberLoginVO;


@WebServlet("/member/member.do")
@MultipartConfig(fileSizeThreshold=1024*1024*10,  // 10 MB
        maxFileSize=1024*1024*50,       // 50 MB
        maxRequestSize=1024*1024*100)    // 100 MB
public class MemberServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
//        Integer userId = 0;
        System.out.println(action);

        if ("getOne_For_Display".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);
            /*==========1.接收請求參數,輸入格式的錯誤處理==========*/
            String str = req.getParameter("memberid");
            if (str == null || (str.trim()).length() == 0) {
                errorMsgs.add("輸入值不可空白，請輸入住戶編號");
            }
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = req.
                        getRequestDispatcher("/back-end/member/select_page.jsp");
                failureView.forward(req, res);
                return;
            }
            Integer memberId = null;
            try {
                memberId = Integer.valueOf(str);
            } catch (Exception e) {
                errorMsgs.add("住戶編號格式不正確，請重新輸入");
            }
            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/member/select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            /*==========2.查詢資料==========*/
            MemberService memberSvc = new MemberService();
            MemberVO memberVO = memberSvc.getOneMember(memberId);
            if (memberVO == null) {
                errorMsgs.add("查無資料");
            }

            if (!errorMsgs.isEmpty()) {
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/member/select_page.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************3.查詢完成,準備轉交(Send the Success view)*************/
            req.setAttribute("memberVO", memberVO);
            String url = "/back-end/member/listOneMember.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("getOne_For_Update".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數****************************************/
            Integer memberId= Integer.valueOf(req.getParameter("memberid"));

            /***************************2.開始查詢資料****************************************/
            MemberService memberSvc = new MemberService();
            MemberVO memberVO = memberSvc.getOneMember(memberId);

            /***************************3.查詢完成,準備轉交(Send the Success view)************/
            req.setAttribute("memberVO", memberVO);
            String url = "/back-end/member/update_member_input.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
//修改
        if ("update".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
            Integer memberId = Integer.valueOf(req.getParameter("memberid").trim());

            String memberAc = req.getParameter("memberac");
            String memberAcReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,20}$";
            if (memberAc == null || memberAc.trim().length() == 0) {
                errorMsgs.add("帳號欄位請勿空白");
            } else if (!memberAc.trim().matches(memberAcReg)) {
                errorMsgs.add("帳號：至少一個字母和一個數字 , 且長度必需在6到20之間");
            }

            String memberPw = req.getParameter("memberpw").trim();
            String memberPwReg = "^(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,20}$";
            if (memberPw == null || memberPw.trim().length() == 0) {
                errorMsgs.add("密碼欄位請勿空白");
            } else if (!memberPw.trim().matches(memberPwReg)) {
                errorMsgs.add("密碼：至少一個大寫字母、和一個數字, 且長度必需在6到20之間：");
            }

            String memberName = req.getParameter("membername");
            String memberNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
            if (memberName == null || memberName.trim().length() == 0) {
                errorMsgs.add("姓名欄位請勿空白");
            } else if (!memberName.trim().matches(memberNameReg)) {
                errorMsgs.add("姓名欄位: 只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
            }

            String memberNickname = req.getParameter("membernickname");

            String memberSex = req.getParameter("membersex");
            if (memberSex == null || memberSex.length() == 0) {
                errorMsgs.add("請選擇性別欄位");
            }

            String memberBuilding = req.getParameter("memberbuilding");
            if (memberBuilding == null || memberBuilding.trim().length() == 0) {
                errorMsgs.add("棟別欄位請勿空白");
            }

            String memberEmail = req.getParameter("memberemail").trim();
            String memberEmailReg = "^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
            if (memberEmail == null || memberEmail.trim().length() == 0) {
                errorMsgs.add("email欄位請勿空白");
            } else if (!memberEmail.trim().matches(memberEmailReg)) {
                errorMsgs.add("請填入正確的email格式");
            }

            String memberMobile = req.getParameter("membermobile").trim();
            String memberMobileReg = "[0-9]{10}";
            if (memberMobile == null || memberMobile.trim().length() == 0) {
                errorMsgs.add("手機欄位請勿空白");
            } else if (!memberMobile.trim().matches(memberMobileReg)) {
                errorMsgs.add("請填入正確的手機格式");
            }

            String memberTel = req.getParameter("membertel").trim();

            String memberPost = req.getParameter("memberpost").trim();
            if (memberPost == null || memberPost.trim().length() == 0) {
                errorMsgs.add("郵遞區號欄位請勿空白");
            }

            String memberAddress = req.getParameter("memberaddress").trim();
            if (memberAddress == null || memberAddress.trim().length() == 0) {
                errorMsgs.add("地址欄位請勿空白");
            }

            Integer memberPoints = null;
            try {
                memberPoints = Integer.valueOf(req.getParameter("memberpoints").trim());
            } catch (NumberFormatException e) {
                memberPoints = 0;
                errorMsgs.add("請填入正確數字格式.");
            }

            java.sql.Date regDate = null;
            try {
                regDate = java.sql.Date.valueOf(req.getParameter("regdate").trim());
            } catch (IllegalArgumentException e) {
                regDate = new java.sql.Date(System.currentTimeMillis());
                errorMsgs.add("日期沒有輸入或是格式錯誤,請重新輸入!");
            }

            Integer memberIdState = Integer.valueOf(req.getParameter("memberidstate"));

            Integer acState = Integer.valueOf(req.getParameter("acstate"));

            Part part=req.getPart("memberpic");
            byte[] memberpic = part.getInputStream().readAllBytes();
            if(memberpic.length==0){
                MemberService memberSvc2 = new MemberService();
                memberpic=memberSvc2.getOneMember(memberId).getMemberPic();
            }

            MemberVO memberVO = new MemberVO();
            memberVO.setMemberId(memberId);
            memberVO.setMemberAc(memberAc);
            memberVO.setMemberPw(memberPw);
            memberVO.setMemberName(memberName);
            memberVO.setMemberNickname(memberNickname);
            memberVO.setMemberSex(memberSex);
            memberVO.setMemberBuilding(memberBuilding);
            memberVO.setMemberEmail(memberEmail);
            memberVO.setMemberMobile(memberMobile);
            memberVO.setMemberTel(memberTel);
            memberVO.setMemberPost(memberPost);
            memberVO.setMemberAddress(memberAddress);
            memberVO.setMemberPoints(memberPoints);
            memberVO.setMemberPic(memberpic);
            memberVO.setRegDate(regDate);
            memberVO.setMemberIdState(memberIdState);
            memberVO.setAcState(acState);

            if (!errorMsgs.isEmpty()) {
                req.setAttribute("memberVO", memberVO);
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/member/update_member_input.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************2.開始修改資料*****************************************/
            MemberService memberSvc = new MemberService();
            memberVO = memberSvc.updateMember(memberId,memberAc, memberPw, memberName, memberNickname,
                    memberSex, memberBuilding, memberEmail, memberMobile,
                    memberTel, memberPost, memberAddress, memberPoints,
                    regDate, memberIdState, acState,memberpic);

            /***************************3.修改完成,準備轉交(Send the Success view)*************/
            req.setAttribute("memberVO", memberVO);
            String url = "/back-end/member/listOneMember.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        //住戶修改
        if ("getUpdateProfile".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數****************************************/
            MemberLoginVO memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");
//            Integer memberId= Integer.valueOf(req.getParameter("memberid"));
            Integer memberId = memberLoginVO.getMemberId();

            /***************************2.開始查詢資料****************************************/
            MemberService memberSvc = new MemberService();
            MemberVO memberVO = memberSvc.getOneMember(memberId);

            /***************************3.查詢完成,準備轉交(Send the Success view)************/
            req.setAttribute("memberVO", memberVO);
            String url = "/front-end/member/updateProfile.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        //住戶修改
        if ("updateProfile".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
            MemberLoginVO  memberLoginVO = (MemberLoginVO)session.getAttribute("memberLoginVO");

//            Integer memberId = Integer.valueOf(req.getParameter("memberid").trim());
            Integer memberId = memberLoginVO.getMemberId();

            String memberAc = req.getParameter("memberac");
            String memberAcReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,20}$";
            if (memberAc == null || memberAc.trim().length() == 0) {
                errorMsgs.add("帳號欄位請勿空白");
            } else if (!memberAc.trim().matches(memberAcReg)) {
                errorMsgs.add("帳號：至少一個字母和一個數字 , 且長度必需在6到20之間");
            }

            String memberPw = req.getParameter("memberpw").trim();
            String memberPwReg = "^(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,20}$";
            if (memberPw == null || memberPw.trim().length() == 0) {
                errorMsgs.add("密碼欄位請勿空白");
            } else if (!memberPw.trim().matches(memberPwReg)) {
                errorMsgs.add("密碼：至少一個大寫字母、和一個數字, 且長度必需在6到20之間：");
            }

            String memberName = req.getParameter("membername");
            String memberNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
            if (memberName == null || memberName.trim().length() == 0) {
                errorMsgs.add("姓名欄位請勿空白");
            } else if (!memberName.trim().matches(memberNameReg)) {
                errorMsgs.add("姓名欄位: 只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
            }

            String memberNickname = req.getParameter("membernickname");

            String memberSex = req.getParameter("membersex");
            if (memberSex == null || memberSex.length() == 0) {
                errorMsgs.add("請選擇性別欄位");
            }

            String memberBuilding = req.getParameter("memberbuilding");
            if (memberBuilding == null || memberBuilding.trim().length() == 0) {
                errorMsgs.add("棟別欄位請勿空白");
            }

            String memberEmail = req.getParameter("memberemail").trim();
            String memberEmailReg = "^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
            if (memberEmail == null || memberEmail.trim().length() == 0) {
                errorMsgs.add("email欄位請勿空白");
            } else if (!memberEmail.trim().matches(memberEmailReg)) {
                errorMsgs.add("請填入正確的email格式");
            }

            String memberMobile = req.getParameter("membermobile").trim();
            String memberMobileReg = "[0-9]{10}";
            if (memberMobile == null || memberMobile.trim().length() == 0) {
                errorMsgs.add("手機欄位請勿空白");
            } else if (!memberMobile.trim().matches(memberMobileReg)) {
                errorMsgs.add("請填入正確的手機格式");
            }

            String memberTel = req.getParameter("membertel").trim();

            String memberPost = req.getParameter("memberpost").trim();
            if (memberPost == null || memberPost.trim().length() == 0) {
                errorMsgs.add("郵遞區號欄位請勿空白");
            }

            String memberAddress = req.getParameter("memberaddress").trim();
            if (memberAddress == null || memberAddress.trim().length() == 0) {
                errorMsgs.add("地址欄位請勿空白");
            }

            Integer memberPoints = null;
            try {
                memberPoints = Integer.valueOf(req.getParameter("memberpoints").trim());
            } catch (NumberFormatException e) {
                memberPoints = 0;
                errorMsgs.add("請填入正確數字格式.");
            }

            java.sql.Date regDate = null;
            try {
                regDate = java.sql.Date.valueOf(req.getParameter("regdate").trim());
            } catch (IllegalArgumentException e) {
                regDate = new java.sql.Date(System.currentTimeMillis());
                errorMsgs.add("日期沒有輸入或是格式錯誤,請重新輸入!");
            }

            Integer memberIdState = Integer.valueOf(req.getParameter("memberidstate"));

            Integer acState = Integer.valueOf(req.getParameter("acstate"));

            Part part=req.getPart("memberpic");
            byte[] memberpic = part.getInputStream().readAllBytes();
            if(memberpic.length==0){
                MemberService memberSvc2 = new MemberService();
                memberpic=memberSvc2.getOneMember(memberId).getMemberPic();
            }

            MemberVO memberVO = new MemberVO();
            memberVO.setMemberId(memberId);
            memberVO.setMemberAc(memberAc);
            memberVO.setMemberPw(memberPw);
            memberVO.setMemberName(memberName);
            memberVO.setMemberNickname(memberNickname);
            memberVO.setMemberSex(memberSex);
            memberVO.setMemberBuilding(memberBuilding);
            memberVO.setMemberEmail(memberEmail);
            memberVO.setMemberMobile(memberMobile);
            memberVO.setMemberTel(memberTel);
            memberVO.setMemberPost(memberPost);
            memberVO.setMemberAddress(memberAddress);
            memberVO.setMemberPoints(memberPoints);
            memberVO.setMemberPic(memberpic);
            memberVO.setRegDate(regDate);
            memberVO.setMemberIdState(memberIdState);
            memberVO.setAcState(acState);

            if (!errorMsgs.isEmpty()) {
                req.setAttribute("memberVO", memberVO);
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/front-end/member/updateProfile.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************2.開始修改資料*****************************************/
            MemberService memberSvc = new MemberService();
            memberVO = memberSvc.updateMember(memberId,memberAc, memberPw, memberName, memberNickname,
                    memberSex, memberBuilding, memberEmail, memberMobile,
                    memberTel, memberPost, memberAddress, memberPoints,
                    regDate, memberIdState, acState,memberpic);

            /***************************3.修改完成,準備轉交(Send the Success view)*************/
            req.setAttribute("memberVO", memberVO);
            System.out.println(memberVO);
            String url = "/front-end/member/updateProfileDone.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

//新增
        if ("insert".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
            String memberAc = req.getParameter("memberac").trim();
            String memberAcReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,20}$";
            if (memberAc == null || memberAc.trim().length() == 0) {
                errorMsgs.add("帳號欄位請勿空白");
            } else if (!memberAc.trim().matches(memberAcReg)) {
                errorMsgs.add("帳號：至少一個字母和一個數字 , 且長度必需在6到20之間");
            }

            String memberPw = req.getParameter("memberpw").trim();
            String memberPwReg = "^(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,20}$";
            if (memberPw == null || memberPw.trim().length() == 0) {
                errorMsgs.add("密碼欄位請勿空白");
            } else if (!memberPw.trim().matches(memberPwReg)) {
                errorMsgs.add("密碼：至少一個大寫字母、和一個數字, 且長度必需在6到20之間：");
            }

            String memberName = req.getParameter("membername").trim();
            if (memberName == null || memberName.trim().length() == 0) {
                errorMsgs.add("姓名欄位請勿空白");
            }

            String memberNickname = req.getParameter("membernickname").trim();

            String memberSex = req.getParameter("membersex");
            if (memberSex == null || memberSex.trim().length() == 0) {
                memberSex="請選擇性別";
                errorMsgs.add("請選擇性別");
            }

            String memberBuilding = req.getParameter("memberbuilding").trim();
            if (memberBuilding == null || memberBuilding.trim().length() == 0) {
                errorMsgs.add("棟別欄位請勿空白");
            }
            String memberEmail = req.getParameter("memberemail").trim();
            String memberEmailReg = "^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
            if (memberEmail == null || memberEmail.trim().length() == 0) {
                errorMsgs.add("email欄位請勿空白");
            } else if (!memberEmail.trim().matches(memberEmailReg)) {
                errorMsgs.add("請填入正確的email格式");
            }
            String memberMobile = req.getParameter("membermobile");
            String memberMobileReg = "[0-9]{10}";
            if (memberMobile == null || memberMobile.trim().length() == 0) {
                errorMsgs.add("手機欄位請勿空白");
            } else if (!memberMobile.trim().matches(memberMobileReg)) {
                errorMsgs.add("請填入正確的手機格式");
            }

            String memberTel = req.getParameter("membertel").trim();

            String memberPost = req.getParameter("memberpost").trim();
            if (memberPost == null || memberPost.trim().length() == 0) {
                errorMsgs.add("郵遞區號欄位請勿空白");
            }

            String memberAddress = req.getParameter("memberaddress").trim();
            if (memberAddress == null || memberAddress.trim().length() == 0) {
                errorMsgs.add("地址欄位請勿空白");
            }

            Integer memberPoints = null;
            try {
                memberPoints = Integer.valueOf(req.getParameter("memberpoints").trim());
            } catch (NumberFormatException e) {
                memberPoints = 0;
                errorMsgs.add("請填數字.");
            }

            java.sql.Date regDate = null;
            try {
                regDate = java.sql.Date.valueOf(req.getParameter("regdate").trim());
            } catch (IllegalArgumentException e) {
                regDate = new java.sql.Date(System.currentTimeMillis());
                errorMsgs.add("日期沒有輸入或是格式錯誤,請重新輸入!");
            }

            Integer memberIdState =null;
            try {
                memberIdState = Integer.valueOf(req.getParameter("memberidstate"));
            } catch (NumberFormatException e) {
                memberIdState = 1;
                errorMsgs.add("請選擇住戶身份別");
            }

            Integer acState=null;
            try {
                acState = Integer.valueOf(req.getParameter("acstate"));
            } catch (NumberFormatException e) {
                acState= 0;
                errorMsgs.add("請選擇帳號狀態");
            }

            Part part=req.getPart("memberpic");
            byte[] memberpic = part.getInputStream().readAllBytes();
//            if(memberpic.length==0){
//                errorMsgs.add("請輸入圖片!");
//            }

            MemberVO memberVO = new MemberVO();

            memberVO.setMemberAc(memberAc);
            memberVO.setMemberPw(memberPw);
            memberVO.setMemberName(memberName);
            memberVO.setMemberNickname(memberNickname);
            memberVO.setMemberSex(memberSex);
            memberVO.setMemberBuilding(memberBuilding);
            memberVO.setMemberEmail(memberEmail);
            memberVO.setMemberMobile(memberMobile);
            memberVO.setMemberTel(memberTel);
            memberVO.setMemberPost(memberPost);
            memberVO.setMemberAddress(memberAddress);
            memberVO.setMemberPoints(memberPoints);
            memberVO.setMemberPic(memberpic);
            memberVO.setRegDate(regDate);
            memberVO.setMemberIdState(memberIdState);
            memberVO.setAcState(acState);

            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                req.setAttribute("memberVO", memberVO);
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/back-end/member/addMember.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************2.開始新增資料***************************************/
            MemberService memberSvc = new MemberService();
            memberVO = memberSvc.addMember(memberAc, memberPw, memberName, memberNickname,
                    memberSex, memberBuilding, memberEmail, memberMobile,
                    memberTel, memberPost, memberAddress, memberPoints,
                    regDate, memberIdState, acState ,memberpic);

            /***************************3.新增完成,準備轉交(Send the Success view)***********/
            String url = "/back-end/member/listAllMember.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

        if ("delete".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();

            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數***************************************/
            Integer memberId = Integer.valueOf(req.getParameter("memberid"));

            /***************************2.開始刪除資料***************************************/
            MemberService memberSvc = new MemberService();
            memberSvc.deleteMember(memberId);

            /***************************3.刪除完成,準備轉交(Send the Success view)***********/
            String url = "/back-end/member/listAllMember.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);

        }

//        ======住戶登出======
        if ("memberLogOut".equals(action)) {
            session.invalidate();
            String url = "/front-end/memberLogin/memberLoginFinal.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }

    }
}
