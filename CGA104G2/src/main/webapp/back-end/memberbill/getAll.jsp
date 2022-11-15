
<%@page import="com.memberbill.model.MemberBillService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.memberbill.model.*"%>
<%@ page import="com.memberbill.controller.*"%>
<!DOCTYPE html>

<!-- 後台查詢帳單的Table -->
<html>
<meta charset="UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>

</style>
<head>
<meta>
<style type="text/css">
	th,tr{
    	border: 1px solid #f5cac3;
  	  }
	th,tr{
		padding: 5px;
		text-align: center;
	  }
</style>
</head>
<body>
<form method="post" action="bill.do" name="form2" enctype="multipart/form-data">
	<th>所有帳單資料</th>
	<table id="table-1" class="table caption-top">
		<div>
			<select name="billDate2">
				<option disabled selected>請選擇帳單月份</option>
				<c:forEach var="vo2" items="${vo2}">
				<option  id="date" value="${vo2}">${vo2}</option>
				</c:forEach>
			</select>
			
			<select name="memberPayMethod">
				<option disabled selected>請選擇繳費方式</option>
				<option value="0">匯款</option>
				<option value="1">刷卡</option>
<%-- 				<c:forEach var="vo1" items="${vo1}"> --%>
<%-- 				<option  id="date" value="${vo1.billDate}">${vo1.memberPayMethod}</option> --%>
<%-- 				</c:forEach> --%>
			</select>
			
			<input type="hidden" name="action" value="select_Transfer">
			<input type="submit" value="查詢">
			
		</div>	
	</table>
</form>
	
		<table class="table caption-top">
		<thead>
			<tr>
				<th>住戶帳單編號</th>
				<th>住戶編號</th>
				<th>費用編號</th>
				<th>住戶姓名</th>
				<th>帳單金額</th>
				<th>帳單日期</th>
				<th>繳費狀態</th>
				<th>繳費日期</th>
				<th>繳費期限</th>
				<th>繳費方式</th>
				<th>修改人員</th>
				<th>修改時間</th>
				<th>上傳證明</th>
			</tr>
		</thead>

		<c:forEach var="memberBillVO" items="${list}" varStatus="s">
			<tr>
				<td>${memberBillVO.memberBillId}</td>
				<td>${memberBillVO.memberId}</td>
				<td>${memberBillVO.costId}</td>
				<td>${memberBillVO.memberName}</td>
				<td>${memberBillVO.billAmount}</td>
				<td>${memberBillVO.billDate}</td>
				<td>${memberBillVO.memberPay}</td>
				<td>${memberBillVO.memberPayDate}</td>
				<td>${memberBillVO.memberPayLimit}</td>
				<td>${memberBillVO.memberPayMethod}</td>
				<td>${memberBillVO.modifyUser}</td>
				<td>${memberBillVO.modifyDate}</td>
				<%-- 				<td>${memberBillVO.memberPhoto} --%>
				<td><img src="${pageContext.request.contextPath}/member/bill.do?action=memberphoto&memberBillId=${memberBillVO.memberBillId}" width="160px" hight="200px"></td>
			</tr>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/bill.do" style="margin-bottom: 0px;">
					<button type="button" id="edit${s.count}" class="btn btn-danger">編輯</button>
						<input type="submit" value="修改" class="btn btn-warning"> 
						<input type="hidden" name="memberBillId" value="${memberBillVO.memberBillId}"> 
						<input type="hidden" name="action" value="getOne_For_Update"> 
						
					<span>繳費狀態:</span>
					<select name="memberPay" disabled id="open${s.count}">
						<option value="1" selected>已繳費</option>
						<option value="0">未繳費</option>
						<option value="2">待審核</option>
					</select>
				</FORM>
			</td>
			<script>
			//TODO: 20221113 點擊編輯按鈕待修正
// 				let ed${s.count} = document.getElementById("edit${s.count}");
// 				let op${s.count} = document.getElementById("open${s.count}");
// 				ed${s.count}.addEventListener("click", function() {
// 					op${s.count}.disabled = false
// 				});
			</script>
		</c:forEach>
	</table>

</body>
</html>