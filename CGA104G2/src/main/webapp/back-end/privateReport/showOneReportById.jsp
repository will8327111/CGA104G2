<%@page import="com.privateReport1.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
session.getAttribute("privateReportVO1");
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
<style>
th {
	white-space: nowrap;
}
;
</style>
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

							<h3>表單編號查詢檢舉頁面</h3>
							<p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：表單編號查詢檢舉頁面</p>

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
								<form method="get"
									action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
									<b>請選擇: </b> <select name="privateReportStatus">
										<option value="1"
											${(privateReportVO1.privateReportStatus == 1) ? 'selected' : '' }>瀏覽已完成檢舉</option>
										<option value="0"
											${(privateReportVO1.privateReportStatus == 0) ? 'selected' : '' }>瀏覽未完成檢舉</option>
									</select> <input type="hidden" name="action" value="getAllSelected">
									<input type="submit" value="確定">
								</form>

								<form method="get"
									action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
									<b> 依表單編號查詢: </b><input type="text" name="privateReportId">
									<input type="hidden" name="action" value="getOneReportById">
									<input type="submit" value="送出">
								</form>

								<form method="get"
									action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
									<b> 依住戶姓名查詢: </b><input type="text" name="memberName">
									<input type="hidden" name="action" value="getOneReportByName">
									<input type="submit" value="送出">
								</form>

								<a
									href="<%=request.getContextPath()%>/back-end/privateReport/privateReportInfo.jsp">
									<button>返回所有檢舉列表</button>
								</a>

								<div id='select'>
									<table id="reportTable" class='table table_sm'>
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
											<th>管理員回覆</th>
										</tr>
										<tr>
											<td>${privateReportVO1.privateReportId}</td>
											<td>${privateReportVO1.memberName}</td>
											<td>${privateReportVO1.privateReportTime}</td>
											<td>${privateReportVO1.privateReportContent}</td>
											<c:choose>
												<c:when test="${empty privateReportVO1.privateReportPic}">
													<td><b>無附圖</b></td>
												</c:when>
												<c:otherwise>
													<td><img
														src="<%=request.getContextPath()%>/back-end/privateReport1/privateReportPicServlet.do?action=showMemberPic&privateReportId=${privateReportVO1.privateReportId}"
														width="100px" /></td>
												</c:otherwise>
											</c:choose>

											<c:choose>
												<c:when test="${privateReportVO1.privateReportStatus == 1}">
													<td>已結案</td>
												</c:when>
												<c:otherwise>
													<td>未結案</td>
												</c:otherwise>
											</c:choose>

											<c:choose>
												<c:when test="${empty privateReportVO1.replyOfReport}">
													<td><font color="red"><b>管理員尚未回覆!</b></td>
												</c:when>
												<c:otherwise>
													<td>${privateReportVO1.replyOfReport}</td>
												</c:otherwise>
											</c:choose>

											<c:choose>
												<c:when
													test="${(empty privateReportVO1.replyPic) and privateReportVO1.privateReportStatus == 0}">
													<td><font color="red"><b>管理員尚未回覆!</b></td>
												</c:when>
												<c:when
													test="${(empty privateReportVO1.replyPic) and privateReportVO1.privateReportStatus == 1}">
													<td>無附圖</td>
												</c:when>
												<c:otherwise>
													<td><img
														src="<%=request.getContextPath()%>/back-end/privateReport1/privateReportPicServlet.do?action=showPic&privateReportId=${privateReportVO1.privateReportId}"
														width="300px" /></td>
												</c:otherwise>
											</c:choose>

											<c:choose>
												<c:when
													test="${(empty privateReportVO1.replyOfReportTime) and privateReportVO1.privateReportStatus == 0}">
													<td><font color="red"><b>管理員尚未回覆!</b></td>
												</c:when>
												<c:otherwise>
													<td>${privateReportVO1.replyOfReportTime}</td>
												</c:otherwise>
											</c:choose>

											<c:choose>
												<c:when test="${not empty privateReportVO1.replyOfReport}">
													<td><input type="submit" value="管理員回覆"
														disabled="disabled"></td>
												</c:when>
												<c:otherwise>
													<td>
														<form method="get"
															action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
															<input type="hidden" name="privateReportId"
																value="${privateReportVO1.privateReportId}"> <input
																type="submit" value="管理員回覆"> <input
																type="hidden" name="memberId"
																value="${privateReportVO1.memberId}"><input
																type="hidden" name="action" value="getOne_For_Update">
														</form>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>
								</div>

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