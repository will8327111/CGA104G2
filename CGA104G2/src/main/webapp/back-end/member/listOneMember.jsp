<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.member.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>住戶個人資訊</title>
    <link href="${pageContext.request.contextPath}/resources/assets/css/main/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/pages/form-element-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/pages/summernote.css" rel="stylesheet">
</head>
<body>
<ul>
    <div class="page-content">
        <section class="section">
            <div class="page-title-headings"><h3>住戶資料查詢結果</h3></div>
            <br>
            <h4><img src="./images/back.svg" width="30" height="30" alt="返回"><a href="${pageContext.request.contextPath}/back-end/member/select_page.jsp">返回查詢頁面</a></h4>
            <div class="card">
                <div class="card-body">
                    <div class="flex-row">
                        <table class="table table-striped">
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
                                <td><img src="${pageContext.request.contextPath}/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>
                                <td>${memberVO.regDate}</td>
                                <td>${memberVO.memberIdState}</td>
                                <td>${memberVO.acState}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
</ul>

</body>
</html>