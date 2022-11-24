<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>公佈欄管理專區-Home</title>
    <style>
        .m_title {
            color: #65a9d0;
            display: inline-block;
            padding: 5px;
        }

        .m_edit {
            color: steelblue;
            display: block;
            padding: 5px;
        }

        .helpInputTop {
            color: #2a3746;
            display: block;
            box-sizing: border-box;
        }





        .form-group {
            display: block;
            padding: 10px;
        }
    </style>

    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">

    <title>index</title>
</head>

<body>
<h1>Index</h1>
<h4><a href="${pageContext.request.contextPath}/back-end/bulletinboard/Bboard_index.jsp"></a></h4>
<div class="m_title">
    <h2>${ "公佈欄資訊管理專區" }</h2>
</div>
<br>

<div class="form-group">
    <br>
    <h4>${ "公佈欄管理" }</h4>
    <li><a href="${pageContext.request.contextPath}/back-end/bulletinboard/listAllBboard.jsp">修改公佈欄資料</a> update
<%--        <a href="${pageContext.request.contextPath}/back-end/member/listAllMember2.jsp">修改</a> update all Members2--%>
        <br><br></li>
    <li><a href="${pageContext.request.contextPath}/back-end/bulletinboard/addBboard.jsp">新增公佈欄</a> add  <br><br></li>

    <h4>${ "公佈欄查詢" }</h4>

    <li><a href="${pageContext.request.contextPath}/back-end/bulletinboard/bb_select_page.jsp">查詢公佈欄</a> search one  <br><br>
    </li>

    ！===施工測試中===！
<%--    <li><a href="${pageContext.request.contextPath}/front-end/web/front-index.html">前台首頁</a> Web-back-end <br><br>--%>
<%--    </li>--%>
<%--    <li><a href="${pageContext.request.contextPath}/back-end/web/back-index.html">後台首頁</a> Web-back-end <br><br>--%>
<%--    </li>--%>

</div>
</body>
</html>