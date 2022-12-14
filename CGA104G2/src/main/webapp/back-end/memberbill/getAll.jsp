<%@page import="com.memberbill.model.MemberBillService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>


<%
MemberBillService memSvc  = new  MemberBillService();
List<MemberBillVO> list = memSvc.getAll();
pageContext.setAttribute("list", list); 

//List<MemberBillVO> list2 = (List) request.getAttribute("list");
//pageContext.setAttribute("list", list); 
%>
<!DOCTYPE html>
<!--繁體中文-->
<html lang="zh-Hant">

<head>

<meta charset="UTF-8">
<!-- 定義為RWD web -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 最佳兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- 防止搜索引擎索引及檢索 -->
<meta name="robots" content="noindex,nofollow">

<!-- !!固定!! 後台樣板 css -->
<link rel="stylesheet" href=${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css>

<!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
<link rel="shortcut icon"
	href=${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico
	type="image/x-icon">
<!--=============================================================================================-->
<!--    需要用自己的css請放在這邊註解下方覆蓋 start -->
<meta charset="UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- favicon 網址列小圖示 -->
    <link rel="shortcut icon" href=${pageContext.request.contextPath}resources/back-end/assets/images/main/favicons/favicon2.ico type="image/x-icon">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
</style>
<head>
<meta>
<!--    自己的css end-->
	<!-- !!固定!! 旁邊導覽列sidebar menu start -->
    	<script src=${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar2.js></script>
    <!-- !!固定!! 旁邊導覽列sidebar menu end -->
<!--    網址列標題-->
<title>陪你e生e世 社區服務平台：後台Home</title>

</head>

<body>
	<!-- !!固定!! 旁邊導覽列sidebar menu start (不是js動態產生的,放body)-->

	<!-- !!固定!! 旁邊導覽列sidebar menu end -->
	

	<!-- !!Home頁面? 固定!!  右上方放小鈴鐺+登出+通知等等的 navbar -->
    <div id="main" class='layout-navbar'>
        <header class='mb-3'>
            <nav class="navbar navbar-expand navbar-light navbar-top">
                <div class="container-fluid">
                    <a href="#" class="burger-btn d-block">
                        <i class="bi bi-justify fs-3"></i>
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-lg-0">
                        <li><a class="dropdown-item" href="#">
                            <i  class="bi-sub fs-4 bi bi-box-arrow-left"></i> Logout</a>
                        </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </header>
        <!-- !!固定!! 右上方 navbar end -->

    <!-- 頁面 START!　網頁請從這邊以下開始修改，不需要此格式想用自己的請刪除 ~　-->


		<!-- 頁面 START!　網頁請從這邊以下開始修改，不需要此格式想用自己的請刪除 ~　-->
		<div id="main-content">
			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">

							<h3>帳單管理</h3>
							<p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：帳單管理</p>

						</div>

						<!--右上方標註目前在哪個頁面-->
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="back-index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">帳單管理</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				<!-- 內頁排版section(會直接套用RWD效果) START -->
				<section class="section">
					<div class="card">
						<div class="card-header">
							<!--標題-->
							<h4 class="card-title"></h4>
						</div>
						<!--內容區塊-->
						<div class="card-body">
							<form method="post" action="<%=request.getContextPath() %>/member/bill.do" name="form2"
								enctype="multipart/form-data">
								<th>所有帳單資料</th>
								<table id="table-1" class="table table-hover">
									<div style="width: 500px; display: flex; flex-wrap: nowrap;">
										<div style="width: 200px">
											<select name="billDate2" class="form-select">
												<option disabled selected>請選擇帳單月份</option>
												<c:forEach var="vo2" items="${vo2}">
													<option id="date" value="${vo2}">${vo2}</option>
												</c:forEach>
											</select>
										</div>
										<div style="width: 200px; margin-left: 10px;">
											<select name="memberPayMethod" class="form-select">
												<option disabled selected>請選擇繳費方式</option>
												<option value="0">匯款</option>
												<option value="1">刷卡</option>
											</select>
										</div>
										<div style="width: 50px; margin-left: 10px;">
											<input type="hidden" name="action" value="select_Transfer">
											<input type="submit" value="查詢" class="btn btn-primary">
										</div>

									</div>
								</table>
							</form>

							<table class="table table-hover">
								<thead>
									<tr>
										<th>住戶帳單編號</th>
										<th>住戶編號</th>
										<th>住戶姓名</th>
										<th>帳單日期</th>
										<th>繳費狀態</th>
<!-- 										<th>繳費日期</th> -->
										<th>繳費期限</th>
										<th>繳費方式</th>
										<th>修改人員</th>
										<th>修改時間</th>
<!-- 										<th>上傳證明</th> -->
									</tr>
								</thead>
								<%@ include file="page1MemberBill.file" %>
								<c:forEach var="memberBillVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
									<tr>
										<td>${memberBillVO.memberBillId}</td>
										<td>${memberBillVO.memberId}</td>
										<td>${memberBillVO.memberName}</td>
										<td>${memberBillVO.billDate}</td>
										<td>${memberBillVO.memberPay}</td>
<%-- 										<td>${memberBillVO.memberPayDate}</td> --%>
<%-- 										<td>${memberBillVO.memberPayLimit}</td> --%>
										<td>2023-01-31</td>
										<td>${memberBillVO.memberPayMethod}</td>
<%-- 										<td>${memberBillVO.modifyUser}</td> --%>
										<td>Scheduler</td>
										<td>${memberBillVO.modifyDate}</td>
										<!-- <%-- 				<td>${memberBillVO.memberPhoto} --%> -->
<!-- 										<td><img -->
<%-- 											src="${pageContext.request.contextPath}/member/bill.do?action=memberphoto&memberBillId=${memberBillVO.memberBillId}" --%>
<!-- 											width="160px" hight="200px"></td> -->
									</tr>
									
								</c:forEach>
							</table>
							<%@ include file="page2MemberBill.file"%>
						</div>
					</div>
				</section>
				<!-- 網頁排版用section END -->

			</div>
			<!-- 整頁page end -->


			<!-- !!固定!! footer(擺每個頁面最下方的版權用) START -->
			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2022 &copy; 陪你e生e世 社區服務平台</p>
					</div>
					<div class="float-end">
						<p>Community Management</p>
					</div>
				</div>
			</footer>
			<!--        !!固定!! footer END-->
		</div>
	</div>


	<!-- 樣板用js start -->
	<script
		src=${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js></script>
	<script
		src=${pageContext.request.contextPath}/resources/back-end/assets/js/app.js></script>
	<!-- !!固定!! 後台樣板 css -->
   	<link rel="stylesheet" href=${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css>
	<!-- 樣板用js end -->
</body>

</html>