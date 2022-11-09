<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.transfer.model.*"%>
<%@ page import="com.transfer.controller.*"%>

<%   List<TransferVO> list = (List) request.getAttribute("list");%>

<%= (list==null)? "true" : "false" %>

<!DOCTYPE html>
<html>
<head>
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
<style type="text/css">
	th{
    	border: 1px solid #f5cac3;
  	  }
	th{
		padding: 5px;
		text-align: center;
	  }
</style>
</head>

<body>
 	<th>匯款查詢頁面</th>
	<table class="table1 caption-top">
		<thead>
			<tr>
				<th>住戶編號</th>
				<th>住戶帳單編號</th>
				<th>銀行代號</th>
				<th>後五碼</th>
				<th>匯款時間</th>
				<th>繳費證明</th>
				<th>帳單月份</th>
				<th>繳費狀態</th>
				<th>繳費方式</th>
				<th>費用編號</th>
			</tr>
		</thead>
		
		<c:forEach var="TransferVO" items="${list}" varStatus="s" >
			<tr>
				<td>${TransferVO.memberId}</td>
				<td>${TransferVO.memberBillId}</td>
				<td>${TransferVO.bankId}</td>
				<td>${TransferVO.bankNumber}</td>
				<td>${TransferVO.bankDate}</td>
  				<td><img src="${pageContext.request.contextPath}/member/bill.do?action=memberphoto&memberBillId=${TransferVO.memberBillId}" width="160px" hight="200px"></td>
				<td>${TransferVO.billDate}</td>
				<td>${TransferVO.memberPay}</td>
				<td>${TransferVO.memberPayMethod}</td>
				<td>${TransferVO.costId}</td>
			</tr>
			
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/transfer" style="margin-bottom: 0px;">
					<button type="button" id="edit${s.count}" class="btn btn-danger">編輯</button>
						<input type="submit" value="修改" class="btn btn-warning"> 
						<input type="hidden" name="memberBillId" value="${TransferVO.memberBillId}"> 
						<input type="hidden" name="action" value="getOne_For_Update"> 
						
					<span>繳費狀態:</span>
					<select name="memberPay" disabled id="open${s.count}">
						<option value="1" selected>已繳費</option>
						<option value="0">未繳費</option>
						<option value="3">待審核</option>
					</select>
				</FORM>
			</td>
		</c:forEach>
	</table>
	<script>
				let ed${s.count} = document.getElementById("edit${s.count}");
				let op${s.count} = document.getElementById("open${s.count}");
				ed${s.count}.addEventListener("click", function() {
					op${s.count}.disabled = false
				});
			</script>
</body>
</html>