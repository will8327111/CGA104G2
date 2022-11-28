<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bulletinboard.model.*" %>
<%
    BulletinboardVO bulletinboardVO = (BulletinboardVO) request.getAttribute("bulletinboardVO");
%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>公佈欄查詢(單一)</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
<%--    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/table.css" rel="stylesheet">--%>
</head>
<body>
<ul>
    <div class="page-content">
        <section class="section">
            <div class="page-title-headings"><h3>公佈欄查詢(單一)結果</h3></div>
            <br>
            <%--            <h4><img src="./images/back.svg" width="30" height="30" alt="返回"><a href="bb_select_page.jsp">返回查詢頁面</a></h4>--%>
            <div class="card">
                <div class="card-body">
                    <div class="flex-row">
                        <table class="table table-striped">
                            <tr>
                                <th>公佈欄編號</th>
                                <th>公佈欄類別</th>
                                <th>標題</th>
                                <th>內容</th>
                                <th>發佈日期</th>
                                <th>更新日期</th>
                                <th>顯示狀態</th>
                                <th>管理員編號</th>

                            </tr>
                            <tr>
                                <td>${bulletinboardVO.bbSubId}</td>
                                <td>${bulletinboardVO.bbClass}</td>
                                <td>${bulletinboardVO.bbTitle}</td>
                                <td>${bulletinboardVO.bbContent}</td>
                                <td>${bulletinboardVO.bbPostdate}</td>
                                <td>${bulletinboardVO.bbUpdate}</td>
                                <td>${bulletinboardVO.bbArticalState}</td>
                                <td>${bulletinboardVO.bmId}</td>

                                <%--                                <td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>--%>

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