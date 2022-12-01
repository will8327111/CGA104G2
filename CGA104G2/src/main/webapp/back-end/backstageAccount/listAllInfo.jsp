<%@page import="com.backstageAccount.model.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAccountService backstageAccountSvc = new BackstageAccountService();
List<BackstageAccountVO> list = backstageAccountSvc.getAll(); // 設定Account的getAll集合
pageContext.setAttribute("list", list);
%>
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

							<h3>所有管理員基本資料</h3>
							<p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：管理員基本資料</p>

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

<!-- 								<form method="get" -->
<%-- 									action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do"> --%>
<!-- 									<div> -->
<!-- 										<input type="hidden" name="action" value="BackstageLogOut"> -->
<!-- 										<input type="submit" value="登出" style="float: right"> -->
<!-- 									</div> -->
<!-- 								</form> -->

								<table id="backstageInfo" class='table table_sm'>
									<tr>
											<div>
												<FORM METHOD="get"
													ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/addInfo.jsp"
													style="margin-bottom: 0px;">
													<input type="submit" value="新增管理員" style="float: left">
													<input type="hidden" name="action" value="insert">
												</FORM>
											</div>
									</tr>
										<tr>
											<th>管理員編號</th>
											<th>管理員姓名</th>
											<th>帳號</th>
											<th>密碼</th>
											<th>電子郵件</th>
											<th>帳號狀態</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
											<c:forEach var="backstageAccountVO" items="${list}">
										<tr>
											<td>${backstageAccountVO.bmId}</td>
											<td>${backstageAccountVO.bmName}</td>
											<td>${backstageAccountVO.bmAccount}</td>
											<td>${backstageAccountVO.bmPassword}</td>
											<td>${backstageAccountVO.bmEmail}</td>
											<c:choose>
												<c:when test="${backstageAccountVO.bmStatus==0}">
													<td>停權</td>
												</c:when>
												<c:otherwise>
													<td>啟用中</td>
												</c:otherwise>
											</c:choose>
											<td>
												<FORM METHOD="get"
													ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do"
													style="margin-bottom: 0px;">
													<input id="modify" type="submit" value="修改"> <input
														type="hidden" name="bmId"
														value="${backstageAccountVO.bmId}"> <input
														type="hidden" name="action" value="getOne_For_Update">
												</FORM>
											</td>
											<td>
												<FORM METHOD="get"
													ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do"
													style="margin-bottom: 0px;">
													<input id="delete" type="submit" value="刪除"> <input
														type="hidden" name="bmId"
														value="${backstageAccountVO.bmId}"> <input
														type="hidden" name="action" value="delete">
												</FORM>
											</td>
										</tr>
									</c:forEach>
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