<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 String sessionId = (String)session.getAttribute("id");
 %>
<html>

<head>

<meta charset="UTF-8">
<title>後台首頁</title>

<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}
</style>
</head>

<body bgcolor="lightYellow">
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
			<input type="hidden" name="action" value="BackstageLogOut"> <input
				type="submit" value="登出" style="float: right">

		</div>
	</form>

	<div id="header">
		<h1>後台首頁</h1>
	</div>
	<div id="header">
		<h1>${backstageAccountVO.bmName}您好，歡迎登入後台管理系統！</h1>
	</div>
	<br>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageInfo.jsp">
		<input type="submit" value="管理員帳號與權限" style="margin-right: 122px;">
	</form>

	<form method="get" action="BackstageIndex.do">
		<input type="hidden" name="action" value="Member"> <span><input
			type="submit" value="住戶管理" style="margin-right: 122px;"></span>
	</form>

	<form method="get" action="BackstageIndex.do">
		<input type="hidden" name="action"
			value="BulletinBoard_And_AppointedStore"> <span><input
			type="submit" value="住戶佈告欄與特約商店管理" style="margin-right: 122px;"></span>
	</form>

	<form method="get" action="BackstageIndex.do">
		<input type="hidden" name="action" value="Guest"> <span><input
			type="submit" value="訪客管理" style="margin-right: 122px;"></span>
	</form>

	<form method="get" action="BackstageIndex.do">
		<input type="hidden" name="action" value="Community_Service">
		<span><input type="submit" value="社區服務管理"
			style="margin-right: 122px;"></span>
	</form>

	<form method="get" action="BackstageIndex.do">
		<input type="hidden" name="action" value="CashFlow_Management">
		<span><input type="submit" value="社區金流管理"></span>
	</form>

</body>

</html>