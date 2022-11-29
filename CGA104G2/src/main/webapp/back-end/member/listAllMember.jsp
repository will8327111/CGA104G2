<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*" %>
<%@ page isELIgnored="false"%>

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list", list);
%>

<!--繁體中文-->
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!-- 防止搜索引擎索引及檢索 -->
    <meta name="robots" content="noindex,nofollow">

    <!-- !!固定!! 後台樣板 css start -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css">
    <!-- !!固定!! 後台樣板 css end -->

    <!-- favicon 網址列小圖示 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

    <!--    需要用自己的css請放在這邊註解下方覆蓋 start -->

    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/table-many.css" rel="stylesheet">

    <style>
        table{
            width: 100%;
            border-collapse: collapse;
        }
        table tr{
            border-bottom: solid 2px white;
        }
        table tr:last-child{
            border-bottom: none;
        }
        table th{
            position: relative;
            text-align: left;
            width: 20%;
            background-color: #b8ced1;
            color: white;
            text-align: center;
            padding: 0 0;
            /*z-index: 9999;*/
        }
        table td{
            text-align: left;
            width: 15%;
            text-align: center;
            background-color: #eee;
            padding: 10px 0;
        }
    </style>
    <!--    自己的css end-->
    <!--    網址列標題-->
    <title>陪你e生e世　社區服務平台：後台Home</title>
    <!-- !!固定!! 旁邊導覽列sidebar menu start -->
    <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js"></script>
    <!-- !!固定!! 旁邊導覽列sidebar menu end -->
</head>

<body>
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
                        <li class="nav-item dropdown me-1">
                            <a class="nav-link active dropdown-toggle text-gray-600" href="#" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <i class='bi bi-envelope bi-sub fs-4'></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                <li>
                                    <h6 class="dropdown-header">Mail</h6>
                                </li>
                                <li><a class="dropdown-item" href="#">No new mail</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown me-3">
                            <a class="nav-link active dropdown-toggle text-gray-600" href="#" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                <i class='bi bi-bell bi-sub fs-4'></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end notification-dropdown" aria-labelledby="dropdownMenuButton">
                                <li class="dropdown-header">
                                    <h6>Notifications</h6>
                                </li>
                                <li class="dropdown-item notification-item">
                                    <a class="d-flex align-items-center" href="#">
                                        <div class="notification-icon bg-primary">
                                            <i class="bi bi-cart-check"></i>
                                        </div>
                                        <div class="notification-text ms-4">
                                            <p class="notification-title font-bold">Successfully check out</p>
                                            <p class="notification-subtitle font-thin text-sm">Order ID #256</p>
                                        </div>
                                    </a>
                                </li>
                                <li class="dropdown-item notification-item">
                                    <a class="d-flex align-items-center" href="#">
                                        <div class="notification-icon bg-success">
                                            <i class="bi bi-file-earmark-check"></i>
                                        </div>
                                        <div class="notification-text ms-4">
                                            <p class="notification-title font-bold">Homework submitted</p>
                                            <p class="notification-subtitle font-thin text-sm">Algebra math homework</p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <p class="text-center py-2 mb-0"><a href="#">See all notification</a></p>
                                </li>
                            </ul>
                        </li>
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
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton" style="min-width: 11rem;">
                            <li>
                                <h6 class="dropdown-header">Hello!</h6>
                            </li>
                            <li><a class="dropdown-item" href="#"><i class="icon-mid bi bi-person me-2"></i> My
                                Profile</a></li>
                            <li><a class="dropdown-item" href="#"><i class="icon-mid bi bi-gear me-2"></i>
                                Settings</a></li>
                            <li><a class="dropdown-item" href="#"><i class="icon-mid bi bi-wallet me-2"></i>
                                Wallet</a></li>
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
    <!--            右上方 navbar end-->
    <!--            右上方 navbar end-->

    <!--        Home頁面 START-->
    <div id="main-content">
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>後台管理 -HOME</h3>
                        <p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：後台管理HOME</p>
                        <h4><a href="${pageContext.request.contextPath}/back-end/web/backEndHomeMgr.html"><img src="./images/back.svg" width="30" height="30" alt="返回">回首頁</a></h4>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Home Page</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
<%--                <div class="card">--%>
<%--                    <div class="card-header">--%>
<%--                        <h4 class="card-title"></h4>--%>
<%--                    </div>--%>
<%--                    <div class="card-body">--%>


<%--                        <table id="table-1">--%>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <h3>所有住戶資料</h3>--%>

<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </table>--%>


                        <ul>


                            <div class="card text-center">
                                <div class="card-header">
                                    <h3 class="card-title"></h3>
                                </div>

                                <div class="card-body">
                                    搜尋：<input type="search" class="table-filter" data-table="order-table" placeholder="請輸入關鍵字">
                                    <table id="table03" class="order-table">
                                        <tr>
                                            <th class="fixed head">編號</th>

                                            <th>帳號</th>
                                            <th>密碼</th>
                                            <th>姓名</th>
                                            <th>暱稱</th>
                                            <th>性別</th>
                                            <th>棟號</th>
                                            <th>信箱</th>
                                            <th>手機</th>
                                            <th>市話</th>
                                            <th>郵遞區號</th>
                                            <th>住址</th>
                                            <th>點數</th>
                                            <th>頭貼</th>
                                            <th>加入時間</th>
                                            <th>身份別</th>
                                            <th>帳號狀態</th>
                                            <th>修改</th>
                                            <th>刪除</th>

                                        </tr>

                                        <%@ include file="page1.file" %>
                                        <c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>"
                                                   end="<%=pageIndex+rowsPerPage-1%>">
                                            <tr>
                                                <th class="fixed head">${memberVO.memberId}</th>

                                                <td>${memberVO.memberAc}</td>
                                                <td>${memberVO.memberPw}</td>
                                                <td>${memberVO.memberName}</td>
                                                <td>${memberVO.memberNickname}</td>
                                                <td>${memberVO.memberSex}</td>
                                                <td>${memberVO.memberBuilding}</td>
                                                <td>${memberVO.memberEmail}</td>
                                                <td>${memberVO.memberMobile}</td>
                                                <td>${memberVO.memberTel}</td>
                                                <td>${memberVO.memberPost}</td>
                                                <td>${memberVO.memberAddress}</td>
                                                <td>${memberVO.memberPoints}</td>
                                                <td><img src="${pageContext.request.contextPath}/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>
                                                                                    <td>${memberVO.regDate}</td>
                                                                                    <td>${memberVO.memberIdState}</td>
                                                                                    <td>${memberVO.acState}</td>
                                                <td>
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do"
                                                          style="margin-bottom: 0px;">
                                                        <input type="submit" class="btn btn-outline-primary" value="修改">
                                                        <input type="hidden" name="memberid" value="${memberVO.memberId}">
                                                        <input type="hidden" name="action" value="getOne_For_Update">
                                                    </FORM>
                                                </td>

                                                <td>
                                                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do"
                                                          style="margin-bottom: 0px;">
                                                        <input type="submit" class="btn btn-outline-danger" value="刪除">
                                                        <input type="hidden" name="memberid" value="${memberVO.memberId}">
                                                        <input type="hidden" name="action" value="delete">
                                                    </FORM>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </ul>

                        <%@ include file="page2.file" %>

                    </div>
                </div>
            </section>
        </div>
        <!--        頁面 END-->


        <!--        !!固定!! footer(擺每個頁面最下方的版權用) START-->
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
<script src="../../resources/back-end/assets/js/bootstrap.js"></script>
<script src="../../resources/back-end/assets/js/app.js"></script>
<!-- 樣板用js end -->
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/search"></script>
</body>
</html>