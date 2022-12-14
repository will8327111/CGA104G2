<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <!--    網址列標題-->
    <title>陪你e生e世　社區服務平台：住戶Home</title>
<!-- !!固定!! 旁邊導覽列sidebar menu start-->
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js"></script>
    <!-- !!固定!! 旁邊導覽列sidebar menu end -->
</head>

<body>
    <!-- !!固定!! 右上方 navbar end -->

    <!-- !!Home頁面 固定!!navbar -->
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

    <!-- 頁面 START!　網頁請從這邊以下開始修改，不需要此格式想用自己的請刪除~　-->
    <div id="main-content">
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>住戶資訊：住戶管理專區</h3>
                        <p class="text-subtitle text-muted">管理社區住戶及新增住戶資料。</p>
                    </div>
                <!--右上方標註目前在哪個頁面-->
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/back-end/web/backEndHomeMgr.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">住戶管理</li>
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
                    <div class="row">
                        <div class="col-md-auto">
                           <li>
                           <h5><a href="${pageContext.request.contextPath}/back-end/member/listAllMember.jsp">住戶管理(修改資料)</a></h5>
                           </li>

                           <li>
                            <h5><a href="${pageContext.request.contextPath}/back-end/member/addMember.jsp">住戶新增</a></h5>
                           </li>
                        </div>
                </div>
                </div>
            </div>

            </section>
        </div>
        </div>
            <!-- 網頁排版用section END -->

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

<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/app.js"></script>
<!-- 樣板用js end -->

</body>
</html>