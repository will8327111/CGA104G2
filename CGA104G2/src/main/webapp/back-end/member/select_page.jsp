<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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


<!-- !!Home頁面? 固定!! navbar -->
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

    <!-- 頁面 START!　　-->
    <div id="main-content">
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">

                        <h3>住戶資訊：住戶查詢專區</h3>
                        <p class="text-subtitle text-muted">查詢住戶資料</p>

                    </div>
                    <!--右上方標註目前在哪個頁面-->
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/back-end/web/backEndHomeMgr.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">住戶查詢</li>
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
                        <div class="form-group">
<%-- 錯誤表列 --%>
    <c:if test="${not empty errorMsgs}">
        <span style="color:red">搜尋錯誤如下:</span>
        <ul>
            <c:forEach var="message" items="${errorMsgs}">
                <li style="color:red">${message}</li>
            </c:forEach>
        </ul>
    </c:if>

          <div class="row">
              <div class="row-cols-md-10">
                              <li>
                                <div id="search-wrap">
                                <FORM role="search" METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>請輸入住戶編號 (如數字：1):</b>
                                    <input type="text" name="memberid" id="search-text">
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                                </div>
                            </li>
                  <jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService"/>

                            <li><FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>選擇住戶編號:</b>
                                    <select size="1" name="memberid" class="form-select">
                                        <c:forEach var="memberVO" items="${memberSvc.all}">
                                        <option value="${memberVO.memberId}">${memberVO.memberId}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>選擇住戶姓名:</b>
                                    <select size="1" name="memberid" class="form-select">
                                        <c:forEach var="memberVO" items="${memberSvc.all}">
                                        <option value="${memberVO.memberId}">${memberVO.memberName}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>選擇住戶棟號:
                                        <br>
                                        (如:A0101,"A~C棟1位數"+"樓層2位數"+幾號2位數"共5碼):
                                    </b>
                                    <select size="1" name="memberid" class="form-select">
                                        <c:forEach var="memberVO" items="${memberSvc.all}">
                                        <option value="${memberVO.memberId}">${memberVO.memberBuilding}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>
                     </div>
                 </div>
            </section>
              </div>
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