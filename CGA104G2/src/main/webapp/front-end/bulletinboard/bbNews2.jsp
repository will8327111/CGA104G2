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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

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
        <div style="width: 100%; height:100px;"></div>

<!--!!固定!! main area-->
<%--        <div id="container">--%>
<%--            <main id="main-area">--%>


<!--主要內容 start(從這邊開始改)-->
                <section id="vision" class="scroll-point">
                    <div class="img flipLeftTrigger"></div>
                    <div class="content flipLeftTrigger">
                        <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">標題</span></span>
                        </h2>
                        <p class="vision-lead"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">為了社區居民的福祉<br>將會迅速為您服務</span></span></p>

                        <p>我們「陪你e生e世」業務管理公司、<br>為了讓社區居民們能夠過上更便捷<br>和睦、且舒適的豐富社區生活</p>
                        <p>便引入此系統應用在社區服務的功能上<br>懇請有機會，能讓我們能夠為您服務。</p>
                    </div>
                </section>
<!-- 社區服務section start -->
                <section id="service" class="scroll-point">
                    <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">Service</span>
                       <h4><span class="bgappearTrigger">社區服務</span></h4></span>
                    </h2>
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
                        </main>
                    </div>

<!--其他可直接拿去使用的樣版-->
                    <aside id="sub-area">
                        <div class="sub-fix-block">
                            <ul class="sub-btn-list fadeUpTrigger">
                                <li class="cap" data-tippy-content="<div class='inner-cap'><p>浮動提示</p></div>"><a href="#" class="pushcircle"><img src="" alt=""><br>按鈕名稱</a></li>
                                <li class="cap" data-tippy-content="<div class='inner-cap'><p>浮動提示</p></div>"><a href="#" class="pushcircle"><img src="" alt=""><br>按鈕名稱</a></li>
                            </ul>

                            <div class="tab-area fadeUpTrigger">
                                <ul class="tab">
                                    <li class="active"><a href="#use1">標題</a></li>
                                    <li><a href="#use2">標題</a></li>
                                    <li><a href="#use3">標題</a></li>
                                </ul>

                                <div id="use1" class="area is-active">
                                    <ul>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                    </ul>
                                    <!--/area--></div>
                                <div id="use2" class="area">
                                    <ul>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                        <li><a href="#"></a></li>
                                    </ul>
                                    <!--/area--></div>
                                <div id="use3" class="area">
                                    <ul>
                                        <li><a href="#"> -</a></li>
                                        <li><a href="#">-</a></li>
                                        <li><a href="#">-</a></li>
                                        <li><a href="#"> -</a></li>
                                        <li><a href="#">-</a></li>
                                        <li><a href="#"></a></li>
                                    </ul>
                                    <!--/area--></div>
                                <!--/tab-area--></div>
                            <!--/sub-fix-block--></div>
                    </aside>
                    <!--/wrapper-->

                </section>

                 <section id="about" class="scroll-point">
                    <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">標題</span></span></h2>
                    <ul class="about-list fadeUpTrigger">
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                                <dt>表格標題</dt>
                                <dd>表格</dd>
                            </dl>
                        </li>
                    </ul>
                </section>

<!--下面物件出現動畫-->
                <div class="fadeUpTrigger">
                    <div class="faq-bg"></div>
                </div>

                <section id="faq" class="scroll-point">
                    <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">標題</span></span>
                    </h2>
                    <ul class="accordion-area">
                        <li class="fadeUpTrigger">
                            <section class="open">
                                <h3 class="title">標題</h3>
                                <div class="box">
                                    <p>内容</p>
                                </div>
                            </section>
                        </li>
                            <!--下面物件出現動畫-->
                        <li class="fadeUpTrigger">

                            <section>
                                <h3 class="title">標題</h3>
                                <div class="box">
                                    <p>内容</p>
                                </div>
                            </section>
                        </li>
                        <!--下面物件出現動畫-->
                        <li class="fadeUpTrigger">
                            <section>
                                <h3 class="title">標題</h3>
                                <div class="box">
                                    <p>内容</p>
                                </div>
                            </section>
                        </li>
                        <!--下面物件出現動畫-->
                        <li class="fadeUpTrigger">
                            <section>
                                <h3 class="title">標題</h3>
                                <div class="box">
                                    <p>内容</p>
                                </div>
                            </section>
                        </li>
                    </ul>
                </section>

                <section id="contact" class="scroll-point">
                    <h2><span class="bgextend bgLRextendTrigger"><span class="bgappearTrigger">標題</span></span>
                    </h2>

                    <form method="post" action="" enctype="multipart/form-data">

                        <ul class="form-list fadeUpTrigger">
                            <li>
                                <dl>
                                    <dt><label for="division">表格標題</label></dt>
                                    <dd><input type="text" name="Division" id="division" size="60" value="">
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><label for="name">表格標題</label></dt>
                                    <dd><input type="text" name="Name" id="name" size="60" value="">
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><label for="email">表格標題</label></dt>
                                    <dd><input type="email" name="E-mail" id="email" size="60" value="">
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><label for="tel">表格標題</label></dt>
                                    <dd><input type="text" name="Tel" id="tel" size="60" value="">
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><label for="msg">表格標題</label></dt>
                                    <dd><textarea name="Message" id="msg" cols="50" rows="5"></textarea>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                        <div class="submit-btn fadeUpTrigger"><input type="submit" name="submit" value="確認">
                        </div>
                    </form>
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
                        <li><a href="#">住戶帳號</a></li>
                        <li><a href="#">社區帳單</a></li>
                        <li><a href="#">郵件</a></li>
                        <li><a href="#">公共設施</a></li>
                        <li><a href="#">活動</a></li>
                        <li><a href="#">檢舉與維修</a></li>
                        <li><a href="#">特約商店</a></li>
                    </ul>
                </div>
            </div>
            <p class="footer-logo">Community Management</p>
            <small>2022 &copy; 陪你e生e世　社區服務平台</small>
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