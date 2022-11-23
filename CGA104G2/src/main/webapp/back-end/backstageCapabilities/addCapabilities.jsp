<%@page import="com.backstageCapabilities.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
BackstageCapabilitiesService backstageCapabilitiesSvc = new BackstageCapabilitiesService();
List<BackstageCapabilitiesVO> list = backstageCapabilitiesSvc.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>新增權限功能</title>
</head>
<body bgcolor="lightYellow">
	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
		<input type="hidden" name="action" value="BackstageLogOut">
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageCapabilities/listAllCapabilities.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="table-1">
		<tr>
			<td>
				<h3>權限功能新增</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<FORM METHOD="get"
		ACTION="<%=request.getContextPath()%>/back-end/backstageCapabilities/BackstageCapabilities.do"
		name="form1">
		<table>
			<tr>
				<td>權限功能名稱:</td>
				<td><input type="TEXT" name="bmCapabilitiesName" size="45"
					value="${param.bmCapabilitiesName}" /><span style="color: red">${errorMsgs.bmCapabilitiesName}</span></td>
			</tr>
			<tr>
				<td>權限功能內容:</td>
				<td><input type="TEXT" name="bmCapabilitiesContent" size="45"
					value="${param.bmCapabilitiesContent}" /><span style="color: red">${errorMsgs.bmCapabilitiesContent}</span></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>


</body>
</html>