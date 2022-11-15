<%@page import="com.backstageCapabilities.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
BackstageCapabilitiesVO backstageCapabilitiesVO = (BackstageCapabilitiesVO) session.getAttribute("backstageCapabilitiesVO"); 
--%>

<html>
<head>
<meta charset="UTF-8">
<title>修改功能頁面</title>
</head>
<body>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
		<input type="hidden" name="action" value="BackstageLogOut">
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageCapabilities/listAllCapabilities.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="table-1">
		<tr>
			<td>
				<h3>權限功能修改</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/back-end/backstageCapabilities/BackstageCapabilities.do" name="form1">
		<table>
			<tr>
				<td>權限功能編號:<font color=red><b>*</b></font></td>
				<td>${param.bmCapabilitiesId}</td>
			</tr>
			<tr>
				<td>權限功能名稱:</td>
				<td><input type="TEXT" name="bmCapabilitiesName" size="45"
					value="${param.bmCapabilitiesName}" /><span style="color:red">${errorMsgs.bmCapabilitiesName}</span></td>
			</tr>
			<tr>
				<td>權限功能內容:</td>
				<td><input type="TEXT" name="bmCapabilitiesContent" size="45"
					value="${param.bmCapabilitiesContent}" /><span style="color:red">${errorMsgs.bmCapabilitiesContent}</span></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="bmCapabilitiesId" value="${param.bmCapabilitiesId}">
		<input type="submit" value="送出修改">
	</FORM>

</body>
</html>