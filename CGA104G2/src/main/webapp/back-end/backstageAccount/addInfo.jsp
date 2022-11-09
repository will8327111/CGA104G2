<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAccountVO backstageAccountVO = (BackstageAccountVO) session.getAttribute("backstageAccountVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta charset="UTF-8">
<title>新增管理員資料</title>
</head>
<body>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
		<div>
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/listAllInfo.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="table-1">
		<tr>
			<td>
				<h3>管理員資料新增</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<FORM METHOD="get" ACTION="BackstageAccountInfo.do" name="form1">
		<table>
			<tr>
				<td>管理員姓名:</td>
				<td><input type="TEXT" name="bmName" size="45"
					value="<%=(backstageAccountVO == null) ? "王大明" : ""%>" /><span style="color: red">${errorMsgs}</span></td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input type="TEXT" name="bmAccount" size="45"
					value="<%=(backstageAccountVO == null) ? "iam87" : ""%>" /></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="TEXT" name="bmPassword" size="45"
					value="<%=(backstageAccountVO == null) ? "9487843" : ""%>"></td>
			</tr>
			<tr>
				<td>電子郵件:</td>
				<td><input type="TEXT" name="bmEmail" size="45"
					value="<%=(backstageAccountVO == null) ? "9487@gmail.com" : ""%>" /></td>
			</tr>
			<tr>
				<td>帳號狀態:</td>
				<td><input type="TEXT" name="bmStatus" size="45"
					value="<%=(backstageAccountVO == null) ? "1" : ""%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="hidden" name="bmId"> <input type="submit"
			value="送出新增">
	</FORM>
<div style="color: red">${errorMsgs}</div>

</body>
</html>