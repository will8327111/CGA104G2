<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>
<%
Integer memid = (Integer) session.getAttribute("ID");
%>
<% MemberBillVO memberBillVO = (MemberBillVO) request.getAttribute("memberBillVO");%>
<%= (memberBillVO==null)? "true" : "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style>
h1 {
    font-size: 1.8rem;
}
.h2, h2 {
    font-size: 1.2rem;
}
.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1.5rem;
}
*, :after, :before {
    box-sizing: border-box;
}

div ,td{
    display: block;
    font-weight: bold;

}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #ced4da;
    border-radius: 0.35rem;
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
.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1.5rem;
    border: 1px solid #ccd5ae;
    width: 50%;
    margin: auto;
    background: #d3d3d326;
    border-radius: 10px;
    border-style: dashed;
    
}
.dropzone.dz-clickable {
    cursor: pointer;
}
.img-uploader .dropzone {
    border-radius: 4px;
    border-color: #dcdcdc;
    color: #666;
    text-align: center;
    padding: 15px;
    background: #fdfdfd;
    border-style: dashed;
    box-shadow: inset 2px 7px 10px 0 rgb(0 0 0 / 3%);
}
.img-uploader .svg-icon {
    width: 50px;
    height: 50px;
    stroke-width: 0px;
    fill: #aaa;
}
.btn-danger {
    color: #fff;
    background-color: #8e9aaf;
    border-color: #8e9aaf;
}
.btn-check:focus+.btn-danger, .btn-danger:focus {
    color: #fff;
    background-color: #8e9aaf;
    border-color: #8e9aaf;
    box-shadow: 0 0 0 0.25rem #cbc0d3(225 83 97 / 50%);
}
.btn-primary {
    color: #fff;
    background-color: #0071e3;
    border-color: #0071e3;
}
</style>
</head>


<body>

	<%-- <input type="hidden" value="${billGroup2}" name="billGroup"> --%>
	
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="card-body" style="width:40%">
		<h3>銀行轉帳</h3>
      	<div id="bank-transfer-content" class="text-break">
	        <p style="text-align: center;font-size:25px;text-decoration:underLine">
	        	<span>匯款帳號</span>
	        </p>
	        <p style="text-align: center;">
	        	<span style="color: rgb(71, 85, 119);">中國信託銀行(822) 桃園分行</span>
	        </p>
	        <p style="text-align: center;">
	        	<span style="color: rgb(71, 85, 119);">帳號 808123456789</span>
	        </p>
	        <p style="text-align: center;">
	        	<span style="color: rgb(71, 85, 119);">戶名 提拔Me</span>
	        </p>
	        <hr style="width:60%;margin: 2% auto;">
	        	<p style="text-align: center;">◎使用銀行轉帳付款方式</p>
	        <p style="text-align: center;">務必在此頁面內回傳匯款明細/帳號後五碼</p>
	        <p style="text-align: center;">對帳無誤則不另行通知，系統將更改為已付款
	        	<span><img style="width:5%;margin-bottom:5px" src="https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f60a.svg"></span> 
	        </p>
		</div>
	</div>
	<div style="padding:0.2%;"></div>
		<div class="card-body" style="width:40%;">
			<h2>驗證您的付款狀態:</h2>
			<form method="post" action="<%=request.getContextPath()%>/member/ecpay" name="form2" enctype="multipart/form-data">
				<br>
					<div>
					
					
					<div class="img-uploader form-group">
					<div id="dropzone" class="dropzone dz-clickable" style="width:80%;height:30%;margin: auto auto 5% auto;">
					<div class="dz-default dz-message" style="padding-top:20px">
						<span>
							<svg class="svg-icon" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width:100px;height:100px" >
								<path d="M19.33,9.77A5.8,5.8,0,0,0,8.48,7.36a2.87,2.87,0,0,0-1.54-.44A2.92,2.92,0,0,0,4,9.82a4.16,4.16,0,0,0,1.49,8.05H9.12a.65.65,0,1,0,0-1.3H5.51a2.86,2.86,0,0,1-.65-5.65l.61-.14-.12-.62a1.66,1.66,0,0,1,0-.32,1.62,1.62,0,0,1,2.88-1l.72.88.4-1.07a4.51,4.51,0,0,1,8.73,1.57L18,11l.64,0a2.79,2.79,0,0,1-.11,5.57H14.69a.65.65,0,0,0,0,1.3h3.87a4.09,4.09,0,0,0,.77-8.1Z"></path>
								<path d="M11.93,21.32a.65.65,0,0,0,.65-.65V13.73l1.08,1.09a.7.7,0,0,0,.46.19.66.66,0,0,0,.46-.19.64.64,0,0,0,0-.92l-2.19-2.2h0l-.45-.46-.46.46h0l-2.2,2.2a.65.65,0,0,0,.92.92l1.09-1.09v6.94A.65.65,0,0,0,11.93,21.32Z"></path>
							</svg><br>
									<label for="file">上傳繳費收據:</label> 
									<input type="file" name="file" id="file" />
								</span>
							</div>
						</div>
					</div>
					
				<div>
				
				<jsp:useBean id="select2" class="com.memberbill.model.MemberBillService" />
				
				<!--  -->
				<!-- Example single danger button -->
				<div class="btn-group">
  					<button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
   						 請選擇帳單月份
  					</button>

  				<ul class="dropdown-menu" name="billDate">
   					<li>
   						<a class="dropdown-item" href="#" disabled selected value="memberBillId">
   							<c:forEach var="billDate" items="${list1}">
								<option  id="date" value="${billDate.memberBillId}">${billDate.billDate}</option>
							</c:forEach>
						</a>
					</li>
  				</ul>
				</div>
				<!--  -->
					
				<select name="billDate">
					<option disabled selected value="memberBillId">請選擇帳單月份</option>
					<c:forEach var="billDate" items="${list1}">
						<option  id="date" value="${billDate.memberBillId}">${billDate.billDate}</option>
					</c:forEach>
				</select>
				</div>
					<div>
						<jsp:useBean id="select" class="com.bank.model.BankService" />
						<span>匯款銀行:</span>
					
						<select name="bankId">
						<div class="btn-group">
							<option disabled selected value="請選擇銀行" type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
							</option>
							<c:forEach var="BankVO" items="${select.all}">
								<option class="dropdown-item"  value="${BankVO.bankId}">${BankVO.bankId}|${BankVO.bankName}</option>
							</c:forEach>
							</div>
						</select>
					</div>
		
					<table>
					<!--  -->
					<td>請輸入後五碼:</td>
						<div class="form-group">
							<div class="form-label-group">
								<input type="text" class="form-control reference_id-input" id="reference_id-input" name="reference_id" placeholder="匯款後五碼" maxlength="255" style="width:30%">
								<label for="reference_id-input" type="TEXT" name="bankNumber" id="five"></label>
								
								
								<td>請輸入後五碼:</td>
								<td><input type="TEXT" name="bankNumber" id="five" placeholder="請輸入後五碼"/></td>
							
							</div>
						</div>
					</table>
					
					<input type="hidden" value="${vo1.memberBillId}" name="memberBillId">
					<input type="hidden" name="action" value="insert">
					<input type="submit" value="提交" class="btn btn-primary">
				</div>
			</form>
		</div>
		 <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
    
    <script>
    
    
    
    
    </script>
</body>

</html>