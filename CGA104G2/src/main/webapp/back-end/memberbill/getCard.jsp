<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.card.model.*"%>
<%@ page import="com.card.controller.*"%>

<%   List<CardVO> cardlist = (List) request.getAttribute("cardlist");%>


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
<link rel="stylesheet"
	href=${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css>

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

<!--    網址列標題-->
<title>陪你e生e世 社區服務平台：後台Home</title>

</head>

<body>
	<!-- !!固定!! 旁邊導覽列sidebar menu start -->
    <script src=${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js></script>
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
		<div id="main-content">
			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">

							<h3>刷卡管理</h3>
							<p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：刷卡管理</p>

						</div>

						<!--右上方標註目前在哪個頁面-->
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="http://localhost:8081/CGA104G2/member/bill.do?action=getAll">帳單管理</a></li>
									<li class="breadcrumb-item active" aria-current="page">刷卡管理</li>
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

						<body>
						<div class="card-body">
							<th>刷卡查詢頁面</th>
<!-- 							<table id="table-1" class="table table-borderless"> -->
<!-- 								<div style="width: 500px; display: flex; flex-wrap: nowrap;" > -->
<!-- 									<div style="width: 200px"> -->
<!-- 										<select name="" class="form-select"> -->
<!-- 											<option disabled selected>請選擇帳單月份</option> -->
<%-- <%-- 											<c:forEach var="vo2" items=""> --%> 
<!-- <!-- 												<option id="date" value=""></option> --> 
<%-- <%-- 											</c:forEach> --%> 
<!-- 										</select> -->
<!-- 									</div> -->

<!-- 									<div style="width: 50px; margin-left: 10px;"> -->
<!-- 										<input type="hidden" name="action" value="select_card"> -->
<!-- 										<input type="submit" value="查詢" class="btn btn-primary"> -->
<!-- 									</div> -->

<!-- 								</div> -->
<!-- 							</table> -->
							<table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>住戶編號</th>
                                        <th>住戶姓名</th>
                                        <th>帳單月份</th>
                                        <th>繳費狀態</th>
                                        <th>刷卡時間</th>
                                        <th>金額</th>
                                    </tr>
                                </thead>

                                <c:forEach var="CardVO" items="${cardlist}" varStatus="s" >
                                <tr>
                                    <td>${CardVO.memberId}</td>
                                    <td>${CardVO.memberName}</td>
                                    <td>${CardVO.billDate}</td>
<%--                                     <td>${CardVO.memberPay}</td> --%>
									<td>已繳費</td>
                                    <td>${CardVO.payDate}</td>
<%--                                     <td>${CardVO.billGroup}</td> --%>
									<td>NT $3000</td>
                                    
                                </tr>
                            </c:forEach>

							</table>
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
	<!-- 樣板用js end -->
    <script>
        let ed${s.count} = document.getElementById("edit${s.count}");
        let op${s.count} = document.getElementById("open${s.count}");
        ed${s.count}.addEventListener("click", function() {
            op${s.count}.disabled = false
        });
</script>
</body>
</html>