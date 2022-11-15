<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>住戶個人資訊</title>

    <%--STYLE--%>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
</head>
<body>

<div>
    <tr>
        <td><h3 class="page-title-headings">住戶個人資訊查詢 select_page</h3></td>
    </tr>
</div>
<br>
<h4><a href="${pageContext.request.contextPath}/back-end/member/member_index.jsp"><img src="./images/back.svg" width="30" height="30"
                                                                alt="返回">回首頁</a></h4>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <span style="color:red">請修正以下錯誤:</span>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<ul>
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="row-cols-md-3">
                            <li><a href="${pageContext.request.contextPath}/back-end/member/listAllMember.jsp">List All</a> 全部住戶 <br><br></li>
                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>請輸入住戶編號 (如數字：1):</b>
                                    <input type="text" name="memberid">
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService"/>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>選擇住戶編號:</b>
                                    <select size="1" name="memberid" class="form-select">
                                        <c:forEach var="memberVO" items="${memberSvc.all}">
                                        <option value="${memberVO.memberId}">${memberVO.memberId}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>選擇住戶姓名:</b>
                                    <select size="1" name="memberid" class="form-select">
                                        <c:forEach var="memberVO" items="${memberSvc.all}">
                                        <option value="${memberVO.memberId}">${memberVO.memberName}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/member/member.do">
                                    <b>選擇住戶棟號: (如:A0101,"A~E棟1位數"+"樓層2位數"+幾號2位數"共5碼):</b>
                                    <select size="1" name="memberid" class="form-select">
                                        <c:forEach var="memberVO" items="${memberSvc.all}">
                                        <option value="${memberVO.memberId}">${memberVO.memberBuilding}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOne_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>

                            </li>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</ul>
<div class="page-link">
</div>

</body>
</html>