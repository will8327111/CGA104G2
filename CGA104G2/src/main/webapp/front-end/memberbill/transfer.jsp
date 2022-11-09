<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer memid = (Integer) session.getAttribute("ID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
h1{
	background-color:#b38d97;
    text-align: center;
  }
h2 {
    color:#9d8189;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: #dde5b6;
    display: inline;
  }
</style>

<style>
  div{
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th,label,span ,td,select{
    border: 1px solid #f5cac3;
  }
  label,span ,td{
    padding: 5px;
    text-align: center;
  }
</style>
</head>


<body>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	
	<h1>銀行轉帳</h1>
	<h2>匯款帳號</h2>
	<h2>中國XX銀行(822) XX分行</h2>
	<h2>帳號 808123456789</h2>
	<h2>戶名 XXX</h2>
	<h2>‧使用銀行轉帳付款方式</h2>
	<h2>務必在此頁面內回傳匯款明細/帳號後五碼</h2>
	<h2>對帳無誤則不另行通知，系統將更改為已付款</h2>


	<h1>驗證您的付款狀態:</h1>
	<div>
		<form method="post" action="<%=request.getContextPath()%>/transfer" name="form2" enctype="multipart/form-data"><br>
			<label for="file">上傳繳費收據:</label> 
			<input type="file" name="file" id="file" /> 	
	<div>
		<span>帳單月份:</span>
		<jsp:useBean id="select2" class="com.memberbill.model.MemberBillService" />
			
		<select name="billDate">
			<option disabled selected value="null">請選擇帳單月份</option>
			<c:forEach var="billDate" items="${billDateList}">
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
				<td><input type="TEXT" name="bankNumber" id="five" onblur="ShowNumber()" placeholder="請輸入後五碼"/></td>
			</tr>
		</table>
		
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出資料">
	</form>
		</div>
		
	<script>
	</script>
</body>

</html>