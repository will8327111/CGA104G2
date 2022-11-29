<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.bulletinboard.model.*" %>
<%@ page import="com.bulletinboardpic.model.*" %>
<%@ page import="java.util.List" %>
<%
    BulletinboardVO bulletinboardVO = (BulletinboardVO) request.getAttribute("bulletinboardVO");
%>
<%
    BulletinboardService bulletinboardSvc = new BulletinboardService();
    List<BulletinboardVO> list = bulletinboardSvc.getAllOn();
    pageContext.setAttribute("list", list);
%>
<%
    BulletinBoardPicVO bulletinboardpicVO = (BulletinBoardPicVO) request.getAttribute("bulletinboardpicVO");
%>

<html lang="zh-Hant">

<head>
    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
      <!--    隱藏圖片下載-->
    <meta http-equiv="imagetoolbar" content="false">
    <meta name="keywords" content="">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!--=============Google Font ===============-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
    <!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

    <!--==============css===============-->
    <!--font awesome kit-->
    <script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
    <!--!!固定!! 前台樣式-->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">

    <!--=============js=============-->
    <!--延遲載入-->
<%--    <script src="${pageContext.request.contextPath}/resources/front-end/assets/js/lazyload.min.js"></script>--%>

    <!--==============這邊放自己的 css===============-->
    <style>
        #vision .img{
            width:50%;
            min-height: 500px;
            background:url("${pageContext.request.contextPath}/resources/front-end/assets/img/bb_board.jpg") no-repeat left;
            border-radius: 5px;
            background-size: cover;

        }
        @media screen and (max-width:768px) {
            #vision .img {
                width: 100%;
                min-height: 290px;
                margin: 0 0 50px 0;
            }
        }
    </style>

    <!--==============css===============-->
    <style>
        /*!!固定!! 字形*/
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
        <header id="header">

<!--!!固定!! 導覽列 start-->
            <nav id="pc-nav">
                <!--!!固定!! logo-->
                <div>
                    <h1><a href="${pageContext.request.contextPath}/front-end/web/front-index2.html"><img src="${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
                </div>
            </nav>
                <ul>
                    <div id="login-div" >
                        <a href="#"><button class="cap"  id="login" data-tippy-content="<div class='inner-cap'><p>住戶登入/登出。</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i><label style="font-size: 1rem;"> 登出</label></button></a>
                    </div>
                </ul>
            <ul>
                <div id="out-div" >
                    <a href="#"><button class="cap"  id="out" data-tippy-content="<div class='inner-cap'><p>住戶訊息通知。</p><p>檢視您的個人訊息。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-bell"></i><label style="font-size: 1rem;"> 通知</label></button></a>
                </div>
            </ul>
            <!--導覽列 end-->
        </header>

<!--!!固定!! 空白遮罩-->
        <div id="cover" style="display:block; visibility: hidden; width: 100%; height:100px; z-index: -1;"></div>

<!--!!固定!! main area-->
        <div id="container">
            <main id="main-area">


<!--主要內容 start(從這邊開始改)-->
                <section id="vision" class="scroll-point">
                    <div class="img flipLeftTrigger"></div>
                    <div class="content flipLeftTrigger">
                        <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">公佈欄</span></span>
                        </h2>
                        <p class="vision-lead"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">Bulletin Board<br></span></span></p>

                        <p>在這裡您可得知有關社區的大小事</p>
                        <p>關於 <br>重大事項宣導、社區規約<br>管委會議記錄、社區財報</p>
                    </div>
                </section>
<!-- 社區服務section start -->

                <section id="faq" class="scroll-point">
<%--                    <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">公佈欄</span></span></h2>--%>
                    <%@ include file="bbPage.file" %>
                    <c:forEach items="${list}" var="bulletinboardVO" begin="<%=pageIndex%>"
                               end="<%=pageIndex+rowsPerPage-1%>">
                    <ul class="accordion-area">
                        <li class="fadeUpTrigger">
                            <section class="open">
                                <h3 class="title">
                                    <time datetime>${bulletinboardVO.bbPostdate}</time> 【${bulletinboardVO.bbClass}】　${bulletinboardVO.bbTitle}
                                </h3>
                                <div class="box">
                                    <p>${bulletinboardVO.bbContent}</p>
                                    <p>更新日：${bulletinboardVO.bbUpdate}</p>
<%--                                    <p><img src="${pageContext.request.contextPath}/bulletinboardpic/UploadBbPic?bbsubid=${bulletinboardVO.bbSubId}" width="30%" class="rounded"></p>--%>
                                </div>
                            </section>
                        </li>
                    </ul>
                    </c:forEach>
                    <%@ include file="bbPage2.file" %>
                </section>


<!--main area end-->
            </main>
            <!--container-->
        </div>

<!--!!固定!! footer-->
        <footer id="footer">
<!--右上角menu-->
            <div class="openbtn"><span></span><span>Menu</span><span></span></div>
            <div id="g-nav">
                <div id="g-nav-list">
                    <ul>
                        <li><a href=""></a> <img src="../../resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
                        <li><a href="../../front-end/member/memberProfile.jsp">住戶資訊</a></li>
                        <li><a href="../../front-end/bulletinboard/bbNews2.jsp">公佈欄</a></li>
                        <li><a href="#">社區帳單</a></li>
                        <li><a href="../../front-end/mail/mail.html">郵件</a></li>
                        <li><a href="#">公共設施</a></li>
                        <li><a href="../../front-end/activity/homepage3.html">活動</a></li>
                        <li><a href="#">檢舉與維修</a></li>
                        <li><a href="../../front-end/store/store.html">特約商店</a></li>
                    </ul>
                </div>
            </div>
            <p class="footer-logo">Community Management</p>
            <small> &copy; 2022 陪你e生e世　社區服務平台</small>
<!--            返回最上方小圖示-->
            <p id="page-top"><a href="#">Top</a></p>
        </footer>
        <!--/wrapper-->
    </div>

    <!--=============JS ===============-->
    <!--jQuery-->
    <script src="../../resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
    <!--news tickerー-->
    <script src="../../resources/front-end/assets/js/jquery.bxslider.min.js"></script>
    <!--背景線延伸效果-->
    <script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>
    <!--apang 動畫-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!--Tippy-->
    <script src="https://unpkg.com/popper.js@1"></script>
    <script src="https://unpkg.com/tippy.js@5"></script>

    <!--other-->
    <script src="../../resources/front-end/assets/js/modaal.min.js"></script>
    <script src="../../resources/front-end/assets/js/script.js"></script>
    <script src="../../resources/front-end/assets/js/search_origin.js"></script>

</body>

</html>