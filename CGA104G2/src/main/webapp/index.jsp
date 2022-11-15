<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>住戶資訊管理專區-Home</title>
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

    <link href="${pageContext.request.contextPath}/resources/assets/css/main/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/pages/form-element-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/pages/summernote.css" rel="stylesheet">
    <title>index</title>
</head>

<body>
<h1>Index</h1>
<h4><a href="member/select_page.jsp"></a></h4>
<div class="m_title">
    <h2>${ "測試專區" }</h2>
    更新日：11/13
</div>
<br>

<div class="form-group">
    <br>
    <h4>${ "前台" }</h4>
    <li><a href="${pageContext.request.contextPath}/front-end/web/front-index.html"> 前台首頁 Web-front-end</a>/front-end/frontendIndex.jsp
        <br><br></li>

    <h4>${ "後台" }</h4>

    <li><a href="${pageContext.request.contextPath}/back-end/web/back-index.html"> 後台首頁 Web-back-end</a> /back-end/index/index/html <br><br>
    </li>

    ！===施工測試中===！

    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/form-element-select.js" rel="stylesheet"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/form-editor.js" rel="stylesheet"></script>
</div>
</body>
</html>