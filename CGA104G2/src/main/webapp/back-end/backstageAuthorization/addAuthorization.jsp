<%@page import="com.backstageAuthorization.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAuthorizationVO backstageAuthorizationVO = (BackstageAuthorizationVO) request.getAttribute("backstageAuthorizationVO");
%>
<%=backstageAuthorizationVO == null%>

<html> 
<head>
<meta charset="UTF-8">
<title>新增權限</title>
</head>
<body>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
		<div>
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAuthorization/listAllAuthorization.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="table-1">
		<tr>
			<td>
				<h3>權限新增</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do" name="form1">
		<table>
			<tr>
				<td>管理員編號:</td>
				<td><input type="TEXT" name="bmId" size="45"
					value="<%=(backstageAuthorizationVO == null) ? "" : "" %>" /></td>
			</tr>
			<tr>
				<td>權限功能編號:</td>
				<td><input type="TEXT" name="bmCapabilitiesId" size="45"
					value="<%=(backstageAuthorizationVO == null) ? "" : "" %>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
	</FORM>
	<div style="color: red">${errorMsgs}</div>

</body>
</html>