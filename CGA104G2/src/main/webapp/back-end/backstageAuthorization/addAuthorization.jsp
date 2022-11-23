<%@page import="com.backstageAuthorization.model.*"%>
<%@page import="com.backstageAccount.model.*"%>
<%@page import="com.backstageCapabilities.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAuthorizationService backstageAuthorizationSvc = new BackstageAuthorizationService();
List<BackstageAuthorizationVO> list3 = backstageAuthorizationSvc.getBmIdAndBmName();
session.setAttribute("list3", list3);// 設定Authorization的getAll集合
%>
<%
BackstageAuthorizationService backstageAuthorizationSvc2 = new BackstageAuthorizationService();
List<BackstageAuthorizationVO> list4 = backstageAuthorizationSvc2.getBmCapIdAndBmCapName();
pageContext.setAttribute("list4", list4);// 設定Authorization的getAll集合
%>


<html> 
<head>
<meta charset="UTF-8">
<title>新增權限</title>
</head>
<body bgcolor="lightYellow">
	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
		<input type="hidden" name="action" value="BackstageLogOut">
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

	<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/back-end/backstageAuthorization/BackstageAuthorization.do">
		<table>
			<tr>
				<td>管理員姓名:</td>
				
				<td>
				<select name="bmId">
				<c:forEach var="backstageAuthorizationVO" items="${list3}">
				<option value="${backstageAuthorizationVO.bmId}">${backstageAuthorizationVO.bmName}</option>
				</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>權限功能名稱:</td>
				<td>
				<select name="bmCapabilitiesId">
				<c:forEach var="backstageAuthorizationVO" items="${list4}">
				<option value="${backstageAuthorizationVO.bmCapabilitiesId}">${backstageAuthorizationVO.bmCapabilitiesName}</option>
				</c:forEach>
				</select></td>
			</tr>
			
			
		</table>
		<br> <input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
	</FORM>
	<div style="color: red">${errorMsgs}</div>

</body>
</html>