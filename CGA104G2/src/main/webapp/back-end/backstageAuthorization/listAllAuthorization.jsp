<%@page import="com.backstageAuthorization.model.*"%>
<%@page import="com.backstageAccount.model.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
List<BackstageAuthorizationVO> list = backstageAuthorizationSvc.getAll();
pageContext.setAttribute("list", list);
%>

<html>
<head>
<meta charset="UTF-8">
<title>所有管理員權限功能</title>
</head>
<body>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
		<div>
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageInfo.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="backstageInfo" border="2" >
		<tr>
			<h4>
				<a
					href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
			</h4>

			<ul>
			
			<li>
				<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do">
					<b>選擇管理員姓名:</b> <select size="1" name="bmId">
						<c:forEach var="backstageAuthorizationVO" items="${list}">
							<option value="${backstageAuthorizationVO.bmId}">${backstageAuthorizationVO.bmName}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
				</FORM>
				</li>
			</ul>

			<caption>
				<h2>所有管理員權限功能</h2>
				<div>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/addAuthorization.jsp"
						style="margin-bottom: 0px;">
						<input type="submit" value="新增權限" style="float: right"> <input
							type="hidden" name="action" value="insert">
					</FORM>
				</div>
			</caption>
		</tr>
		<c:forEach var="backstageAuthorizationVO" items="${list}">
		
			<tr>
				<th>管理員編號</th>
				<th>管理員姓名</th>
				<th>權限功能編號</th>
				<th>權限功能名稱</th>
				<th>權限功能內容</th>
				<th>刪除</th>

			</tr>
			<tr>
				<th>${backstageAuthorizationVO.bmId}</th>
				<th>${backstageAuthorizationVO.bmName}</th>
				<th>${backstageAuthorizationVO.bmCapabilitiesId}</th>
				<th>${backstageAuthorizationVO.bmCapabilitiesName}</th>
				<th>${backstageAuthorizationVO.bmCapabilitiesContent}</th>
				<td>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="bmId" value="${backstageAuthorizationVO.bmId}"> <input
							type="hidden" name="bmCapabilitiesId"
							value="${backstageAuthorizationVO.bmCapabilitiesId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>