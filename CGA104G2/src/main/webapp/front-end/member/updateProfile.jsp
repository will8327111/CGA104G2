<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
    MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>個人資料修改</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">

    <style>
         .form-pass input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
         #checkEye {
             position: absolute;
             top: 50%;
             right: 10px;
             transform: translateY(-50%);
         }

    </style>
</head>

<body>
<ul class="form-group">
    <tr>
        <td>
            <h3>個人資料修改</h3>
            <h5><a href="${pageContext.request.contextPath}/front-end/member/memberProfile.jsp"><img src="${pageContext.request.contextPath}/resources/front-end/assets/img/favicons/back.svg" width="25" height="25"
                                                                                                           alt="返回">回上一頁</a></h5>
        </td>
    </tr>

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
        <div class="page-content">
            <section class="section">
                <div class="card">
                    <div class="card-header">

                        <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-auto">
                                <table>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>帳號:</td>
                                        <td><input type="TEXT" name="memberac" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberAc()%>"/></td>
                                    </tr>

                                    <tr>
                                        <div class="form-pass">
                                        <td><span style="color: red; "><b>*</b></span>密碼:</td>
                                        <td>
                                            <div class="form-floating">
                                            <input type="password" name="memberpw" size="40" class="form-control" id="floatingPassword" placeholder="Password"
                                                   value="<%=memberVO.getMemberPw()%>"/>
                                            <label for="floatingPassword">請輸入密碼</label>
                                            <i id="checkEye" class="fas bi-eye-fill"></i>
                                            </div>
                                        </td>
                                        </div>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>姓名:</td>
                                        <td><input type="TEXT" name="membername" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberName()%>"/></td>
                                    </tr>

                                    <tr>
                                        <td>暱稱:</td>
                                        <td><input type="TEXT" name="membernickname" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberNickname()%>"/></td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>性別:</td>

                                        <td>
                                            <select size="1" name="membersex" class="form-select">
                                                <option value="男性" <c:if test="${memberVO.memberSex==('男性')}">selected="selected"</c:if>>男性</option>
                                                <option value="女性" <c:if test="${memberVO.memberSex==('女性')}">selected="selected"</c:if>>女性</option>
                                                <option value="保留" <c:if test="${memberVO.memberSex==('保留')}">selected="selected"</c:if>>保留</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr style="display: none">
                                        <td><span style="color: red; "><b>*</b></span>住戶棟號:</td>
                                        <td>
                                            <div class="form-floating">
                                                <input readonly type="TEXT" name="memberbuilding" size="40" class="form-control"
                                                       value="<%=memberVO.getMemberBuilding()%>"/>
                                                <label for="floatingInput">棟別1位數+樓層2位數+戶號2位數=共5碼</label>
                                            </div>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>email:</td>
                                        <td>
                                            <div class="form-floating">
                                                <input type="TEXT" name="memberemail" size="40" class="form-control" id="floatingInput"
                                                       value="<%=memberVO.getMemberEmail()%>"/>
                                                <label for="floatingInput">example@gmail.com</label>
                                            </div>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>手機:</td>
                                        <td><input type="TEXT" name="membermobile" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberMobile()%>"/></td>
                                    </tr>

                                    <tr>
                                        <td>市話:</td>
                                        <td><input type="TEXT" name="membertel" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberTel()%>"/></td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>郵遞區號:</td>
                                        <td><input type="TEXT" name="memberpost" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberPost()%>"/></td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住址:</td>
                                        <td><input type="TEXT" name="memberaddress" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberAddress()%>"/></td>
                                    </tr>

                                    <tr style="display: none">
                                        <td><span style="color: red; "><b>*</b></span>住戶點數:</td>
                                        <td><input readonly type="TEXT" name="memberpoints" size="40" class="form-control"
                                                   value="<%=memberVO.getMemberPoints()%>"/></td>
                                    </tr>
                                    <tr>
                                        <td>頭貼:<td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="200px">
                                        <input name="memberpic" class="form-control"  type="file" value="<%=memberVO.getMemberPic()%>"></td></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td><span style="color: red; "><b>*</b></span>加入時間:</td>
                                        <td><input  style="display: none" readonly name="regdate" id="f_date1" type="text" size="40" class="form-control"></td>
                                    </tr>

                                    <tr style="display: none">
                                        <td><span style="color: red; "><b>*</b></span>住戶身份別:</td>
                                        <td>
                                            <select style="display: none" readonly size="1" name="memberidstate" class="form-select">
                                                <option value="0" <c:if test="${memberVO.memberIdState==('0')}"> selected="selected"</c:if>>0:沒有住人</option>
                                                <option value="1" <c:if test="${memberVO.memberIdState==('1')}"> selected="selected"</c:if>>1:一般住戶</option>
                                                <option value="2" <c:if test="${memberVO.memberIdState==('2')}"> selected="selected"</c:if>>2:租客</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr style="display: none">
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
                                <div style="height: 50px"></div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="myCheck"  name="remember" required>
                                    <label class="form-check-label" for="myCheck">我已確認以上資料正確無誤</label>
                                    <div class="valid-feedback">已勾選</div>
                                    <div class="invalid-feedback">請勾選上面的欄位，才能再進行送出新增。</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="updateProfile">
                    <input type="hidden" name="memberid" value="<%=memberVO.getMemberId()%>"/>
                    <input type="submit" class="btn btn-outline-primary" value="送出修改">
                </div>
            </section>
        </div>

    </FORM>

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

    <script>
        //JQ 密碼眼睛
        $("#checkEye").click(function () {
        if($(this).hasClass('bi-eye-fill')){
         $("#floatingPassword").attr('type', 'text');
        }else{
          $("#floatingPassword").attr('type', 'password');
        }
        $(this).toggleClass('bi-eye-fill').toggleClass('bi-eye-slash');
        });
    </script>

</body>

</html>