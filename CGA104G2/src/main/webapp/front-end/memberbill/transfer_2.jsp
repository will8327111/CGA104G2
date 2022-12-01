<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
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
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<!--=============Google Font ===============-->
		<link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
		<!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
		<link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico"
			type="image/x-icon">

		<!--==============css===============-->
		<!--font awesome kit-->
		<script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
		<!--!!固定!! 前台樣式-->
		<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
		<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">
		<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
		<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">
		<!--modaal-->
		<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/modaal.min.css">

		<!--=============js=============-->
		<!--延遲載入-->
		<script src="../../resources/front-end/assets/js/lazyload.min.js"></script>

		<!--==============這邊放自己的 css===============-->
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
			crossorigin="anonymous"></script>
		<style type="text/css">
			body {
				display: flex;
				justify-content: center;
				align-items: center;
				text-align: center;
				min-height: 100vh;
				flex-direction: column;
			}

			svg {
				width: 400px;
				height: 400px;
			}

			h2 {
				font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
				font-size: 36px;
				margin-top: 40px;
				color: #333;
				opacity: 0;
			}

			input[type="checkbox"]:checked~h2 {
				animation: .6s title ease-in-out;
				animation-delay: 1.2s;
				animation-fill-mode: forwards;
			}

			.circle {
				stroke-dasharray: 1194;
				stroke-dashoffset: 1194;
			}

			@keyframes circle {
				from {
					stroke-dashoffset: 1194;
				}

				to {
					stroke-dashoffset: 2388;
				}
			}

			input[type="checkbox"]:checked+svg .circle {
				animation: circle 1s ease-in-out;
				animation-fill-mode: forwards;
			}

			.tick {
				stroke-dasharray: 350;
				stroke-dashoffset: 350;
			}

			@keyframes tick {
				from {
					stroke-dashoffset: 350;
				}

				to {
					stroke-dashoffset: 0;
				}
			}

			input[type="checkbox"]:checked+svg .tick {
				animation: tick 0.8s ease-in-out;
				animation-fill-mode: forwards;
				animation-delay: .95s;
			}

			@keyframes title {
				from {
					opacity: 0;
				}

				to {
					opacity: 1;
				}
			}
		</style>


		<!--==============css===============-->
		<style>
			/*!!固定!! 字形*/
			@font-face {
				font-family: 'huninn';
				src: url('../../resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype");
			}

			body {
				font-family: 'huninn', serif;
			}
		</style>
	</head>


	<body>
		<header id="header" style="margin-top:-940px">

			<!--!!固定!! 導覽列 start-->
			<nav id="pc-nav">
				<!--!!固定!! logo-->
				<div>
					<h1><a href="../../front-end/web/front-index2.html"><img
								src="../../resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台"
								style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a>
					</h1>
				</div>
			</nav>
			<ul>
				<div id="login-div">
					<a href="#"><button class="cap" id="login"
							data-tippy-content="<div class='inner-cap'><p>住戶登入/登出。</p><p>社區住戶專用。</p></div>"><i
								style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i><label
								style="font-size: 1rem;"> 登出</label></button></a>
				</div>
			</ul>
			<ul>
				<div id="out-div">
					<a href="#"><button class="cap" id="out"
							data-tippy-content="<div class='inner-cap'><p>住戶訊息通知。</p><p>檢視您的個人訊息。</p></div>"><i
								style="font-size: 1rem;" class="fa-solid fa-bell"></i><label style="font-size: 1rem;">
								通知</label></button></a>
				</div>
			</ul>
			<!--導覽列 end-->
		</header>

		<!--!!固定!! 空白遮罩-->
		<div style="width: 100%; height:100px;"></div>

		<!--!!固定!! main area-->
		<div id="container">
			<main id="main-area">


				<!--主要內容 start(從這邊開始改)-->
				<input type="checkbox" hidden="" id="check123">
				<svg>
					<circle class="circle" fill="none" stroke="#68E534" stroke-width="20" cx="200" cy="200" r="190"
						stroke-linecap="round" transform="rotate(-90,200,200)"></circle>
					<polyline class="tick" fill="none" stroke="#68E534" stroke-width="24"
						points="88,214 173,284 304,138" stroke-linecap="round" stroke-linejoin="round"></polyline>
					<h2>匯款繳費已完成，</h2>
					<h2>請等待審核!</h2>
				</svg>
				<script>
					document.getElementById('check123').checked = true;
				</script>


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
						<li><a href=""></a> <img src="../../resources/front-end/assets/img/logo11_trans3.png" alt=""
								style="width: 70%"></li>
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