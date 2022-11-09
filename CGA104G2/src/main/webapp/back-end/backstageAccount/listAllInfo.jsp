<%@page import="com.backstageAccount.model.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
BackstageAccountService backstageAccountSvc = new BackstageAccountService();
List<BackstageAccountVO> list = backstageAccountSvc.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>管理員基本資料</title>
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

	<table id="backstageInfo" border="2">
		<tr>
			<h4>
				<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
			</h4>
			<caption>
				<h2>所有管理員基本資料</h2>
				<div>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/addInfo.jsp"
						style="margin-bottom: 0px;">
						<input type="submit" value="新增管理員" style="float: right"> <input type="hidden"
							name="action" value="insert">
					</FORM>
				</div>
			</caption>
		</tr>
		<c:forEach var="backstageAccountVO" items="${list}">
			<tr>
				<th>管理員編號</th>
				<th>管理員姓名</th>
				<th>帳號</th>
				<th>密碼</th>
				<th>電子郵件</th>
				<th>帳號狀態</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
			<tr>
				<th>${backstageAccountVO.bmId}</th>
				<th>${backstageAccountVO.bmName}</th>
				<th>${backstageAccountVO.bmAccount}</th>
				<th>${backstageAccountVO.bmPassword}</th>
				<th>${backstageAccountVO.bmEmail}</th>
				<th>${backstageAccountVO.bmStatus}</th>
				<td>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="bmId" value="${backstageAccountVO.bmId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="get"
						ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="bmId" value="${backstageAccountVO.bmId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>