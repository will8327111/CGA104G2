<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>
<%
MemberBillService service = new MemberBillService();
Integer memId = (Integer) request.getSession().getAttribute("memberId");
List<MemberBillVO> list = service.getAllCost(memId);
pageContext.setAttribute("list",list);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
</head>
<body>
<div class="cart-container bg-light">
<!-- <h1 class="store-name">帳單明細</h1> -->

	<form action="<%=request.getContextPath()%>/member/ecpay" METHOD="post">
	
		<div style="width:40%;margin:auto;border-radius:10px;margin-top:100px; box-shadow: 0px 0px 6px #b1a7a6;padding-bottom:50px" >
			<table class="table caption-top" >
			<hr style="position:relative;top:250px;background-color:#e6ccb2;height:3px;width:80%;margin:auto;border-radius:80px">
			<div style="position:relative;top:150px; border-bottom: 1px #dad7cd dashed;width:80%;margin:auto;"></div>
    		<tbody>	
					<c:forEach var="memberBillVO" items="${list}">
						
						<input type="hidden" name="memberBillId" value="${memberBillVO.memberBillId}"> 
						<div id="collapseSummary" class="summary-section" >
						<tr>
							<td><div style="font-size:20px;text-align:left;margin-left:10px;">項目明細</div></td>

						</tr>
						<tr>
							<td><div style="text-align:left;margin-left:100px;">管理費用</div></td>
							<td><div>NT$ ${memberBillVO.managementFees}</div></td>
						</tr>
						<tr>
							<td><div style="text-align:left;margin-left:100px;">車位清潔費用</div></td>
							<td><div>NT$ ${memberBillVO.parkingSpaceCleaningFee}</div></td>
						</tr>
						
						<tr>
							
							<td><div style="text-align:left;margin-left:100px;">合計</div></td>
							<td><div><span><input  name="sum" type='hidden' value="<c:out value="${memberBillVO.managementFees+ memberBillVO.parkingSpaceCleaningFee}"/>" style="broder:0" id="total-price" class="total-line_price">NT$ <c:out value="${memberBillVO.managementFees+ memberBillVO.parkingSpaceCleaningFee}" /></span></div></td>
						</tr>
				 		</div>
					</c:forEach>    	
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
		<script>
			
			</script>
			</body>
				</html>