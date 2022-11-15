<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.member.model.*" %>
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
            <h4><img src="./images/back.svg" width="30" height="30" alt="返回"><a href="select_page.jsp">返回查詢頁面</a></h4>
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
                                <td><%=memberVO.getMemberId()%></td>
                                <td><%=memberVO.getMemberAc()%></td>
                                <td><%=memberVO.getMemberPw()%></td>
                                <td><%=memberVO.getMemberName()%></td>
                                <td><%=memberVO.getMemberNickname()%></td>
                                <td><%=memberVO.getMemberSex()%></td>
                                <td><%=memberVO.getMemberBuilding()%></td>
                                <td><%=memberVO.getMemberEmail()%></td>
                                <td><%=memberVO.getMemberMobile()%></td>
                                <td><%=memberVO.getMemberTel()%></td>
                                <td><%=memberVO.getMemberPost()%></td>
                                <td><%=memberVO.getMemberAddress()%></td>
                                <td><%=memberVO.getMemberPoints()%></td>
                                <td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>
                                <td><%=memberVO.getRegDate()%></td>
                                <td><%=memberVO.getMemberIdState()%></td>
                                <td><%=memberVO.getAcState()%></td>
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