<%@page import="com.maintenanceRecord.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.getAttribute("maintenanceRecordVO");
%>

<html>
<head>
<html lang="zh-Hant">

<head>
<meta charset="utf-8">
<title>社區業務管理系統-陪你e生e世</title>
<meta name="robots" content="noindex,nofollow">
<!--    隱藏圖片下載-->
<meta http-equiv="imagetoolbar" content="false">
<meta name="keywords" content="">
<!-- 定義為RWD web -->
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<!-- 最佳兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--=============Google Font ===============-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300&display=swap"
	rel="stylesheet">
<!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico"
	type="image/x-icon">

<!--==============css===============-->
<!--font awesome kit-->
<script src="https://kit.fontawesome.com/7e021e96db.js"
	crossorigin="anonymous"></script>
<!--!!固定!! 前台樣式-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css">

<link rel="stylesheet" type="text/css"
	href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/front-end/assets/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/front-end/assets/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/front-end/assets/css/parts.css">

<!--=============js=============-->
<!--延遲載入-->
<%--    <script src="${pageContext.request.contextPath}/resources/front-end/assets/js/lazyload.min.js"></script>--%>

<!--==============這邊放自己的 css===============-->
<style>
#vision .img {
	width: 50%;
	min-height: 500px;
	background:
		url("${pageContext.request.contextPath}/resources/front-end/assets/img/bb_board.jpg")
		no-repeat left;
	border-radius: 5px;
	background-size: cover;
}

@media screen and (max-width:768px) {
	#vision .img {
		width: 100%;
		min-height: 290px;
		margin: 0 0 50px 0;
	}
}
</style>

<!--==============css===============-->
<style>
/*!!固定!! 字形*/
@font-face {
	font-family: 'huninn';
	src:
		url('${pageContext.request.contextPath}/resources/front-end/assets/font/jf-openhuninn-1.1.ttf')
		format("truetype");
}

body {
	font-family: 'huninn', serif;
}
</style>

<style>
/*#header {*/
/*	border: 2px solid black;*/
/*	border-collapse: collapse;*/
/*}*/

/*#errorMsgs {*/
/*	text-align: center;*/
/*	font-size: 50px;*/
/*}*/
table, tr, th, td {
	/*border: 2px solid black;*/
	border-radius: inherit;
	scope: row;
}

form {
	margin: 0px;
	display: inline;
	padding: 10px;
}
</style>
</head>
<header id="header">

	<!--!!固定!! 導覽列 start-->
	<nav id="pc-nav">
		<!--!!固定!! logo-->
		<div>
			<h1>
				<a
					href="${pageContext.request.contextPath}/front-end/web/front-index2.html"><img
					src="${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png"
					alt="陪你e生e世　社區服務平台"
					style="width: 50%; display: flex; justify-content: flex-start; flex-direction: inherit;"></a>
			</h1>
		</div>
	</nav>
	<ul>
		<div id="login-div">
			<a href="#"><button class="cap" id="login"
					data-tippy-content="<div class='inner-cap'><p>住戶登入/登出。</p><p>社區住戶專用。</p></div>">
					<i style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i><label
						style="font-size: 1rem;"> 登出</label>
				</button></a>
		</div>
	</ul>
	<ul>
		<div id="out-div">
			<a href="#"><button class="cap" id="out"
					data-tippy-content="<div class='inner-cap'><p>住戶訊息通知。</p><p>檢視您的個人訊息。</p></div>">
					<i style="font-size: 1rem;" class="fa-solid fa-bell"></i><label
						style="font-size: 1rem;"> 通知</label>
				</button></a>
		</div>
	</ul>
	<!--導覽列 end-->
</header>

<!--!!固定!! 空白遮罩-->
<div id="cover"
	style="display: block; visibility: hidden; width: 100%; height: 100px; z-index: -1;"></div>
<body bgcolor="lightYellow">

	<!--!!固定!! main area-->
	<div id="container">
		<main id="main-area">


			<!--主要內容 start(從這邊開始改)-->


			<%--		<div >--%>
			<%--			<h1 id="test">您好，這裡是住戶檢舉頁面!</h1>--%>
			<%--		</div>--%>

			<div class="container">
				<div class="row align-items">

					<form method="get"
						action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do">
						<b>請選擇: </b> <select name="maintenanceStatus" class="form-list"
							style="box-sizing: border-box; width: 130px; border: 3px solid #ccc; border-radius: 5px;">
							<option value="1"
								${(maintenanceRecordVO.maintenanceStatus == 1) ? 'selected' : '' }>瀏覽已完成維修</option>
							<option value="0"
								${(maintenanceRecordVO.maintenanceStatus == 0) ? 'selected' : '' }>瀏覽未完成維修</option>
						</select> <input type="hidden" name="action" value="getAllSelected2"><input
							type="hidden" name="memberAc" value="${memberAc}"> <input
							type="submit" class="btn btn-outline-primary" value="確定">
					</form>

			<form method="get"
				action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do">
				<b> 依表單編號查詢: </b><input type="text" name="maintenanceId"
					style="box-sizing: border-box; width: 130px; border: 3px solid #ccc; border-radius: 5px;">
				<input type="hidden" name="memberAc" value="${memberAc}"> <input
					type="hidden" name="action" value="getOneMtById2"> <input
					type="submit" class="btn btn-outline-primary" value="送出">
			</form>
	</div>
	</div>

	<a
		href="<%=request.getContextPath()%>/front-end/maintenanceRecord/showMt.jsp">
		<button class="btn btn-outline-success" disabled>返回所有維修列表</button>
	</a>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do">
		<input type="hidden" name="action" value="toMaintain"><input
			type="hidden" name="memberAc" value="${memberAc}"> <input
			type="submit" value="我要提報維修" class="btn btn-outline-danger">
	</form>

	<br>
	<font color="red"><b>${errorMsgs}</b>

		<div id="cover"
			style="display: block; visibility: hidden; width: 100%; height: 50px; z-index: -1;"></div>

		<div align="center">
			<h3>我的維修提報列表</h3>
		</div>

		<div id='select'>
			<table class="table table-hover" id="reportTable">
				<tr>
					<th>編號</th>
					<th>住戶名稱</th>
					<th>時間</th>
					<th>表單內容</th>
					<th>內容附圖</th>
					<th>狀態</th>
					<th>回覆內容</th>
					<th>回覆內容附圖</th>
					<th>回覆時間</th>
				</tr>
				<tr>
					<td>${maintenanceRecordVO.maintenanceId}</td>
					<td>${maintenanceRecordVO.memberName}</td>
					<td>${maintenanceRecordVO.maintenanceTime}</td>
					<td>${maintenanceRecordVO.maintenanceContent}</td>
					<c:choose>
						<c:when test="${empty maintenanceRecordVO.maintenancePic}">
							<td>無附圖</td>
						</c:when>
						<c:otherwise>
							<td><img
								src="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenancePicServlet.do?action=showMemberPic&maintenanceId=${maintenanceRecordVO.maintenanceId}"
								style="width: 100px" /></td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${maintenanceRecordVO.maintenanceStatus == 1}">
							<td>已結案</td>
						</c:when>
						<c:otherwise>
							<td>未結案</td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${empty maintenanceRecordVO.replyOfMaintenance}">
							<td><font color="red"><b>管理員尚未回覆!</b></td>
						</c:when>
						<c:otherwise>
							<td>${maintenanceRecordVO.replyOfMaintenance}</td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when
							test="${(empty maintenanceRecordVO.replyPic) and maintenanceRecordVO.maintenanceStatus == 0}">
							<td><font color="red"><b>管理員尚未回覆!</b></td>
						</c:when>
						<c:when
							test="${(empty maintenanceRecordVO.replyPic) and maintenanceRecordVO.maintenanceStatus == 1}">
							<td>無附圖</td>
						</c:when>
						<c:otherwise>
							<td><img
								src="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenancePicServlet.do?action=showPic&maintenanceId=${maintenanceRecordVO.maintenanceId}"
								style="width: 200px" /></td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when
							test="${(empty maintenanceRecordVO.replyOfMaintenanceTime) and maintenanceRecordVO.maintenanceStatus == 0}">
							<td><font color="red"><b>管理員尚未回覆!</b></td>
						</c:when>
						<c:otherwise>
							<td>${maintenanceRecordVO.replyOfMaintenanceTime}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	</main>
	<!--main area end-->

	<!--container-->
	</div>

	<!--!!固定!! footer-->
	<footer id="footer">

		<!--右上角menu-->
		<div class="openbtn">
			<span></span><span>Menu</span><span></span>
		</div>
		<div id="g-nav">
			<div id="g-nav-list">
				<ul>
					<li><a href="../../front-end/web/front-index2.html"></a> <img
						src="../../resources/front-end/assets/img/logo11_trans3.png"
						alt="" style="width: 70%"></li>
					<li><a href="../../front-end/member/memberProfile.jsp">住戶資訊</a></li>
					<li><a href="../../front-end/bulletinboard/bbNews2.jsp">公佈欄</a></li>
					<li><a href="#">社區帳單</a></li>
					<li><a href="../../front-end/mail/mail.html">郵件</a></li>
					<li><a href="#">公共設施</a></li>
					<li><a href="../../front-end/activity/homepage3.html">活動</a></li>
					<li><a
						href="../../front-end/privateReport/privateReportIndex.jsp">檢舉與維修</a></li>
					<li><a href="../../front-end/store/store.html">特約商店</a></li>
				</ul>
			</div>
		</div>
		<p class="footer-logo">Community Management</p>
		<small> &copy; 2022 陪你e生e世 社區服務平台</small>
		<!--            返回最上方小圖示-->
		<p id="page-top">
			<a href="#">Top</a>
		</p>
	</footer>
	<!--/wrapper-->

	</div>

	<!--=============JS ===============-->
	<!--jQuery-->
	<script src="../../resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
	<!--news tickerー-->
	<script
		src="../../resources/front-end/assets/js/jquery.bxslider.min.js"></script>
	<!--背景線延伸效果-->
	<script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>
	<!--apang 動畫-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!--Tippy-->
	<script src="https://unpkg.com/popper.js@1"></script>
	<script src="https://unpkg.com/tippy.js@5"></script>

	<!--other-->
	<script src="../../resources/front-end/assets/js/modaal.min.js"></script>
	<script src="../../resources/front-end/assets/js/script.js"></script>
	<script src="../../resources/front-end/assets/js/search_origin.js"></script>

	<script src="../../resources/back-end/assets/js/bootstrap.js"></script>


</body>

</html>