<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
    MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
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
    <!--    網址列標題-->
    <title>陪你e生e世　社區服務平台：住戶Home</title>
    <!-- !!固定!! 旁邊導覽列sidebar menu start (不是js動態產生的,放body)-->
    <script src="${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js"></script>
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

<!-- !!Home頁面 固定!!  navbar -->
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
        <h4><img src="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/back.svg" width="30" height="30" alt="返回"><a href="${pageContext.request.contextPath}/back-end/member/listAllMember.jsp">返回上一頁</a></h4>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">

                    <!-- 內頁排版section START -->
<%-- 錯誤表列 --%>
                    <c:if test="${not empty errorMsgs}">
                        <span style="color:red">請修正以下錯誤:</span>
                        <ul>
                            <c:forEach var="message" items="${errorMsgs}">
                            <li style="color:red">${message}</li>
                        </c:forEach>
                        </ul>
                    </c:if>

<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do" name="form1" enctype="multipart/form-data">
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">修改住戶資料</h3>
                    <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                    正在修改【住戶編號：${memberVO.memberId} 姓名：${memberVO.memberName}】住戶的資料

                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-auto">
                            <table>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶帳號:</td>
                                    <td><input type="TEXT" name="memberac" size="40" class="form-control"
                                               value="<%=memberVO.getMemberAc()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶密碼:</td>
                                    <td><input type="TEXT" name="memberpw" size="40" class="form-control"
                                               value="<%=memberVO.getMemberPw()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶姓名:</td>
                                    <td><input type="TEXT" name="membername" size="40" class="form-control"
                                               value="<%=memberVO.getMemberName()%>"/></td>
                                </tr>

                                <tr>
                                    <td>住戶暱稱:</td>
                                    <td><input type="TEXT" name="membernickname" size="40" class="form-control"
                                               value="<%=memberVO.getMemberNickname()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶性別:</td>
                                    <td>
                                        <select size="1" name="membersex" class="form-select">
                                            <option value="男性" <c:if test="${memberVO.memberSex==('男性')}">selected="selected"</c:if>>男性</option>
                                            <option value="女性" <c:if test="${memberVO.memberSex==('女性')}">selected="selected"</c:if>>女性</option>
                                            <option value="保留" <c:if test="${memberVO.memberSex==('保留')}">selected="selected"</c:if>>保留</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶棟號:</td>
                                    <td>
                                        <div class="form-floating">
                                        <input readonly type="TEXT" name="memberbuilding" size="40" class="form-control"
                                               value="<%=memberVO.getMemberBuilding()%>"/>
                                    <label for="floatingInput">棟別1位數+樓層2位數+戶號2位數=共5碼</label>
                                        </div>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶email:</td>
                                    <td>
                                        <div class="form-floating">
                                        <input type="TEXT" name="memberemail" size="40" class="form-control" id="floatingInput"
                                               value="<%=memberVO.getMemberEmail()%>"/>
                                    <label for="floatingInput">example@gmail.com</label>
                                    </div>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶手機:</td>
                                    <td><input type="TEXT" name="membermobile" size="40" class="form-control"
                                               value="<%=memberVO.getMemberMobile()%>"/></td>
                                </tr>

                                <tr>
                                    <td>住戶市話:</td>
                                    <td><input type="TEXT" name="membertel" size="40" class="form-control"
                                               value="<%=memberVO.getMemberTel()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>郵遞區號:</td>
                                    <td><input type="TEXT" name="memberpost" size="40" class="form-control"
                                               value="<%=memberVO.getMemberPost()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶住址:</td>
                                    <td><input type="TEXT" name="memberaddress" size="40" class="form-control"
                                               value="<%=memberVO.getMemberAddress()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶點數:</td>
                                    <td><input  type="TEXT" name="memberpoints" size="40" class="form-control"
                                               value="<%=memberVO.getMemberPoints()%>"/></td>
                                </tr>
                                	<tr>
                                        <td>住戶頭貼:<td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="200px">
                                		<input name="memberpic" class="form-control"  type="file" value="<%=memberVO.getMemberPic()%>"></td></td>
                                	</tr>
                               <tr>
                                    <td><span style="color: red; "><b>*</b></span>加入時間:</td>
                                    <td><input   name="regdate" id="f_date1" type="text" size="40" class="form-control"></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶身份別:</td>
                                    <td>
                                        <select  size="1" name="memberidstate" class="form-select">
                                            <option value="0" <c:if test="${memberVO.memberIdState==('0')}"> selected="selected"</c:if>>0:沒有住人</option>
                                            <option value="1" <c:if test="${memberVO.memberIdState==('1')}"> selected="selected"</c:if>>1:一般住戶</option>
                                            <option value="2" <c:if test="${memberVO.memberIdState==('2')}"> selected="selected"</c:if>>2:租客</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                   <td><span style="color: red; "><b>*</b></span>帳號狀態:</td>
                                    <td>
                                        <select size="1" name="acstate" class="form-select">
                                            <option value="0" <c:if test="${memberVO.acState==('0')}"> selected="selected"</c:if>>0:未啟用(Email未驗證)</option>
                                            <option value="1" <c:if test="${memberVO.acState==('1')}"> selected="selected"</c:if>>1:已啟用(Email已驗證)</option>
                                            <option value="2" <c:if test="${memberVO.acState==('2')}"> selected="selected"</c:if>>2:停權</option>
                                        </select>
                                       </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="memberid" value="<%=memberVO.getMemberId()%>"/>
                <input type="submit" class="btn btn-outline-primary" value="送出修改">
            </div>
        </section>
    </FORM>
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


<%--<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->--%>

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
        value: '<%=memberVO.getRegDate()%>', // value: new Date()
    });

</script>
</body>
</html>