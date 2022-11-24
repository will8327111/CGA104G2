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

<html>
<head>
    <title>所有住戶資料 - listAllMember.jsp</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
    </head>
<body>

<table id="table-1">
    <tr>
        <td>
            <h3>所有住戶資料 - listAllMember.jsp</h3>
            <br>
            <h4><a href="${pageContext.request.contextPath}/back-end/web/backEndHomeMgr.html"><img src="./images/back.svg" width="30"
                                                                            height="30" alt="返回">回首頁</a></h4>
        </td>
    </tr>
</table>

<ul>


            <div class="card text-center">
                <div class="card-header">
                    <h3 class="card-title">修改住戶資料</h3>
                </div>
                <div class="card-body overflow-auto">
                        <table class="table table-sm table-striped table-hover">
                            <tr>

                                <th>住戶編號</th>
                                <th>帳號</th>
                                <th>密碼</th>
                                <th>姓名</th>
                                <th>暱稱</th>
                                <th>性別</th>
                                <th>棟號</th>
                                <th>email</th>
                                <th>住戶手機</th>
                                <th>住戶市話</th>
                                <th>郵遞區號</th>
                                <th>住戶住址</th>
                                <th>住戶點數</th>
<%--                                <th>住戶頭貼</th>--%>
                                <th>加入時間</th>
                                <th>住戶身份別</th>
                                <th>帳號狀態</th>

                                <th>修改</th>
                                <th>刪除</th>

                            </tr>

                            <%@ include file="page1.file" %>
                            <c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>"
                                       end="<%=pageIndex+rowsPerPage-1%>">
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
<%--                                    <td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>--%>
                                    <td>${memberVO.regDate}</td>
                                    <td>${memberVO.memberIdState}</td>
                                    <td>${memberVO.acState}</td>

                                    <td>
                                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do"
                                              style="margin-bottom: 0px;">
                                            <input type="submit" class="btn btn-outline-primary" value="修改">
                                            <input type="hidden" name="memberid" value="${memberVO.memberId}">
                                            <input type="hidden" name="action" value="getOne_For_Update">
                                        </FORM>
                                    </td>

                                    <td>
                                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do"
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

<%--第二個表格--%>
<ul>


    <div class="card text-center">
        <div class="card-header">
            <h3 class="card-title">修改住戶資料</h3>
        </div>
        <div class="card-body overflow-auto">
            <table class="table table-sm table-striped table-hover">
                <tr>

                    <th>住戶編號</th>
                    <th>帳號</th>
                    <th>密碼</th>
                    <th>姓名</th>
                    <th>暱稱</th>
                    <th>性別</th>
                    <th>棟號</th>
                    <th>email</th>
                    <th>住戶手機</th>
                    <th>住戶市話</th>
                    <th>郵遞區號</th>
                    <th>住戶住址</th>
                    <th>住戶點數</th>
                    <%--                                <th>住戶頭貼</th>--%>
                    <th>加入時間</th>
                    <th>住戶身份別</th>
                    <th>帳號狀態</th>

                    <th>修改</th>
                    <th>刪除</th>

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
                            <%--                                    <td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>--%>
                        <td>${memberVO.regDate}</td>
                        <td>${memberVO.memberIdState}</td>
                        <td>${memberVO.acState}</td>

                        <td>
                            <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do"
                                  style="margin-bottom: 0px;">
                                <input type="submit" class="btn btn-outline-primary" value="修改">
                                <input type="hidden" name="memberid" value="${memberVO.memberId}">
                                <input type="hidden" name="action" value="getOne_For_Update">
                            </FORM>
                        </td>

                        <td>
                            <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do"
                                  style="margin-bottom: 0px;">
                                <input type="submit" class="btn btn-outline-danger" value="刪除">
                                <input type="hidden" name="memberid" value="${memberVO.memberId}">
                                <input type="hidden" name="action" value="delete">
                            </FORM>
                        </td>
                    </tr>

            </table>
        </div>
    </div>

</ul>

<%@ include file="page2.file" %>

</body>
</html>