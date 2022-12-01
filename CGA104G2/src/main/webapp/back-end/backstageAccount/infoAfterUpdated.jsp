<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
// BackstageAccountVO backstageAccountVO = (BackstageAccountVO) request
// 		.getAttribute("backstageAccountVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
 --%>

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
	href="../../resources/back-end/assets/css/main/app.css">

<!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
<link rel="shortcut icon"
	href="../../resources/back-end/assets/images/main/favicons/favicon2.ico"
	type="image/x-icon">
<!--=============================================================================================-->
<!--    需要用自己的css請放在這邊註解下方覆蓋 start -->



<!--    自己的css end-->

<!--    網址列標題-->
<title>陪你e生e世 社區服務平台：後台Home</title>

</head>

<body>
	<!-- !!固定!! 旁邊導覽列sidebar menu start (不是js動態產生的,放body)-->
	<script src="../../resources/back-end/assets/js/sidebar.js"></script>
	<!-- !!固定!! 旁邊導覽列sidebar menu end -->


	<!-- !!Home頁面? 固定!!  右上方放小鈴鐺+登出+通知等等的 navbar 使用的樣板格式(目前為假資料) -->
	<div id="main" class='layout-navbar'>
		<header class='mb-3'>
			<nav class="navbar navbar-expand navbar-light navbar-top">
				<div class="container-fluid">
					<a href="#" class="burger-btn d-block"> <i
						class="bi bi-justify fs-3"></i>
					</a>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mb-lg-0">
							<li class="nav-item dropdown me-1"><a
								class="nav-link active dropdown-toggle text-gray-600" href="#"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class='bi bi-envelope bi-sub fs-4'></i>
							</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="dropdownMenuButton">
									<li>
										<h6 class="dropdown-header">Mail</h6>
									</li>
									<li><a class="dropdown-item" href="#">No new mail</a></li>
								</ul></li>
							<li class="nav-item dropdown me-3"><a
								class="nav-link active dropdown-toggle text-gray-600" href="#"
								data-bs-toggle="dropdown" data-bs-display="static"
								aria-expanded="false"> <i class='bi bi-bell bi-sub fs-4'></i>
							</a>
								<ul
									class="dropdown-menu dropdown-menu-end notification-dropdown"
									aria-labelledby="dropdownMenuButton">
									<li class="dropdown-header">
										<h6>Notifications</h6>
									</li>
									<li class="dropdown-item notification-item"><a
										class="d-flex align-items-center" href="#">
											<div class="notification-icon bg-primary">
												<i class="bi bi-cart-check"></i>
											</div>
											<div class="notification-text ms-4">
												<p class="notification-title font-bold">Successfully
													check out</p>
												<p class="notification-subtitle font-thin text-sm">Order
													ID #256</p>
											</div>
									</a></li>
									<li class="dropdown-item notification-item"><a
										class="d-flex align-items-center" href="#">
											<div class="notification-icon bg-success">
												<i class="bi bi-file-earmark-check"></i>
											</div>
											<div class="notification-text ms-4">
												<p class="notification-title font-bold">Homework
													submitted</p>
												<p class="notification-subtitle font-thin text-sm">Algebra
													math homework</p>
											</div>
									</a></li>
									<li>
										<p class="text-center py-2 mb-0">
											<a href="#">See all notification</a>
										</p>
									</li>
								</ul></li>
						</ul>
						<div class="dropdown">
							<a href="#" data-bs-toggle="dropdown" aria-expanded="false">
								<div class="user-menu d-flex">
									<div class="user-name text-end me-3">
										<h6 class="mb-0 text-gray-600">管理員名</h6>
										<p class="mb-0 text-sm text-gray-600">Administrator</p>
									</div>
									<div class="user-img d-flex align-items-center">
										<div class="avatar avatar-md">
											<img src="">
										</div>
									</div>
								</div>
							</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuButton" style="min-width: 11rem;">
								<li>
									<h6 class="dropdown-header">Hello!</h6>
								</li>
								<li><a class="dropdown-item" href="#"><i
										class="icon-mid bi bi-person me-2"></i> My Profile</a></li>
								<li><a class="dropdown-item" href="#"><i
										class="icon-mid bi bi-gear me-2"></i> Settings</a></li>
								<li><a class="dropdown-item" href="#"><i
										class="icon-mid bi bi-wallet me-2"></i> Wallet</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#"><i
										class="icon-mid bi bi-box-arrow-left me-2"></i> Logout</a></li>
							</ul>
						</div>
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

							<h3>管理員資料修改</h3>
							<p class="text-subtitle text-muted">歡迎來到陪你e生e世
								服務平台：管理員資料修改完成頁面</p>

						</div>

						<!--右上方標註目前在哪個頁面-->
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="back-index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Home
										Page</li>
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
							<body>
								<h3>
									<font color="red"><b>[管理員資料修改完成!]
								</h3>
								<br>

								<form method="get"
									action="<%=request.getContextPath()%>/back-end/backstageAccount/listAllInfo.jsp">
									<div>
										<input type="submit" value="返回所有管理員資料列表">
									</div>
								</form>
								<br>
								<table class='table table_sm'>
									<tr>
										<th>管理員編號</th>
										<th>管理員姓名</th>
										<th>帳號</th>
										<th>密碼</th>
										<th>電子郵件</th>
										<th>帳號狀態</th>

									</tr>
									<tr>
										<td>${backstageAccountVO.bmId}</td>
										<td>${backstageAccountVO.bmName}</td>
										<td>${backstageAccountVO.bmAccount}</td>
										<td>${backstageAccountVO.bmPassword}</td>
										<td>${backstageAccountVO.bmEmail}</td>
										<td>${backstageAccountVO.bmStatus}</td>
									</tr>
								</table>

							</body>

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
	<script src="../../resources/back-end/assets/js/bootstrap.js"></script>
	<script src="../../resources/back-end/assets/js/app.js"></script>
	<!-- 樣板用js end -->
</body>

</html>