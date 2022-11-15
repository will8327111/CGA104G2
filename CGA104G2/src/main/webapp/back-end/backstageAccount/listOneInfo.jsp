<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>我的基本資料</title>
</head>
<body>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
		<input type="hidden" name="action" value="BackstageLogOut">
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageInfo.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table border="2">
		<tr>
			<h4>
				<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
			</h4>
			<caption>
				<h1>${backstageAccountVO.bmName}的基本資料</h1>
			</caption>
		</tr>
		<tr>
			<th>管理員編號</th>
			<th>管理員姓名</th>
			<th>帳號</th>
			<th>密碼</th>
			<th>電子郵件</th>
			<th>帳號狀態</th>

		</tr>
		<tr>
			<th>${backstageAccountVO.bmId}</th>
			<th>${backstageAccountVO.bmName}</th>
			<th>${backstageAccountVO.bmAccount}</th>
			<th>${backstageAccountVO.bmPassword}</th>
			<th>${backstageAccountVO.bmEmail}</th>
			<th>${backstageAccountVO.bmStatus}</th>
		</tr>
	</table>

</body>
</html>