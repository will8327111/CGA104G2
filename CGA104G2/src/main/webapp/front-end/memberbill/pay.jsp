<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>
<%
List<MemberBillVO> listBillVos = (List) request.getAttribute("listBillVos");
%>

<%=(listBillVos == null) ? "true" : "false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
div { 
 	padding: 10px; 
 	text-align: center; 
 } 
.total-price-row {
    display: flex;
    justify-content: space-between;
    margin: 5px 0;
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
div,span {
    display: block;
    width: 100%;
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
    margin: 5px 0;

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
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    border-radius: 8px;
    background-color: #8e8686;
    color: #fff;
    -webkit-transition: background-color 0.1s ease-in;
    -moz-transition: background-color 0.1s ease-in;
    -ms-transition: background-color 0.1s ease-in;
    -o-transition: background-color 0.1s ease-in;
    transition: background-color 0.1s ease-in;
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
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
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
</style>
</head>
<body>
<div class="cart-container bg-light">
<h1 class="store-name">帳單明細</h1>

	<form action="<%=request.getContextPath()%>/member/bill.do"
		METHOD="post">

		<table class="table caption-top">
			<thead>
			
			<c:forEach var="memberBillVO" items="${listBillVos}">
				<div id="collapseSummary" class="summary-section">
				
				<div class="total-price-row" >
					<div class="total-line_name">帳單月份</div>
					<div class="total-line_price">${memberBillVO.billDate}</div>
				</div>
				<div class="total-price-row">
					<div>明細</div>
					<div>${memberBillVO.costName}</div>
				</div>
				<div class="total-price-row">
					<div>金額</div>
					<div>NT$ ${memberBillVO.billAmount}</div>
				</div>
				<hr>
				<div class="total-price-row">
					<div>合計:</div>
					<span id="total-price" class="total-line_price">NT$ ${memberBillVO.billAmount}</span>
				</div>
				 </div>
			</c:forEach>
			
			</thead>
		</table>
		<div>
			<button id="opener" type="button" class="btn w-100 mb-3 d-flex align-items-center voucher-toggle" data-toggle="modal" data-target="#voucherModal">
          <div class="d-flex flex-column align-items-start">
            <small class="font-weight-bold">前往繳費</small>
          </div>
        </button>
		</div>

		<div>
		<input type="hidden" name="action" value="transfer"> 
		<input type="submit" value="匯款">
		

		<input type="hidden" name="action" value="pay"> 
		<input type="submit" value="刷卡">
		</div>
	</form>
	</div>
</body>
</html>