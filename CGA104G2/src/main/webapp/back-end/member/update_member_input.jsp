<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
    MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>住戶資料修改 - update_member_input.jsp</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">

</head>

<body>
<ul class="form-group">
<tr>
    <td>
        <h3>住戶資料修改 - update_member_input.jsp</h3>
        <br>
        <h4><a href="${pageContext.request.contextPath}/back-end/member/member_index.jsp"><img src="./images/back.svg" width="30" height="30"
                                                                        alt="返回">回首頁</a></h4>
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
                    <h4 class="card-title">Update Member</h4>
                    <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                    這裡是新位置
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-auto">
                            <table>
<%--                                <tr>--%>
<%--                                    <td><span style="color: red; "><b>*</b></span>住戶編號:</td>--%>
<%--                                    <td><%=memberVO.getMemberId()%></td>--%>
<%--                                </tr>--%>

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
<%--                                   <input type="TEXT" name="membersex" size="2" value="<%=memberVO.getMemberSex()%>"/></td>--%>
<%--                                    <td>--%>
<%--                                        <label><input type="radio" name="membersex" id="male" value="男性" />男性</label>--%>
<%--                                        <label><input type="radio" name="membersex" id="female" value="女性" />女性</label>--%>
<%--                                   </td>--%>
                                    <td>
                                        <select size="1" name="membersex" class="form-select">
<%--                                            <option value="<%= (memberVO== null)?"":memberVO.getMemberSex()%>"><%=(memberVO!= null)? "請選擇性別" :memberVO.getMemberSex()%></option>--%>
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
                                    <td><input readonly type="TEXT" name="memberpoints" size="40" class="form-control"
                                               value="<%=memberVO.getMemberPoints()%>"/></td>
                                </tr>
                                	<tr>
                                        <td>住戶頭貼:<td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="200px">
                                		<input name="memberpic" class="form-control"  type="file" value="<%=memberVO.getMemberPic()%>"></td></td>
                                	</tr>
                               <tr>
                                    <td><span style="color: red; "><b>*</b></span>加入時間:</td>
                                    <td><input  style="display: none" readonly name="regdate" id="f_date1" type="text" size="40" class="form-control"></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>住戶身份別:</td>
                                    <td>
                                        <select style="display: none" readonly size="1" name="memberidstate" class="form-select">
<%--                                            <option value="<%= (memberVO== null)?"":memberVO.getMemberIdState()%>"><%=(memberVO== null)?"請選擇身分別":memberVO.getMemberIdState()%></option>--%>
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
<%--                                            <option value="<%= (memberVO== null)?"":memberVO.getAcState()%>"><%=(memberVO== null)?"請選擇帳號狀態":memberVO.getAcState()%></option>--%>
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
    </div>

</FORM>

</body>

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
        step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
        format: 'Y-m-d',         //format:'Y-m-d H:i:s',
        value: '<%=memberVO.getRegDate()%>', // value: new Date()
<%--        //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含--%>
<%--        //startDate:	            '2017/07/10',  // 起始日--%>
<%--        //minDate:               '-1970-01-01', // 去除今日(不含)之前--%>
<%--        //maxDate:               '+1970-01-01'  // 去除今日(不含)之後--%>
    });


</script>
</html>