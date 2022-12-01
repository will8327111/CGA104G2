<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>
<%@ page import="com.memberLogin.model.*"%>
<%
	MemberBillService service = new MemberBillService();
	Integer memId = (Integer) request.getSession().getAttribute("memberId");
	MemberBillVO one = service.getOneCost(memId);
// 	pageContext.setAttribute("list",list);
//   MemberLoginVO memberLoginVO = (MemberLoginVO) request.getSession().getAttribute("memberLoginVO");
//   Integer memId = (Integer) memberLoginVO.getMemberId();
%>

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
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<!--=============Google Font ===============-->
	<link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
	<!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
	<link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

	<!--==============css===============-->
	<!--font awesome kit-->
	<script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
	<!--!!固定!! 前台樣式-->
	<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
	<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">

	<!--modaal-->
	<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/modaal.min.css">

	<!--=============js=============-->
	<!--延遲載入-->
	<script src="../../resources/front-end/assets/js/lazyload.min.js"></script>

	<!--==============這邊放自己的 css===============-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
	<style>
		h1{
			color: #7d7d7d;
		}
		div {
			padding: 10px;
			text-align: center;
			font-weight: bold;
			font-family: "Montserrat","Open Sans","Helvetica Neue", Helvetica, Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun, sans-serif;
		}
		.total-price-row {
			display: flex;
			justify-content: space-between;
			margin: 5px 0;
			width: 50%;
		}
		.total-price-row .total-line_name {
			max-width: 70%;
		}
		hr {
			margin-top: 1rem;
			margin-bottom: 1rem;
			border: 0;
			border-top: 1px solid rgba(0,0,0,.1);
		}
		@media (min-width: 992px)
			.d-lg-block {
				display: block!important;
			}
			.total-price-row .total-line_price {
				font-weight: 500;
			}
			*, :after, :before {
				box-sizing: border-box;
			}
			div,span{
				display: block;
				width: 100%;
				font-size: 16px;
			}
			.summary-section #total-price,h1 {
				font-size: 1.8rem;
			}
			*, :after, :before {
				box-sizing: border-box;
			}
			.total-price-row {
				display: flex;
				justify-content: space-between;
				margin: 5px auto;
				width: 80%;

			}
			@media (min-width: 993px)
				.checkout-container .cart-container {
					width: 45%;
				}
				body {
					margin: 0;
					font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,Liberation Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;
					font-size: 1rem;
					font-weight: 400;
					line-height: 1.5;
					color: #212529;
					text-align: left;
					background-color: #fff;
				}
				.cart-drawer .cart-drawer-wrapper .cart-drawer-content .cart-sticky-button .btn.checkout {
					width: 100%;
					margin-bottom: 0 !important;
					border-radius: 0;
					padding: 18px 35px;
					display: flex;
					justify-content: center;
					align-items: center;
					color: #fff;
					background-color: #C1B9AF;
				}

				.btn.checkout {
					min-width: 180px;
					letter-spacing: 1.3px;
				}
				.update-cart, .checkout {
					margin-bottom: 10px !important;
				}
				.btn, input[type="submit"], .btn--tertiary, input.btn--tertiary, .btn--secondary, input.btn--secondary {
					font-family: Arial,"Helvetica Neue",Helvetica,sans-serif;
					font-weight: bold;
					font-size: 1.2em;
					box-shadow: 0px 2px 15px rgb(0 0 0 / 40%);
					display: inline-block;
					padding: 12px 34px;
					margin: 0;
					margin-bottom: 3px;
					line-height: 1.42;
					text-decoration: none;
					text-align: center;
					vertical-align: middle;
					white-space: nowrap;
					cursor: pointer;
					border: 1px solid transparent;
					user-select: none;
					-webkit-appearance: none;
					-moz-appearance: none;
					border-radius: 8px;
					background-color: #8e8686;
					color: #fff;
					transition: background-color 0.1s ease-in;
				}

				.btn:hover {
					background-color: lightgrey;
					border: lightgrey 1px solid;
					transition: 0.1s ease-in;
					position: relative;
					top: 1px;
					right: 1px;
					color: black;
				}

				button, input[type="submit"] {
					cursor: pointer;
				}
				button, input[type="text"], input[type="search"], input[type="password"], input[type="email"], input[type="file"], input[type="number"], input[type="tel"], input[type="submit"], textarea {
					-webkit-appearance: none;
					-moz-appearance: none;
				}
				input, textarea, button, select {
					font-size: 1em;
				}
				button {
					overflow: visible;
				}
				body, input, textarea, button, select {
					font-size: 12px;
					line-height: 1.7;
					font-family: Arial,"Helvetica Neue",Helvetica,sans-serif;
					color: #333;
					-webkit-font-smoothing: antialiased;
					-webkit-text-size-adjust: 100%;
				}
				*, *:after, *:before {
					outline: none;
				}
				*, input, :before, :after {
					-webkit-box-sizing: border-box;
					-moz-box-sizing: border-box;
					box-sizing: border-box;
				}

				button {
					appearance: auto;
					writing-mode: horizontal-tb !important;
					text-rendering: auto;
					color: buttontext;
					letter-spacing: normal;
					word-spacing: normal;
					line-height: normal;
					text-transform: none;
					text-indent: 0px;
					text-shadow: none;
					display: inline-block;
					text-align: center;
					align-items: flex-start;
					cursor: default;
					box-sizing: border-box;
					background-color: buttonface;
					margin: 0em;
					padding: 1px 6px;
					border-width: 2px;
					border-style: outset;
					border-color: buttonborder;
					border-image: initial;
				}



				.modal-footer {
					display: flex;
					flex-wrap: wrap;
					flex-shrink: 0;
					align-items: center;
					justify-content: space-between;
					padding: 0.75rem;
					border-top: 1px solid #dee2e6;
					border-bottom-right-radius: calc(0.3rem - 1px);
					border-bottom-left-radius: calc(0.3rem - 1px);
				}
				tbody, td, tfoot, th, thead, tr ,div{
					border-style: none;
				}
				[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
					cursor: pointer;
				}
				.dropdown-toggle {
					white-space: nowrap;
				}
				.btn-secondary {
					color: #fff;
					background-color: #6c757d;
					border-color: #6c757d;
				}
				.modal-backdrop {
					height:80px;
					width:100%;
					background-color:#fff;
					opacity: 5%;
				}
					.modal-dialog {
						max-width: 500px;
						margin: 6rem auto;
					}

	</style>
	<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
	<link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">
	<!--==============css===============-->
	<style>
		/*!!固定!! 字形*/
		@font-face {
			font-family: 'huninn';
			src: url('../../resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype");
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
			<h1><a href="../../front-end/web/front-index2.html"><img src="../../resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
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
<div id="container">
	<main id="main-area">


		<!--主要內容 start(從這邊開始改)-->
		<div class="cart-container bg-light">
			<!-- <h1 class="store-name">帳單明細</h1> -->
			<h3 style="width: 40% ;margin: auto;font-size: 1.75rem;text-align:left">本期 2022-12月帳單</h3>
			<form action="<%=request.getContextPath()%>/member/ecpay" METHOD="post">

				<div style="width:40%;margin:auto;border-radius:10px;margin-top:20px; box-shadow: 0px 0px 6px #b1a7a6;padding-bottom:50px" >
					<table class="table caption-top" >
						<hr style="position:relative;top:250px;background-color:#e6ccb2;height:3px;width:80%;margin:auto;border-radius:80px">
						<div style="position:relative;top:150px; border-bottom: 1px #dad7cd dashed;width:80%;margin:auto;"></div>
						<tbody>
<%-- 						<c:forEach var="memberBillVO" items="${list}"> --%>

							<input type="hidden" name="memberBillId" value="<%= one.getMemberBillId() %>">
							<div id="collapseSummary" class="summary-section" >
								<tr>
									<td><div style="font-size:20px;text-align:left;margin-left:10px;">項目明細</div></td>

								</tr>
								<tr>
									<td><div style="text-align:left;margin-left:100px;">管理費用</div></td>
									<td><div>NT$ <%= one.getManagementFees() %></div></td>
								</tr>
								<tr>
									<td><div style="text-align:left;margin-left:100px;">車位清潔費用</div></td>
									<td><div>NT$ <%= one.getParkingSpaceCleaningFee() %></div></td>
								</tr>

								<tr>

									<td><div style="text-align:left;margin-left:100px;">合計</div></td>
									<td><div><span><input  name="sum" type='hidden' value="<%= one.getParkingSpaceCleaningFee()+one.getManagementFees() %>" style="broder:0" id="total-price" class="total-line_price">NT$<%= one.getParkingSpaceCleaningFee()+one.getManagementFees() %> </span></div></td>
								</tr>
							</div>
<%-- 						</c:forEach> --%>
						</tbody>
					</table>

					<div id="result">
						${result}
					</div>

					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">前往繳費</button>
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">請選擇繳費方式</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
								</div>
								<div class="modal-body" style="margin-top:30px">
									<button type="submit" class="btn btn-primary" name="action"
											value="transfer" style="margin-right:50px">匯款</button>
									<button type="submit" class="btn btn-primary" name="action"
											value="buyToken">刷卡</button>
									<div class="modal-footer" name="select_Transfer_Pay" style="padding-left:75%;margin-top: 50px">
										<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal" >取消</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
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
<!--apang 動畫-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!--Tippy-->
<script src="https://unpkg.com/popper.js@1"></script>
<script src="https://unpkg.com/tippy.js@5"></script>

<!--other-->
<script src="../../resources/front-end/assets/js/modaal.min.js"></script>
<script src="../../resources/front-end/assets/js/script.js"></script>

<!--背景線延伸效果-->
<script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>

</body>

</html>