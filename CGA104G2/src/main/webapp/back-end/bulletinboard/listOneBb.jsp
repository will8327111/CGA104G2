<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.bulletinboard.model.*" %>
<%@ page import="java.util.List" %>
<%
    BulletinboardVO bulletinboardVO = (BulletinboardVO) request.getAttribute("bulletinboardVO");
%>
<%
    BulletinboardService bulletinboardSvc = new BulletinboardService();
    List<BulletinboardVO> list = bulletinboardSvc.getAll();
    pageContext.setAttribute("list", list);
%>
<html lang="zh-Hant">
<head>

    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>

    <meta name="robots" content="noindex,nofollow">
    <!--    禁止本地端快取-->
    <Meta http-equiv="Pragma" Content="No-cache">
    <!--    隱藏圖片下載-->
    <meta http-equiv="imagetoolbar" content="false">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!--=============Google Font ===============-->
    <link href="${pageContext.request.contextPath}https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
    <!--==============css===============-->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/parts.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/modaal.min.css">

    <!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">
    <!--    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/nav.css">-->
    <style>
        /*網站用字體*/
        @font-face {
            font-family: 'huninn';
            src: url('${pageContext.request.contextPath}/resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype");
        }
        body {
            font-family: 'huninn',serif;
        }
    </style>
</head>

<body>
<div id="splash">
    <div id="splash-logo">
        <div class="bgextend bgLRextend"><span class="bgappear">Community Management</span><br>
            <span class="bgappear">陪你e生e世 社區服務平台</span></div>
    </div>
    <!--/splash-->
</div>
<div class="splashbg"></div>
<!---画面遷移用-->

<div id="wrapper">
    <header id="header">
        <!--            <h3><a href="#"><span class="bgextend bgLRextendTrigger">-->
        <h1><div> <a href="${pageContext.request.contextPath}/front-end/web/front-index.html"><img src="${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png" alt="" style="width: 50%"></a></div></h1>
        <!--            </a></h3>-->
        <!-- <span class="bgappearTrigger">陪你e生e世</span> -->

        <!--                    </span></a></h1>-->

        <nav id="pc-nav">
<%--                               <li><span class="bgappearTrigger"><img src="img/logo11_trans.png" alt="" style="width: 40%"></span></li>--%>
            <ul>
                <li><a href="#vision"><span class="bgextend bgLRextendTrigger"><span
                        class="bgappearTrigger">帳號管理</span></span></a></li>
                <li><a href="#service"><span class="bgextend bgLRextendTrigger"><span
                        class="bgappearTrigger">活動</span></span></a></li>
                <li><a href="#about"><span class="bgextend bgLRextendTrigger"><span
                        class="bgappearTrigger">公共設施</span></span></a></li>
                <li><a href="#faq"><span class="bgextend bgLRextendTrigger"><span
                        class="bgappearTrigger">檢舉與維修</span></span></a></li>
                <li><a href="#contact"><span class="bgextend bgLRextendTrigger"><span
                        class="bgappearTrigger">特約商店</span></span></a></li>
                <li><a href="#contact"><span class="bgextend bgLRextendTrigger"><span
                        class="bgappearTrigger">社區帳單</span></span></a></li>
<%--                <li><a href="#contact"><span class="bgextend bgLRextendTrigger"><span--%>
<%--                        class="bgappearTrigger">聯絡我們</span></span></a></li>--%>
            </ul>
        </nav>

    </header>


    <div id="top-main">
        <!-- 圖片輪播 -->

        <ul class="slider">
            <li class="slider-item slider-item01"></li>
            <li class="slider-item slider-item02"></li>
            <li class="slider-item slider-item03"></li>
        </ul>
        <p class="top-lead"><span class="bgextend bgLRextendTrigger"><span
                class="bgappearTrigger">社區便利e生活</span></span><br><span class="bgextend bgLRextendTrigger"><span
                class="bgappearTrigger">陪伴你我左右</span></span><br><span class="bgextend bgLRextendTrigger"><span
                class="bgappearTrigger">Community
                        Management</span></span></p>

    </div>
    <!-- 圖片結束 -->

    <div id="container">

        <main id="main-area">
            <section id="topics">
                <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">Topics</span></span></h2>
                <ul class="slider">
                    <c:forEach items="${list}" var="bulletinboardVO" begin="1" end="5">
                    <li class="bbdetail"><a href="#"><time datetime>${bulletinboardVO.bbUpdate}</time>${bulletinboardVO.bbTitle}</a></li>
<%--                    <li><a href="#"><time datetime>${bulletinboardVO.bbUpdate}</time>${bulletinboardVO.bbTitle}</a></li>--%>
<%--                    <li><a href="#"><time datetime>${bulletinboardVO.bbUpdate}</time>${bulletinboardVO.bbTitle}</a></li>--%>
<%--                    <li><a href="#"><time datetime>${bulletinboardVO.bbUpdate}</time>${bulletinboardVO.bbTitle}</a></li>--%>
                    </c:forEach>
                    <li><a href="#"><time datetime="2021-11-01">2022.11.01</time>感謝xxx議員大力協助我們社區改善門口周遭道路環境。</a>
                    </li>
                    <li><a href="#"><time datetime="2021-09-25">2022.09.25</time>社區即將舉辦中秋聯歡晚會，還請住戶們踴躍參加！</a></li>
                    <li><a href="#"><time datetime="2021-11-03">2022.11.03</time>最近氣候不定風雨交加，請住戶緊閉門窗注意及多加小心。</a></li>
                </ul>
            </section>

<%--            <c:forEach items="${list}" var="bulletinboardVO" begin="1" end="5">--%>
<%--                <option value="${bulletinboardVO}" >${bulletinboardVO.bbTitle}</option>--%>
<%--            </c:forEach>--%>
<ul>
    <div class="page-content">
<%--        <section class="section">--%>
<%--            <div class="page-title-headings"><h3>公佈欄查詢(單一)結果</h3></div>--%>
<%--            <br>--%>
<%--            <h4><img src="./images/back.svg" width="30" height="30" alt="返回"><a href="bb_select_page.jsp">返回查詢頁面</a></h4>--%>
<%--            <div class="card">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="flex-row">--%>
<%--                        <table class="table table-striped">--%>
<%--            //test                --%>
                        <c:forEach items="${list}" var="bulletinboardVO" begin="1" end="5">
            <section id="faq" class="scroll-point">
            <ul class="accordion-area">
                <li class="fadeUpTrigger">
                    <section class="open">
                        <h3 class="title">${bulletinboardVO.bbClass}：${bulletinboardVO.bbTitle}</h3>
                        <div class="box">
                            <p>${bulletinboardVO.bbContent}</p>

<%--                            <label>發佈日期：<p>${bulletinboardVO.bbPostdate}</p></label>--%>
                            <label>更新日期：<p>${bulletinboardVO.bbUpdate}</p></label>
                            <label>管理員：${bulletinboardVO.bmId}</label>

<%--                            <td><img src="<%=request.getContextPath()%>/bulletinboardpic/BulletinBoardPicServlet/UploadServlet?bbpicid=${bulletinboardpicVO.bbPicId}" width="80%" ></td>--%>
                                </div>
                    </section>
                </li>
            </ul>

                                    </c:forEach>

            </section>

        </main>
    </div>





<%--                                <th>公佈欄編號</th>--%>
<%--                                <th>公佈欄類別</th>--%>
<%--                                <th>標題</th>--%>
<%--                                <th>內容</th>--%>
<%--                                <th>發佈日期</th>--%>
<%--                                <th>更新日期</th>--%>
<%--                                <th>顯示狀態</th>--%>
<%--                                <th>管理員編號</th>--%>

<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>${bulletinboardVO.bbSubId}</td>--%>
<%--                                <td>${bulletinboardVO.bbClass}</td>--%>
<%--                                <td></td>--%>
<%--                                <td></td>--%>
<%--                                <td></td>--%>
<%--                                <td>${bulletinboardVO.bbUpdate}</td>--%>
<%--                                <td>${bulletinboardVO.bbArticalState}</td>--%>
<%--                                <td>${bulletinboardVO.bmId}</td>--%>

<%--                                <td><img src="<%=request.getContextPath()%>/member/PicuploadServlet?memberid=${memberVO.memberId}" width="150px" class="rounded"></td>--%>


<%--        </section>--%>


<footer id="footer">

    <div class="openbtn"><span></span><span>Menu</span><span></span></div>
    <div id="g-nav">
        <div id="g-nav-list">
            <ul>
                <li><a href=""></a> <img src="${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
                <li><a href="#vision">社區起源</a></li>
                <li><a href="#service">個人管理</a></li>
                <li><a href="#about">活動</a></li>
                <li><a href="#faq">公共設施</a></li>
                <li><a href="#contact">檢舉與維修</a></li>
            </ul>
        </div>
    </div>
    <p class="footer-logo">CommunityManagement</p>
    <small>&copy; CommunityManagement：社區物業管理系統-陪你e生e世</small>
    <!--            返回最上方小圖示-->
    <p id="page-top"><a href="#">Top</a></p>
</footer>
<!--/wrapper-->
</div>

<!--=============JS ===============-->
<script>
    var bbdetail =document.getElementByClassName("bbdetail")
    for(i=0; i<bbdetail.length(); i++) {
        var bbInfo = bbdetail[i].innerHTML.slice(0,5);
        bbdetail[i].innerHTML=bbInfo;
    }
</script>


<!--jQuery-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
<!--news tickerー-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/jquery.bxslider.min.js"></script>
<!--背景線延伸效果-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/scrollgress.min.js"></script>
<!--apang 動畫-->
<script src="${pageContext.request.contextPath}https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
<script src="${pageContext.request.contextPath}https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/modaal.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/script.js"></script>
</body>

</html>