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
<style>
h1 {
    font-size: 1.8rem;
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
	<div class="card-body">
		<h3>銀行轉帳</h3>
      	<div id="bank-transfer-content" class="text-break">
	        <p style="text-align: center;">
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
	        <p style="text-align: center;">
	        	<p>◎使用銀行轉帳付款方式</p>
	        <p style="text-align: center;">務必在此頁面內回傳匯款明細/帳號後五碼</p>
	        <p style="text-align: center;">對帳無誤則不另行通知，系統將更改為已付款
	        	<span class="fr-emoticon fr-deletable fr-emoticon-img" style="background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f60a.svg);">&nbsp;</span> 
	        </p>
		</div>
		<div class="card-body" >
			<h2>驗證您的付款狀態:</h2>
			<form method="post" action="<%=request.getContextPath()%>/member/ecpay" name="form2" enctype="multipart/form-data">
				<br>
				<div>
					<label for="file">上傳繳費收據:</label> 
					<input type="file" name="file" id="file" />
					<div>
<!-- 						<table class="table caption-top"> -->
<!-- 							<tr> -->
<!-- 								<td>帳單月份:</td> -->
<%-- 								<td>${memberBillVO.billDate}</td> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
				<jsp:useBean id="select2" class="com.memberbill.model.MemberBillService" />
					
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
							<option disabled selected value="請選擇銀行"></option>
							<c:forEach var="BankVO" items="${select.all}">
								<option value="${BankVO.bankId}">${BankVO.bankId}|${BankVO.bankName}</option>
							</c:forEach>
						</select>
					</div>
		
					<table>
						<tr>
							<td>請輸入後五碼:</td>
							<td><input type="TEXT" name="bankNumber" id="five" placeholder="請輸入後五碼"/></td>
						</tr>
					</table>
					<input type="hidden" value="${vo1.memberBillId}" name="memberBillId">
					<input type="hidden" name="action" value="insert">
					<input type="submit" value="送出資料">
				</div>
			</form>
		</div>
	<script>
	
	</script>
</body>

</html>