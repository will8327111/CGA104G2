<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bulletinboard.model.*" %>

<%
    BulletinboardVO bulletinboardVO = (BulletinboardVO) request.getAttribute("bulletinboardVO");
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
                <a href='${pageContext.request.contextPath}/back-end/web/index-test.html'><img src='${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png' alt='Logo' srcset=''
                                                                                               width='80%'></a>
            </div>
            <div class='sidebar-menu'>
                <ul class='menu'>


                    <li class='sidebar-item'>
                        <a href='#' class='sidebar-link'>
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
<ul class="form-group">
<tr>
    <td>
        <h3>公佈欄資料修改</h3>
        <br>
        <h4><a href="${pageContext.request.contextPath}/back-end/bulletinboard/listAllBboard.jsp"><img src="${pageContext.request.contextPath}/resources/front-end/assets/img/favicons/back.svg" width="30" height="30"
                                                                        alt="返回">回上一頁</a></h4>
    </td>
</tr>


<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do" name="form1" enctype="multipart/form-data">
         <div id="main-content">
            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">

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

                <%-- 錯誤表列 --%>
                <c:if test="${not empty errorMsgs}">
                    <span style="color:red">請修正以下錯誤:</span>
                    <ul>
                        <c:forEach var="message" items="${errorMsgs}">
                            <li style="color:red">${message}</li>
                        </c:forEach>
                    </ul>
                </c:if>
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <!--標題-->
                    <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                </div>
                <!--內容區塊-->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-auto">
                            <table>
                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄編號:</td>
                                    <td><%=bulletinboardVO.getBbSubId()%></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄類別:</td>
                                    <td><input type="TEXT" name="bbclass" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbClass()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄標題:</td>
                                    <td><input type="TEXT" name="bbtitle" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbTitle()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄內文:</td>
                                    <td><input type="text"  style="width:100%;height:100px ;" name="bbcontent" class="form-control"
                                           value="<%=bulletinboardVO.getBbContent()%>"/>

                                    </td>
                                    <td>
<%--                                        <div class="mb-3 mt-3">--%>
<%--                                            <label for="bbcontent">Comments:</label>--%>
<%--                                            <textarea class="form-control" rows="5" id="bbcontent" name="bbcontent"--%>
<%--                                                      value="<%=bulletinboardVO.getBbContent()%>"/></textarea>--%>
<%--                                        </div>--%>

                                </tr>
                                <tr>
                                    <td>公佈欄發佈日期:</td>
                                    <td><input type="TEXT" name="bbpostdate" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbPostdate()%>"/></td>
                                </tr>

                                <tr>
                                    <td>公佈欄更新日期:</td>
                                    <td><input type="TEXT" name="bbupdate" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbUpdate()%>"/></td>
                                </tr>

                                <tr>
                                    <td>公佈欄管理員:</td>
                                    <td>
                                        <select size="1" name="bmid" class="form-select">
                                        <option value="1" <c:if test="${bulletinboardVO.bmId==('1')}"> selected="selected"</c:if>>1:邱艾倫</option>

                                    </select>
                                    </td>
                                </tr>

                                <tr>
                                   <td><span style="color: red; "><b>*</b></span>公佈欄狀態:</td>
                                    <td>
                                        <select size="1" name="bbarticalstate" class="form-select">
                                            <option value="0" <c:if test="${bulletinboardVO.bbArticalState==('0')}"> selected="selected"</c:if>>0:下架</option>
                                            <option value="1" <c:if test="${bulletinboardVO.bbArticalState==('1')}"> selected="selected"</c:if>>1:上架</option>
                                        </select>
                                       </td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="bbsubid" value="<%=bulletinboardVO.getBbSubId()%>"/>
                <input type="submit" class="btn btn-outline-primary" value="送出修改">
            </div>
        </section>
    </div>
         </div>
</FORM>
    <%--         !!固定!! footer(擺每個頁面最下方的版權用) START --%>
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
    <%--               !!固定!! footer END--%>

<%--=========================================以下為 datetimepicker 之相關設定========================================== --%>

<link rel="stylesheet" type="text/css"
      href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css"/>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
    .xdsoft_datetimepicker .xdsoft_datepicker {
        width: 300px; /* width:  300px; */
    }

    .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
        height: 151px; /* height:  151px; */
    }
</style>

<script>
    $.datetimepicker.setLocale('zh');
    $('#f_date1').datetimepicker({
        theme: '',              //theme: 'dark',
        timepicker:true,       //timepicker:true,
        step: 1,                //step: 60
        format: 'Y-m-d',         //format:'Y-m-d H:i:s',
        value: '<%=bulletinboardVO.getBbUpdate()%>', // value: new Date()
    });

</script>

    <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/app.js"></script>

</body>
</html>