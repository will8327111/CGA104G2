<%@page import="com.backstageCapabilities.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageCapabilitiesVO backstageCapabilitiesVO = (BackstageCapabilitiesVO) request.getAttribute("backstageCapabilitiesVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
    
<html>
<head>
<meta charset="UTF-8">
<title>權限功能修改完成!</title>
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

	<table border="2">
		<tr>
			<h4>
				<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
			</h4>
			<caption>
				<h1>"${backstageCapabilitiesVO.bmCapabilitiesName}"的權限功能修改完成</h1>
			</caption>
		</tr>
		<tr>
			<th>權限功能編號</th>
			<th>權限功能名稱</th>
			<th>權限功能內容</th>

		</tr>
		<tr>
			<th>${backstageCapabilitiesVO.bmCapabilitiesId}</th>
			<th>${backstageCapabilitiesVO.bmCapabilitiesName}</th>
			<th>${backstageCapabilitiesVO.bmCapabilitiesContent}</th>
		</tr>
	</table>

</body>
</html>