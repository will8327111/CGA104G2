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
<title>權限功能列表</title>
</head>
<body>
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
		<div>
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
				<h1>權限功能列表</h1>
				<div>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageCapabilities/BackstageCapabilities.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="新增權限功能" style="float: right">
						<input type="hidden" name="action" value="insert">
					</FORM>
				</div>
			</caption>

		</tr>
		<tr>
		<tr>
			<th>權限功能編號</th>
			<th>權限功能名稱</th>
			<th>權限功能內容</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<c:forEach var="backstageCapabilitiesVO" items="${list}">
			<tr>
				<th>${backstageCapabilitiesVO.bmCapabilitiesId}</th>
				<th>${backstageCapabilitiesVO.bmCapabilitiesName}</th>
				<th>${backstageCapabilitiesVO.bmCapabilitiesContent}</th>
				<td>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageCapabilities/BackstageCapabilities.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="bmCapabilitiesId"
							value="${backstageCapabilitiesVO.bmCapabilitiesId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageCapabilities/BackstageCapabilities.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="bmCapabilitiesId" value="${backstageCapabilitiesVO.bmCapabilitiesId}"> 
							<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>