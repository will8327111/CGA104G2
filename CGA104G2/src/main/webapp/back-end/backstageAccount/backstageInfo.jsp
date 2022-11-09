<%@page import="com.backstageAccount.model.*"%>
<%@page import="com.backstageAuthorization.model.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
BackstageAccountVO backstageAccountVO = (BackstageAccountVO) session.getAttribute("backstageAccountVO");
%>
<%=backstageAccountVO == null%>
<html>

<head>
<meta charset="UTF-8">
<title>管理員帳號與權限</title>

<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}

tr, td {
	border: 2px solid black;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>

<body>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
		<div>
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<div id="header">
		<h1>管理員帳號及權限管理 </h1>
		<h1>${backstageAccountVO.bmId}</h1>
	</div>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/listOneInfo.jsp">
		<div>
			<input type="hidden" name="bmId" value="${backstageAccountVO.bmId}">
			<input type="submit" value="我的資訊">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do">
		<div>
			<input type="hidden" name="action" value="getAll"> <input
				type="submit" value="所有管理員資訊">
		</div>
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do">
		<div>
		<input type="hidden" name="bmId"  value="${backstageAccountVO.bmId}">
			<input type="hidden" name="action" value="getOne_for_Authorization"><input
					type="submit" value="我的權限">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do">
		<div>
			<input type="hidden" name="action" value="getAll">
			<input type="submit" value="所有管理員權限功能">
		</div>
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageCapabilities/BackstageCapabilities.do">
			<div>
				<input type="hidden" name="action" value="getAll"> <input
					type="submit" value="權限功能列表">
			</div>
	</form>

</body>

</html>