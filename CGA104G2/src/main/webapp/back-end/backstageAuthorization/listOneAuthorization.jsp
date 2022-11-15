<%@page import="com.backstageAccount.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer bmId = (Integer) session.getAttribute("bmId");
BackstageAccountService backstageAccountSvc = new BackstageAccountService(); // List
List<BackstageAccountVO> list = backstageAccountSvc.findOneAuthorization(bmId); //
pageContext.setAttribute("list", list);
%>

<html>
<head>
<meta charset="UTF-8">
<title>我的權限功能</title>
</head>
<body>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
			<input type="hidden" name="action" value="BackstageLogOut"> <input
				type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageInfo.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table border="2">
		<tr>
			<h4>
				<a
					href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
			</h4>
			<caption>
				<h1>${backstageAccountVO.bmName}的權限</h1>
			</caption>
		</tr>
		<c:forEach var="backstageAccountVO" items="${list}">
			<tr>
				<th>權限功能編號</th>
				<th>權限功能名稱</th>
				<th>權限功能內容</th>

			</tr>
			<tr>
				<th>${backstageAccountVO.bmCapabilitiesId}</th>
				<th>${backstageAccountVO.bmCapabilitiesName}</th>
				<th>${backstageAccountVO.bmCapabilitiesContent}</th>
			</tr>
		</c:forEach>
	</table>

</body>
</html>