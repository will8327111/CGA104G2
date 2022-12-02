<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.member.model.*" %>
<%@ page import="java.util.List" %>
<html lang="zh-Hant">

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list", list);
%>

<head>
    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
    <!--    禁止本地端快取-->
    <!--    <Meta http-equiv="Pragma" Content="No-cache">-->
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
    <link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

    <!--==============css===============-->
    <!--font awesome kit-->
    <script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
    <!--!!固定!! 前台樣式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/parts.css">
    <!--modaal-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/modaal.min.css">

    <!--=============js=============-->
    <!--延遲載入-->
    <script src="${pageContext.request.contextPath}/resources/front-end/assets/js/lazyload.min.js"></script>

    <!--==============這邊放自己的 css===============-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front-end/assets/css/content.css">


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
            <h1><a disabled href="${pageContext.request.contextPath}/front-end/web/front-index2.html">
                <img src="${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
        </div>
    </nav>
    <ul>
        <div id="login-div" >
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
                <button type="submit" name="submit" value="登出" class="cap" id="login" data-tippy-content="<div class='inner-cap'><p>住戶登出。</p><p>社區住戶專用。</p></div>">
                    <i style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i>
                    <label style="font-size: 1rem;">登出</label>
                </button>
                    <input type="hidden" name="memberid" value="${memberLoginVO.memberId}">
                    <input type="hidden" name="action" value="memberLogOut">
            </FORM>
        </div>
    </ul>
    <ul>
        <div id="out-div" style="display: none" >
            <a href="#"><button class="cap"  id="out" data-tippy-content="<div class='inner-cap'><p>住戶訊息通知。</p><p>檢視您的個人訊息。</p></div>">
                <i style="font-size: 1rem;" class="fa-solid fa-bell"></i><label style="font-size: 1rem;"> 通知</label></button>
            </a>
        </div>
    </ul>
    <!--導覽列 end-->
</header>

<!--!!固定!! 空白遮罩-->
<div style="width: 100%; height:100px;"></div>

<!--!!固定!! main area-->
<div id="container">

    <!--主要內容 start(從這邊開始改)-->
    <main id="main-area-content">
        <section id="about" class="scroll-point">
            <h3 style="display:flex; justify-content:space-around; ">
                <span class="bgextend">== 修改資訊成功!!! 請重新登入 ==</span>
            </h3>
            <h2>
                <span class="bgextend">
                    <span>Member Information<br>住戶個人資訊</span>
                </span>
            </h2>
            <ul class="about-list bgextend">
                <li>
                    <dl>
                        <dt style="position: fixed; display: none;">住戶大頭</dt>
<%--                        <dd>${memberLoginVO.memberPic}</dd>--%>
                        <td><img src="${pageContext.request.contextPath}/member/PicuploadServlet?memberid=${memberVO.memberId}" style="width:200px;  border-radius:50%;"></td>

                    </dl>
                </li>

                <li>
                    <dl>
                        <dt>【姓名】</dt>
                        <dd>${memberVO.memberName}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【暱稱】</dt>
                        <dd>${memberVO.memberNickname}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【性別】</dt>
                        <dd>${memberVO.memberSex}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【信箱】</dt>
                        <dd>${memberVO.memberEmail}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【手機】</dt>
                        <dd>${memberVO.memberMobile}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【市話】</dt>
                        <dd>${memberVO.memberTel}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【郵遞區號】</dt>
                        <dd>${memberVO.memberPost}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【住址】</dt>
                        <dd>${memberVO.memberAddress}</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>【點數】</dt>
                        <dd>${memberVO.memberPoints}</dd>
                    </dl>
                </li>
            </ul>

        </section>
        <!--下面物件出現動畫-->
        <div class="fadeUpTrigger">
            <div class="faq-bg"></div>
        </div>

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
                <li><a href=""></a> <img src="${pageContext.request.contextPath}/resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
                <div style="width: 100%; height:50px;"></div>
                <li>
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do">
                    <button type="submit" name="submit" value="登出" class="cap"  data-tippy-content="<div class='inner-cap'><p>住戶登出。</p><p>社區住戶專用。</p></div>">
                        <i style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i>
                        <label style="font-size: 1rem;">登出</label>
                    </button>
                    <input type="hidden" name="memberid" value="${memberLoginVO.memberId}">
                    <input type="hidden" name="action" value="memberLogOut">
                </FORM>
                </li>

            </ul>
        </div>
    </div>
    <p class="footer-logo">Community Management</p>
    <small>2022 &copy; 陪你e生e世　社區服務平台</small>

    <!--            返回最上方小圖示-->
    <p id="page-top"><a href="#">Top</a></p>
</footer>
<!--/wrapper-->

<!--=============JS ===============-->
<!--jQuery-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
<!--news tickerー-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/jquery.bxslider.min.js"></script>
<!--背景線延伸效果-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/scrollgress.min.js"></script>
<!--apang 動畫-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!--Tippy-->
<script src="https://unpkg.com/popper.js@1"></script>
<script src="https://unpkg.com/tippy.js@5"></script>

<!--other-->
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/modaal.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/front-end/assets/js/script.js"></script>

</body>

</html>