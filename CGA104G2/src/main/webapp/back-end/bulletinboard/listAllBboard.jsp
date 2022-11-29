<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bulletinboard.model.*" %>
<%@ page import="com.bulletinboardpic.model.*" %>
<%@ page isELIgnored="false"%>

<%
    BulletinboardService bulletinboardSvc = new BulletinboardService();
    List<BulletinboardVO> list = bulletinboardSvc.getAll();
    pageContext.setAttribute("list", list);
%>
<%
    BulletinBoardPicService bulletinBoardPicSvc = new BulletinBoardPicService();
    List<BulletinBoardPicVO> list2 = bulletinBoardPicSvc.getAllPic();
    pageContext.setAttribute("list2", list2);
%>

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
    <title>陪你e生e世　社區服務平台：公佈欄Home</title>

</head>
<body>
<%-- !!固定!! 旁邊導覽列sidebar menu start--%>

<div id='app'>
    <div id='sidebar' class='active' >
        <div class='sidebar-wrapper active'>
            <div class='sidebar-header position-relative'>
                <div class='d-flex justify-content-between align-items-center '>

                    <div class='sidebar-toggler  x'>
                        <a href='#' class='sidebar-hide d-xl-none d-block'><i class='bi bi-x bi-middle'></i></a>
                    </div>
                </div>
            </div>
            <div class='logo'>
                <a href='${pageContext.request.contextPath}/back-end/bulletinboard/bb_select_page.jsp'><img src='${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png' alt='Logo' srcset=''
                                                                                                            width='80%'></a>
            </div>
            <div class='sidebar-menu'>
                <ul class='menu'>


                    <li class='sidebar-item'>
                        <a href='${pageContext.request.contextPath}/back-end/bulletinboard/bb_select_page.jsp' class='sidebar-link'>
                            <i class='bi bi-clipboard-check'></i>
                            <span>公佈欄</span>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </div>


    <%--     !!固定!! 右上方 navbar end --%>

    <%--    !!Home頁面 固定!!navbar--%>
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

                            <h3>後台管理 -公佈欄</h3>
                            <p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：後台 公佈欄管理HOME</p>

                        </div>
                        <!--右上方標註目前在哪個頁面-->
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/back-end/bulletinboard/bb_select_page.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">公佈欄</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

<ul>
    <section class="section">
        <div class="card">
             <div class="card-header">
                    <h3 class="card-title">目前公佈欄文章</h3>
                </div>
                <div class="card-body overflow-auto">
                        <table class="table table-sm table-striped table-hover">
                            <tr>

                                <th>公佈欄編號</th>
                                <th>公佈欄項目類別</th>
                                <th>標題</th>
<%--                                <th>文章內容</th>--%>
                                <th>發佈日期</th>
                                <th>更新日期</th>
<%--                                <th>公佈欄圖</th>--%>
                                <th>發佈狀態</th>
                                <th>公佈欄管理員編號</th>

                                <th>修改</th>
                                <th>刪除</th>

                            </tr>

                            <%@ include file="bbPage.file" %>
                            <c:forEach var="bulletinboardVO" items="${list}" begin="<%=pageIndex%>"
                                       end="<%=pageIndex+rowsPerPage-1%>">
                                <tr>
                                    <td>${bulletinboardVO.bbSubId}</td>
                                    <td>${bulletinboardVO.bbClass}</td>
                                    <td>${bulletinboardVO.bbTitle}</td>
<%--                                    <td>${bulletinboardVO.bbContent}</td>--%>
                                    <td>${bulletinboardVO.bbPostdate}</td>
                                    <td>${bulletinboardVO.bbUpdate}</td>
                                    <td>${bulletinboardVO.bbArticalState}</td>
                                    <td>${bulletinboardVO.bmId}</td>

<%--                                    <td><img src="<%=request.getContextPath()%>/bulletinboardpic/BulletinBoardPicServlet?bbpicid=${bulletinboardpicVO.bbPicId}" width="150px" class="rounded"></td>--%>

                                    <td>
                                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do"
                                              style="margin-bottom: 0px;">
                                            <input type="submit" class="btn btn-outline-primary" value="修改">
                                            <input type="hidden" name="bbsubid" value="${bulletinboardVO.bbSubId}">
                                            <input type="hidden" name="action" value="getOneBb_For_Update">
                                        </FORM>
                                    </td>

                                    <td>
                                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do"
                                              style="margin-bottom: 0px;">
                                            <input type="submit" class="btn btn-outline-danger" disabled value="刪除">
                                            <input type="hidden" name="bbsubid" value="${bulletinboardVO.bbSubId}">
                                            <input type="hidden" name="action" value="delete">
                                        </FORM>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
    </section>
</ul>

<%@ include file="bbPage2.file" %>
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
                <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js"></script>
                <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/app.js"></script>
                <!-- 樣板用js end -->
</body>
</html>