<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.member.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
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
</head>
    <!-- !!固定!! 旁邊導覽列sidebar menu start -->
<%--    <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js"></script>--%>
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
                    <a href='${pageContext.request.contextPath}/back-end/web/backEndHomeMgr.html'><img src='${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png' alt='Logo' srcset=''
                                                                          width='80%'></a>
                </div>
                <div class='sidebar-menu'>
                    <ul class='menu'>

                        <li class='sidebar-item  has-sub'>
                            <a href='#' class='sidebar-link'>
                                <i class='bi bi-person-badge-fill'></i>
                                <span>住戶資訊</span>
                            </a>
                            <ul class='submenu '>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/member/memberHome.jsp'>住戶管理</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/member/select_page.jsp'>住戶查詢</a>
                                </li>

                            </ul>
                        </li>

                        <li class='sidebar-item'>
                            <a href='${pageContext.request.contextPath}/back-end/mail/mailIndexBootStrap.html' class='sidebar-link'>
                                <i class='bi bi-clipboard-check'></i>
                                <span>郵件</span>
                            </a>
                        </li>

                        <li class='sidebar-item has-sub'>
                            <a href='#' class='sidebar-link'>
                                <i class='bi bi-calculator'></i>
                                <span>社區帳單</span>
                            </a>
                            <ul class='submenu '>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/member/bill.do?action=getAll'>帳單管理</a>
                                </li>
                            </ul>
                        </li>

                        <li class='sidebar-item  has-sub'>
                            <a href='#' class='sidebar-link'>
                                <i class='bi bi-calendar-check-fill'></i>
                                <span>公共設施</span>
                            </a>
                            <ul class='submenu '>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/ame/addAme.jsp'>新增公設</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/ame/controlAme.jsp'>公設管理</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='.html'>維修公設</a>
                                </li>
                            </ul>
                        </li>

                        <li class='sidebar-item  has-sub'>
                            <a href='#' class='sidebar-link'>
                                <i class='bi bi-spotify'></i>
                                <span>活動</span>
                            </a>
                            <ul class='submenu'>
                                <li class='submenu-item'>
                                    <a href='${pageContext.request.contextPath}/back-end/activity/management.html'>管理活動檢舉</a>
                                </li>
                                <li class='submenu-item'>
                                    <a href='${pageContext.request.contextPath}/back-end/activity/history.html'>檢舉紀錄</a>
                                </li>
                            </ul>
                        </li>

                        <li class='sidebar-item  has-sub'>
                            <a href='#' class='sidebar-link'>
                                <i class='bi bi-tools'></i>
                                <span>檢舉與維修服務</span>
                            </a>
                            <ul class='submenu '>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/privateReport/privateReportInfo.jsp'>住戶檢舉</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/maintenanceRecord/maintenanceRecordInfo.jsp'>住戶維修提報</a>
                                </li>
                            </ul>
                        </li>

                        <li class='sidebar-item'>
                            <a href='${pageContext.request.contextPath}/back-end/store/storeIndexBootStrap.html' class='sidebar-link'>
                                <i class='bi bi-pin-map-fill'></i>
                                <span>特約商店</span>
                            </a>
                        </li>

                        <li class='sidebar-item has-sub'>
                            <a href='.html' class='sidebar-link'>
                                <i class='bi bi-file-earmark-medical-fill'></i>
                                <span>管理員帳號與權限</span>
                            </a>
                            <ul class='submenu '>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/backstageAccount/listOneInfo.jsp'>我的資訊</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/backstageAccount/listAllInfo.jsp'>所有管理員資訊</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/backstageAuthorization/listOneAuthorization.jsp'>我的權限</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/backstageAuthorization/listAllAuthorization.jsp'>所有管理員權限功能</a>
                                </li>
                                <li class='submenu-item '>
                                    <a href='${pageContext.request.contextPath}/back-end/backstageCapabilities/listAllCapabilities.jsp'>權限功能列表</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    <!-- !!固定!! 旁邊導覽列sidebar menu end -->

<body>
<!-- !!固定!! 右上方 navbar end -->

<!-- !!Home頁面 固定!! navbar -->
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

    <!--        Home頁面 START-->
<ul>
        <h4><img src="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/back.svg" width="30" height="30" alt="返回"><a href="${pageContext.request.contextPath}/back-end/member/listAllMember.jsp">返回上一頁</a></h4>
    <div class="card text-center">
        <div class="card-header">
            <h3 class="card-title"></h3>
            【住戶編號：${memberVO.memberId} 姓名：${memberVO.memberName}】住戶的資料
        </div>
        <div class="card-body">
                    <div class="flex-row">
                        <table id="table03" >
                            <tr>
                                <th>住戶編號</th>
                                <th>帳號</th>
                                <th>密碼</th>
                                <th>住戶姓名</th>
                                <th>住戶暱稱</th>
                                <th>住戶性別</th>
                                <th>住戶棟別</th>
                                <th>住戶email</th>
                                <th>住戶手機</th>
                                <th>住戶市話</th>
                                <th>郵遞區號</th>
                                <th>住戶住址</th>
                                <th>住戶點數</th>
                                <th>住戶頭貼</th>
                                <th>加入時間</th>
                                <th>住戶身份別</th>
                                <th>帳號狀態</th>
                            </tr>
                            <tr>
                                <td>${memberVO.memberId}</td>
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
<%--                                 <td><img src="${pageContext.request.contextPath}/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td> --%>
                                <td>${memberVO.regDate}</td>
                                <td>${memberVO.memberIdState}</td>
                                <td>${memberVO.acState}</td>
                            </tr>
                        </table>

                            <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do"
                                  style="margin-bottom: 0px;">
                                <input type="submit" class="btn btn-outline-primary" value="修改資料">
                                <input type="hidden" name="memberid" value="${memberVO.memberId}">
                                <input type="hidden" name="action" value="getOne_For_Update">
                            </FORM>

                    </div>
                </div>
            </div>
        </section>
</ul>
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
</body>
</html>