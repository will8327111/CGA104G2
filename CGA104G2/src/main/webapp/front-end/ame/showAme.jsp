<%@page import="java.util.List"%>
<%@ page import="com.ame.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
AmeService ameSvc = new AmeService();
List<AmeVO> list = ameSvc.getAll();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html >

<head>
    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
<!-- <!--    禁止本地端快取--> 
   <Meta http-equiv="Pragma" Content="No-cache">
<!-- <!--    隱藏圖片下載-->
    <meta http-equiv="imagetoolbar" content="false">
    <meta name="keywords" content="">
<!--     定義為RWD web -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
<!--     最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<!--     =============Google Font =============== -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
<!--     !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

<!--     ==============css=============== -->
<!--     font awesome kit -->
    <script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
<!--     !!固定!! 前台樣式 -->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">
<!--     modaal -->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/modaal.min.css">

<!--     =============js============= -->
<!--     延遲載入 -->
    <script src="../../resources/front-end/assets/js/lazyload.min.js"></script>

<!--     ==============這邊放自己的 css=============== -->

<style>
 table { 
 	width: 1000px;
 	maxheight: 800px; 
 	background-color: white; 
 	margin-top: 5px; 
 	margin-left: 175px; 
 } 

 table, th, td { 
 	border: 1px solid lightgreen; 
 } 

 td { 
 	margin: center;
 	text-align: center; 
 } 
table, td, #img1{ 
object-fit: contain ;
maxwidth: 80%;
 } 
</style>

<!--     ==============css=============== -->
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

<!--!!固定!! 導覽列 start -->
            <nav id="pc-nav">
<!--!!固定!! logo -->
                <div>
                    <h1><a href="../../front-end/web/front-index2.html"><img src="../../resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
                </div>
            </nav>
             <ul>
                    <div>
                        <a href="showAme.jsp"><button class="cap" id="mylist" data-tippy-content="<div class='inner-cap'><p>回到公設首頁</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-house"></i><label style="font-size: 1rem;">公設首頁</label></button></a>
                    </div>
                </ul>
                <ul>
                    <div>
                        <a href="selectRecord.jsp"><button class="cap" id="mylist" data-tippy-content="<div class='inner-cap'><p>我預約的時段</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-table-list"></i><label style="font-size: 1rem;">我預約的公設</label></button></a>
                    </div>
                </ul>
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
<!-- 導覽列 end -->
        </header>

<!--!!固定!! 空白遮罩 -->
        <div style="width: 100%; height:100px;"></div>

<!--!!固定!! main area -->
        <div id="container">
            <main id="main-area">

<!--這邊往下新增 -->

<table>
		<tr>
			<th><h2>圖　　　示</h2></th>
			<th><h2>詳　　　解</h2></th>
		</tr>

		<c:forEach var="ameVO" items="${list}">
			<tr>
				<td><img src="<%=request.getContextPath()%>/Amepho_Servlet?AME_ID=${ameVO.ameId}" ></td>
				<td><font size="5" color="#005AB5">公設編號 : </font> <font size="5">${ameVO.ameId} </font><br>
				<font size="5" color="#005AB5">點數需求 : </font><font size="5" color="#CE0000">${ameVO.amePoint} </font><br>
				<font size="5" color="#005AB5">公設名稱 : </font><font size="5">${ameVO.ameName} </font><br>
				<font size="5" color="#005AB5">開放時段 : </font><font size="5" color="#CE0000">${ameVO.ameOpening} </font><br>
				<font size="5" color="#005AB5">公設介紹 : </font><font size="5">${ameVO.ameIntroduce} </font></td>
				<td>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/ame/ame_sta.do" style="margin-bottom: 0px;">
						<input type="hidden" name="action" value="doRecord">
						<input type="hidden" name="ameid" value="${ameVO.ameId}"> 
						<input type="submit" value="我要預約">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>


<!--main area end -->
            </main>
<!--             container -->
        </div>

<!--!!固定!! footer -->
        <footer id="footer">
<!--右上角menu -->
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
<!--            返回最上方小圖示 -->
            <p id="page-top"><a href="#">Top</a></p>
        </footer>
<!--         /wrapper -->
    </div>

<!--     =============JS =============== -->
<!--     jQuery -->
    <script src="../../resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
<!--     news tickerー -->
    <script src="../../resources/front-end/assets/js/jquery.bxslider.min.js"></script>
<!--     背景線延伸效果 -->
    <script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>
<!--     apang 動畫 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!--     Tippy -->
    <script src="https://unpkg.com/popper.js@1"></script>
    <script src="https://unpkg.com/tippy.js@5"></script>

<!--     other -->
    <script src="../../resources/front-end/assets/js/modaal.min.js"></script>
    <script src="../../resources/front-end/assets/js/script.js"></script>
    <script src="../../resources/front-end/assets/js/search_origin.js"></script>

</body>

</html>