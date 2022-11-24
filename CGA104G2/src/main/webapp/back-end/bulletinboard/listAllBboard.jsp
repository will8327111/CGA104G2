<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bulletinboard.model.*" %>
<%@ page import="com.bulletinboardpic.model.*" %>
<%@ page isELIgnored="false"%>

<%
    BulletinboardService bulletinboardSvc = new BulletinboardService();
    List<BulletinboardVO> list = bulletinboardSvc.getAll();
    pageContext.setAttribute("list", list);
%>
<%
    BulletinBoardPicService bulletinBoardPicSvc = new BulletinBoardPicService();
    List<BulletinBoardPicVO> list2 = bulletinBoardPicSvc.getAllPic();
    pageContext.setAttribute("list2", list2);
%>

<html>
<head>
<%--    <title>所有公佈欄 - listAllBboard.jsp</title>--%>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
</head>
<body>

<table id="table-1">
    <tr>
        <td>
            <h3>所有公佈欄 - listAllBboard.jsp</h3>
            <br>
        </td>
    </tr>
</table>

<ul>

            <div class="card text-center">
                <div class="card-header">
                    <h3 class="card-title">公佈欄</h3>
                </div>
                <div class="card-body overflow-auto">
                        <table class="table table-sm table-striped table-hover">
                            <tr>

                                <th>公佈欄編號</th>
                                <th>公佈欄項目類別</th>
                                <th>標題</th>
                                <th>文章內容</th>
                                <th>發佈日期</th>
                                <th>更新日期</th>
<%--                                <th>公佈欄圖</th>--%>
                                <th>發佈狀態</th>
                                <th>公佈欄管理員編號</th>

                                <th>修改</th>
                                <th>刪除</th>

                            </tr>

                            <%@ include file="bbPage.file" %>
                            <c:forEach var="bulletinboardVO" items="${list}" begin="<%=pageIndex%>"
                                       end="<%=pageIndex+rowsPerPage-1%>">
                                <tr>
                                    <td>${bulletinboardVO.bbSubId}</td>
                                    <td>${bulletinboardVO.bbClass}</td>
                                    <td>${bulletinboardVO.bbTitle}</td>
                                    <td>${bulletinboardVO.bbContent}</td>
                                    <td>${bulletinboardVO.bbPostdate}</td>
                                    <td>${bulletinboardVO.bbUpdate}</td>
                                    <td>${bulletinboardVO.bbArticalState}</td>
                                    <td>${bulletinboardVO.bmId}</td>

<%--                                    <td><img src="<%=request.getContextPath()%>/bulletinboardpic/BulletinBoardPicServlet?bbpicid=${bulletinboardpicVO.bbPicId}" width="150px" class="rounded"></td>--%>

                                    <td>
                                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do"
                                              style="margin-bottom: 0px;">
                                            <input type="submit" class="btn btn-outline-primary" value="修改">
                                            <input type="hidden" name="bbsubid" value="${bulletinboardVO.bbSubId}">
                                            <input type="hidden" name="action" value="getOneBb_For_Update">
                                        </FORM>
                                    </td>

                                    <td>
                                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do"
                                              style="margin-bottom: 0px;">
                                            <input type="submit" class="btn btn-outline-danger" disabled value="刪除">
                                            <input type="hidden" name="bbsubid" value="${bulletinboardVO.bbSubId}">
                                            <input type="hidden" name="action" value="delete">
                                        </FORM>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
</ul>

<%@ include file="bbPage2.file" %>

</body>
</html>