<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
    MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>住戶資料新增 - addMember.jsp</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
</head>

<body>

<%--    <h4><a href="${pageContext.request.contextPath}/index.jsp"><img src="./images/back.svg" width="30" height="30"--%>
<%--                                                                    alt="返回">回首頁</a></h4>--%>

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

                <ul class="form-group">

                <div class="card">
                    <div class="card-header">
                    <h3>住戶個人帳戶註冊  新位址</h3>
                    <br>
                        <h4 class="card-title">Add Member</h4>
                        <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-auto">
                                <table>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>帳號－</td>
                                        <td><input type="TEXT" name="memberac" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "as325e222" : memberVO.getMemberAc()%>"/>
                                            <%-- value="${memberId.memberAc}"/></td><td>${errorMsgs.memberAc}</td>--%>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>密碼－</td>
                                        <td><input type="TEXT" name="memberpw" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "Karubero3355" : memberVO.getMemberPw()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶姓名:</td>
                                        <td><input type="TEXT" name="membername" size="40"  class="form-control"
                                                   value="<%= (memberVO==null)? "可魯" : memberVO.getMemberName()%>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>住戶暱稱:</td>
                                        <td><input type="TEXT" name="membernickname" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberNickname()%>" placeholder="小可" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶性別:</td>
                                        <td>
                                            <select size="1" type="test" name="membersex" class="form-select" id="membersex">
                                                <option value="
                                                               <%= (memberVO== null)?"":memberVO.getMemberSex()%>">
                                                    <%=(memberVO== null)?"請選擇性別":memberVO.getMemberSex()%>
                                                    <%--<%= request.getParameter("")== null? null:memberVO.getMemberSex() %>--%>
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
                                            <input type="TEXT" name="memberbuilding" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberBuilding()%>" />
                                            <label for="floatingInput">棟別1位數+樓層2位數+戶號2位數=共5碼</label>
                                        </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶email:</td>
                                        <td>
                                            <div class="form-floating">
                                                <input type="email" name="memberemail" size="40" class="form-control" id="floatingInput"
                                                       value="<%= (memberVO==null)? "Karubero321@gmail.com" : memberVO.getMemberEmail()%>"/>
                                                <label for="floatingInput">example@gmail.com</label>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span style="color: red; "><b>*</b></span>住戶手機:</td>
                                        <td>
                                            <input type="TEXT" name="membermobile" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "0921005456" : memberVO.getMemberMobile()%>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>住戶市話:</td>
                                        <td><input type="TEXT" name="membertel" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "" : memberVO.getMemberTel()%>" placeholder="035687852"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>郵遞區號:</td>
                                        <td><input type="TEXT" name="memberpost" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "323" : memberVO.getMemberPost()%>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶住址:</td>
                                        <td><input type="TEXT" name="memberaddress" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "桃園市中壢區" : memberVO.getMemberAddress()%>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>住戶點數:</td>
                                        <td><input type="TEXT" name="memberpoints" size="40" class="form-control"
                                                   value="<%= (memberVO==null)? "1000" : memberVO.getMemberPoints()%>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>住戶頭貼:</td>
                                        <td><input type="file" name="memberpic" class="form-control" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>加入時間:</td>
                                        <td><input type="text" name="regdate" size="40" id="f_date1" class="form-control"></td>
                                        <%--                                            value="<%= (memberVO==null)? "2022-01-01" : memberVO.getRegDate()%>"/>--%>
                                    </tr>

                                    <td><span style="color: red; "><b>*</b></span>住戶身份別:</td>
                                    <td>
                                        <select size="1" name="memberidstate" class="form-select" id="memberidstate">
                                            <%--                                                        <option value="<%= (memberVO== null)?"":memberVO.getMemberIdState()%>">--%>
                                            <%--                                                                       <%=(memberVO== null)?"請選擇身分別":memberVO.getMemberIdState()%></option>--%>
                                            <option value="0" >0</option>
                                            <option value="1" selected >1</option>
                                            <option value="2" >2</option>
                                        </select>
                                        <span>【身份別】0:沒有住人 | 1:一般住戶<span style="color: red; "><b>*</b></span>預設 | 2:租客</span>
                                    </td>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>帳號狀態:</td>
                                        <td>
                                            <select size="1" name="acstate" class="form-select" id="acstate">
                                                <%--                                                <option value="<%= (memberVO== null)?"":memberVO.getAcState()%>">--%>
                                                <%--                                                               <%=(memberVO== null)?"請選擇帳號狀態":memberVO.getAcState()%></option>--%>
                                                <option value="0" selected>0</option>
                                                <option value="1" >1</option>
                                                <option value="2" >2</option>

                                            </select>
                                            <span>【狀態】0:未啟用(Email未驗證) <span style="color: red; "><b>*</b></span>預設 |1:已啟用(Email已驗證) |2:停權</span>
                                            <%--                                            <td><input type="TEXT" name="acstate" size="45"--%>
                                            <%--                                                       value="<%= (memberVO==null)? "1" : memberVO.getAcState()%>"/>--%>
                                        </td>
                                    </tr>

                                </table>
                                <div id="msg" class="error"></div>
                                <input type="hidden" name="action" value="insert">
                                <input type="submit" class="btn btn-outline-primary" id="btn1"  value="送出新增">
                            </div>
                        </div>
                    </div>
                </div>
                </ul>
            </section>
        </div>

    </FORM>

    <%--    <script>--%>
    <%--    bootstrap驗證--%>
    <%--        // Example starter JavaScript for disabling form submissions if there are invalid fields--%>
    <%--        (function () {--%>
    <%--            'use strict'--%>

    <%--            // Fetch all the forms we want to apply custom Bootstrap validation styles to--%>
    <%--            let forms = document.querySelectorAll('.needs-validation')--%>

    <%--            // Loop over them and prevent submission--%>
    <%--            Array.prototype.slice.call(forms)--%>
    <%--                .forEach(function (form) {--%>
    <%--                    form.addEventListener('submit', function (event) {--%>
    <%--                        if (!form.checkValidity()) {--%>
    <%--                            event.preventDefault()--%>
    <%--                            event.stopPropagation()--%>
    <%--                        }--%>

    <%--                        form.classList.add('was-validated')--%>
    <%--                    }, false)--%>
    <%--                })--%>
    <%--        })()--%>


    <%--    </script>--%>


    <%--    <script>--%>
    <%--        $().ready(function() {--%>
    <%--            $("#membersex").on('focusout', function () {--%>
    <%--                if ($("#membersex").val() == '') {--%>
    <%--                    $("#membersex").text("請選擇性別");--%>
    <%--                } else {--%>
    <%--                    $("#membersex").text("");--%>
    <%--                }--%>
    <%--            })--%>
    <%--        })--%>
    <%--    </script>--%>



</body>

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
        step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
        format: 'Y-m-d',         //format:'Y-m-d H:i:s',
        value: '<%=regDate%>', // value:   new Date(),
        //disabledDates: ['2017/06/08', '2017/06/09', '2017/06/10'], // 去除特定不含
        //startDate: '1980/01/01',  // 起始日
        //minDate: '-1970-01-01', // 去除今日(不含)之前
        //maxDate: '+1970-01-01'  // 去除今日(不含)之後
    });


</script>
</html>
