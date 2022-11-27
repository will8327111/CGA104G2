<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>
<%
Integer memid = (Integer) session.getAttribute("ID");
%>
<% MemberBillVO memberBillVO = (MemberBillVO) request.getAttribute("memberBillVO");%>
<%= (memberBillVO==null)? "true" : "false" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
<!--    禁止本地端快取-->
<!--    <Meta http-equiv="Pragma" Content="No-cache">-->
<!--    隱藏圖片下載-->
    <meta http-equiv="imagetoolbar" content="false">
    <meta name="keywords" content="">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!--=============Google Font ===============-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
    <!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

    <!--==============css===============-->
    <!--font awesome kit-->
    <script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
    <!--!!固定!! 前台樣式-->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">
    <!--modaal-->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/modaal.min.css">

    <!--=============js=============-->
    <!--延遲載入-->
    <script src="../../resources/front-end/assets/js/lazyload.min.js"></script>

    <!--==============這邊放自己的 css===============-->
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style>
h1 {
    font-size: 1.8rem;
}
.h2, h2 {
    font-size: 1.2rem;
}
.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1.5rem;
}
*, :after, :before {
    box-sizing: border-box;
}

div ,td{
    display: block;
    font-weight: bold;

}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #ced4da;
    border-radius: 0.35rem;
}
body {
    margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,Liberation Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: left;
    background-color: #fff;
}
.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1.5rem;
    border: 1px solid #ccd5ae;
    width: 50%;
    margin: auto;
    background: #d3d3d326;
    border-radius: 10px;
    border-style: dashed;
    
}
.dropzone.dz-clickable {
    cursor: pointer;
}
.img-uploader .dropzone {
    border-radius: 4px;
    border-color: #dcdcdc;
    color: #666;
    text-align: center;
    padding: 15px;
    background: #fdfdfd;
    border-style: dashed;
    box-shadow: inset 2px 7px 10px 0 rgb(0 0 0 / 3%);
}
.img-uploader .svg-icon {
    width: 50px;
    height: 50px;
    stroke-width: 0px;
    fill: #aaa;
}
.btn-danger {
    color: #fff;
    background-color: #8e9aaf;
    border-color: #8e9aaf;
}
.btn-check:focus+.btn-danger, .btn-danger:focus {
    color: #fff;
    background-color: #8e9aaf;
    border-color: #8e9aaf;
    box-shadow: 0 0 0 0.25rem #cbc0d3(225 83 97 / 50%);
}
.btn-primary {
    color: #fff;
    background-color: #0071e3;
    border-color: #0071e3;
}
</style>


    <!--==============css===============-->
    <style>
 /*!!固定!! 字形*/
        @font-face {
            font-family: 'huninn';
            src: url('../../resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype");
        }
        body {
            font-family: 'huninn',serif;
        }
    </style>
</head>


<body>
        <header id="header">

<!--!!固定!! 導覽列 start-->
            <nav id="pc-nav">
                <!--!!固定!! logo-->
                <div>
                    <h1><a href="../../front-end/web/front-index2.html"><img src="../../resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
                </div>
            </nav>
                <ul>
                    <div id="login-div" >
                        <a href="#"><button class="cap"  id="login" data-tippy-content="<div class='inner-cap'><p>住戶登入/登出。</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i><label style="font-size: 1rem;"> 登出</label></button></a>
                    </div>
                </ul>
            <ul>
                <div id="out-div" >
                    <a href="#"><button class="cap"  id="out" data-tippy-content="<div class='inner-cap'><p>住戶訊息通知。</p><p>檢視您的個人訊息。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-bell"></i><label style="font-size: 1rem;"> 通知</label></button></a>
                </div>
            </ul>
            <!--導覽列 end-->
        </header>

<!--!!固定!! 空白遮罩-->
        <div style="width: 100%; height:100px;"></div>

<!--!!固定!! main area-->
        <div id="container">
            <main id="main-area">


<!--主要內容 start(從這邊開始改)-->
<%-- <input type="hidden" value="${billGroup2}" name="billGroup"> --%>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="card-body" style="width:40%">
	<h3>銀行轉帳</h3>
	  <div id="bank-transfer-content" class="text-break">
		<p style="text-align: center;font-size:25px;text-decoration:underLine">
			<span>匯款帳號</span>
		</p>
		<p style="text-align: center;">
			<span style="color: rgb(71, 85, 119);">中國信託銀行(822) 桃園分行</span>
		</p>
		<p style="text-align: center;">
			<span style="color: rgb(71, 85, 119);">帳號 808123456789</span>
		</p>
		<p style="text-align: center;">
			<span style="color: rgb(71, 85, 119);">戶名 提拔Me</span>
		</p>
		<hr style="width:60%;margin: 2% auto;">
			<p style="text-align: center;">◎使用銀行轉帳付款方式</p>
		<p style="text-align: center;">務必在此頁面內回傳匯款明細/帳號後五碼</p>
		<p style="text-align: center;">對帳無誤則不另行通知，系統將更改為已付款
			<span><img style="width:5%;margin-bottom:5px" src="https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f60a.svg"></span> 
		</p>
	</div>
</div>
<div style="padding:0.2%;"></div>
	<div class="card-body" style="width:40%;">
		<h2>驗證您的付款狀態:</h2>
		<form method="post" action="<%=request.getContextPath()%>/member/ecpay" name="form2" enctype="multipart/form-data">
			<br>
				<div>
				
				
				<div class="img-uploader form-group">
				<div id="dropzone" class="dropzone dz-clickable" style="width:80%;height:30%;margin: auto auto 5% auto;">
				<div class="dz-default dz-message" style="padding-top:20px">
					<span>
						<svg class="svg-icon" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width:100px;height:100px" >
							<path d="M19.33,9.77A5.8,5.8,0,0,0,8.48,7.36a2.87,2.87,0,0,0-1.54-.44A2.92,2.92,0,0,0,4,9.82a4.16,4.16,0,0,0,1.49,8.05H9.12a.65.65,0,1,0,0-1.3H5.51a2.86,2.86,0,0,1-.65-5.65l.61-.14-.12-.62a1.66,1.66,0,0,1,0-.32,1.62,1.62,0,0,1,2.88-1l.72.88.4-1.07a4.51,4.51,0,0,1,8.73,1.57L18,11l.64,0a2.79,2.79,0,0,1-.11,5.57H14.69a.65.65,0,0,0,0,1.3h3.87a4.09,4.09,0,0,0,.77-8.1Z"></path>
							<path d="M11.93,21.32a.65.65,0,0,0,.65-.65V13.73l1.08,1.09a.7.7,0,0,0,.46.19.66.66,0,0,0,.46-.19.64.64,0,0,0,0-.92l-2.19-2.2h0l-.45-.46-.46.46h0l-2.2,2.2a.65.65,0,0,0,.92.92l1.09-1.09v6.94A.65.65,0,0,0,11.93,21.32Z"></path>
						</svg><br>
								<label for="file">上傳繳費收據:</label> 
								<input type="file" name="file" id="file" />
							</span>
						</div>
					</div>
				</div>
				
			<div>
			
			<jsp:useBean id="select2" class="com.memberbill.model.MemberBillService" />
			
			<!--  -->
			<!-- Example single danger button -->
			<div class="btn-group">
				  <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						請選擇帳單月份
				  </button>

			  <ul class="dropdown-menu" name="billDate">
				   <li>
					   <a class="dropdown-item" href="#" disabled selected value="memberBillId">
						   <c:forEach var="billDate" items="${list1}">
							<option  id="date" value="${billDate.memberBillId}">${billDate.billDate}</option>
						</c:forEach>
					</a>
				</li>
			  </ul>
			</div>
			<!--  -->
				
			<select name="billDate">
				<option disabled selected value="memberBillId">請選擇帳單月份</option>
				<c:forEach var="billDate" items="${list1}">
					<option  id="date" value="${billDate.memberBillId}">${billDate.billDate}</option>
				</c:forEach>
			</select>
			</div>
				<div>
					<jsp:useBean id="select" class="com.bank.model.BankService" />
					<span>匯款銀行:</span>
				
					<select name="bankId">
					<div class="btn-group">
						<option disabled selected value="請選擇銀行" type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						</option>
						<c:forEach var="BankVO" items="${select.all}">
							<option class="dropdown-item"  value="${BankVO.bankId}">${BankVO.bankId}|${BankVO.bankName}</option>
						</c:forEach>
						</div>
					</select>
				</div>
	
				<table>
				<!--  -->
				<td>請輸入後五碼:</td>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" class="form-control reference_id-input" id="reference_id-input" name="reference_id" placeholder="匯款後五碼" maxlength="255" style="width:30%">
							<label for="reference_id-input" type="TEXT" name="bankNumber" id="five"></label>
							
				<!--  -->			
<!-- 								<td>請輸入後五碼:</td> -->
<!-- 								<td><input type="TEXT" name="bankNumber" id="five" placeholder="請輸入後五碼"/></td> -->
						
						</div>
					</div>
				</table>
				
				<input type="hidden" value="${vo1.memberBillId}" name="memberBillId">
				<input type="hidden" name="action" value="insert">
				<input type="submit" value="提交" class="btn btn-primary">
			</div>
		</form>
	</div>


<!--main area end-->
            </main>
            <!--container-->
        </div>

<!--!!固定!! footer-->
        <footer id="footer">
<!--右上角menu-->
            <div class="openbtn"><span></span><span>Menu</span><span></span></div>
            <div id="g-nav">
                <div id="g-nav-list">
                    <ul>
                        <li><a href=""></a> <img src="../../resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
                        <li><a href="#">住戶帳號</a></li>
                        <li><a href="#">社區帳單</a></li>
                        <li><a href="#">郵件</a></li>
                        <li><a href="#">公共設施</a></li>
                        <li><a href="#">活動</a></li>
                        <li><a href="#">檢舉與維修</a></li>
                        <li><a href="#">特約商店</a></li>
                    </ul>
                </div>
            </div>
            <p class="footer-logo">Community Management</p>
            <small>2022 &copy; 陪你e生e世　社區服務平台</small>
<!--            返回最上方小圖示-->
            <p id="page-top"><a href="#">Top</a></p>
        </footer>
        <!--/wrapper-->
    </div>

    <!--=============JS ===============-->
    <!--jQuery-->
    <script src="../../resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
    <!--news tickerー-->
    <script src="../../resources/front-end/assets/js/jquery.bxslider.min.js"></script>
    <!--背景線延伸效果-->
    <script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>
    <!--apang 動畫-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!--Tippy-->
    <script src="https://unpkg.com/popper.js@1"></script>
    <script src="https://unpkg.com/tippy.js@5"></script>

    <!--other-->
    <script src="../../resources/front-end/assets/js/modaal.min.js"></script>
    <script src="../../resources/front-end/assets/js/script.js"></script>
    <script src="../../resources/front-end/assets/js/search_origin.js"></script>

</body>

</html>