<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ame.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
AmeService ameSvc = new AmeService();
List<AmeVO> list = ameSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>

<head>
 <meta charset="UTF-8">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!-- 防止搜索引擎索引及檢索 -->
    <meta name="robots" content="noindex,nofollow">

    <!-- !!固定!! 後台樣板 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css">

    <!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">
<!--=============================================================================================-->
<!--    需要用自己的css請放在這邊註解下方覆蓋 start -->



<!--    自己的css end-->

<!--    網址列標題-->
    <title>陪你e生e世　社區服務平台：後台Home</title>

</head>

<body>

<!-- !!固定!! 旁邊導覽列sidebar menu start (不是js動態產生的,放body)-->
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js"></script>
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

                                    <h3>後台管理 -HOME</h3>
                                    <p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：後台管理HOME</p>

                                </div>

                        <!--右上方標註目前在哪個頁面-->
                                <div class="col-12 col-md-6 order-md-2 order-first">
                                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="back-index.html">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Home Page</li>
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
	<table class="table">
		<tr>
			<th>編號</th>
			<th>名稱</th>
			<th>介紹</th>
			<th>圖片</th>
			<th>點數</th>
			<th>人數</th>
			<th>開放時段</th>
			<th>管理選項</th>
		</tr>

		<c:forEach var="ameVO" items="${list}">
			<tr>
				<td>${ameVO.ameId}</td>
				<td>${ameVO.ameName}</td>
				<td>${ameVO.ameIntroduce}</td>
				<td><img
					src="<%=request.getContextPath()%>/Amepho_Servlet?AME_ID=${ameVO.ameId}"
					width="200"></td>
				<td>${ameVO.amePoint}</td>
				<td>${ameVO.ameMax}</td>
				<td>${ameVO.ameOpening}</td>
				<td>
					<form METHOD="post" ACTION="ame.do" style="margin-bottom: 0px;">
						<input type="hidden" name="action" value="change"> 
						<input type="hidden" name="ameid" value="${ameVO.ameId}"> 
						<input type="submit" value="修改公設">
					</form> <br> <br>
					<form METHOD="post" ACTION="ame.do" style="margin-bottom: 0px;">
						 <input type="hidden" name="action" value="deleteAme">
						 <input type="hidden" name="ameid" value="${ameVO.ameId}"> 
					     <input type="submit" value="刪除公設">
					</form>
				</td>
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
                        <p>2022 &copy; 陪你e生e世　社區服務平台</p>
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
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/app.js"></script>
<!-- 樣板用js end -->
</body>

</html>