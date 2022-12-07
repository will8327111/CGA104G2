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
    <!-- !!固定!! 旁邊導覽列sidebar menu end -->
</head>

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
        <h4><img src="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/back.svg" width="30" height="30" alt="返回"><a href="${pageContext.request.contextPath}/back-end/member/memberHome.jsp">返回上一頁</a></h4>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">

            <!-- 內頁排版section START -->
<%-- 錯誤表列 --%>
                    <c:if test="${not empty errorMsgs}">
                        <span style="color:red">請重新輸入，並修正以下錯誤，謝謝。:</span>
                        <ul>
                            <c:forEach var="message" items="${errorMsgs}">
                                <li style="color:red">${message}</li>
                            </c:forEach>
                        </ul>
                    </c:if>

    <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do" name="form1" enctype="multipart/form-data" >
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <!--標題-->
                        <h4 class="card-title"></h4>
                        <h3>住戶帳號註冊</h3>
                    </div>
                    <!--內容區塊-->
                    <div class="card-body">
                        <div class="form-group">
                        <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-auto">
                                <table>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>帳號：</td>
                                        <td><input type="TEXT" name="memberac" size="40" class="form-control" required
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberAc()%>"/>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>密碼：</td>
                                        <td><input type="TEXT" name="memberpw" size="40" class="form-control" required
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberPw()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶姓名:</td>
                                        <td><input type="TEXT" name="membername" size="40"  class="form-control" required
                                                   value="<%= (memberVO==null)? "可魯" : memberVO.getMemberName()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>住戶暱稱:</td>
                                        <td><input type="TEXT" name="membernickname" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberNickname()%>" placeholder="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶性別:</td>
                                        <td>
                                            <select size="1" type="test" name="membersex" class="form-select" id="membersex">
                                                <option value="
                                                    <%= (memberVO== null)?"":memberVO.getMemberSex()%>">
                                                    <%=(memberVO== null)?"請選擇性別":memberVO.getMemberSex()%>
                                                </option>
                                                <option value="男性" >男性</option>
                                                <option value="女性" >女性</option>
                                                <option value="保留" >保留</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶棟號:</td>
                                        <td><div class="form-floating">
                                            <input type="TEXT" name="memberbuilding" size="40" class="form-control" required
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberBuilding()%>" />
                                            <label for="floatingInput">棟別A-C:1位數+樓層01-10:2位數+戶號01-04:2位數=共5碼</label>
                                        </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶email:</td>
                                        <td>
                                            <div class="form-floating">
                                                <input type="email" name="memberemail" size="40" class="form-control" id="floatingInput" required
                                                       value="<%= (memberVO==null)? "Karubero321@gmail.com" : memberVO.getMemberEmail()%>"/>
                                                <label for="floatingInput">example@gmail.com</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span style="color: red; "><b>*</b></span>住戶手機:</td>
                                        <td>
                                            <input type="TEXT" name="membermobile" size="40" class="form-control" required
                                                   value="<%= (memberVO==null)? "0921005456" : memberVO.getMemberMobile()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>住戶市話:</td>
                                        <td><input type="TEXT" name="membertel" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberTel()%>" placeholder=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>郵遞區號:</td>
                                        <td><input type="TEXT" name="memberpost" size="40" class="form-control"　required
                                                   value="<%= (memberVO==null)? "323" : memberVO.getMemberPost()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶住址:</td>
                                        <td><input type="TEXT" name="memberaddress" size="40" class="form-control" required
                                                   value="<%= (memberVO==null)? "桃園市中壢區" : memberVO.getMemberAddress()%>"/>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td><span style="color: red; "><b>*</b></span>住戶點數:</td>
                                        <td><input type="TEXT" name="memberpoints" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "50" : memberVO.getMemberPoints()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>住戶頭貼:</td>
                                        <td><input type="file" name="memberpic" class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>加入時間:</td>
                                        <td><input type="text" name="regdate" size="40" id="f_date1" class="form-control" readonly></td>
                                    </tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶身份別:</td>
                                    <td>
                                        <select size="1" name="memberidstate" class="form-select" id="memberidstate" readonly>
                                            <option value="0" >0</option>
                                            <option value="1" selected >1</option>
                                            <option value="2" >2</option>
                                        </select>
                                        <span>【身份別】0:沒有住人 | 1:一般住戶<span style="color: red; "><b>*</b></span>預設 | 2:租客</span>
                                    </td>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>帳號狀態:</td>
                                        <td>
                                            <select size="1" name="acstate" class="form-select" id="acstate" >
                                                <option value="0" selected>0</option>
                                                <option value="1" >1</option>
                                                <option value="2" >2</option>
                                            </select>
                                            <span>【狀態】0:未啟用(Email未驗證) <span style="color: red; "><b>*</b></span>預設 |1:已啟用(Email已驗證) |2:停權</span>
                                        </td>
                                    </tr>
                                </table>
                                <div style="height: 50px"></div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="myCheck"  name="remember" required>
                                    <label class="form-check-label" for="myCheck">我已確認以上資料正確無誤</label>
                                    <div class="valid-feedback">已勾選</div>
                                    <div class="invalid-feedback">請勾選上面的欄位，才能再進行送出新增，謝謝。</div>
                                </div>
                                <div id="msg" class="error"></div>
                                <input type="hidden" name="action" value="insert">
                                <input type="submit" class="btn btn-outline-primary" id="btn1"  value="送出新增">
                                </div>
                            </div>
                        </div>
                    </div>
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

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
<%
    java.sql.Date regDate = null;
    try {
        regDate = memberVO.getRegDate();
    } catch (Exception e) {
        regDate = new java.sql.Date(System.currentTimeMillis());
    }
%>
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
        timepicker: true,       //timepicker:true,
        step: 1,                //step: 60
        format: 'Y-m-d',         //format:'Y-m-d H:i:s',
        value: '<%=regDate%>', // value:   new Date(),

    });

</script>
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/app.js"></script>
</body>
</html>
