<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
BackstageAccountVO backstageAccountVO = (BackstageAccountVO) session.getAttribute("backstageAccountVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
--%>

<html>
<head>
<meta charset="UTF-8">
<title>修改管理員資料</title>
</head>
<body>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div>
		<input type="hidden" name="action" value="BackstageLogOut">
			<input type="submit" value="登出" style="float: right">
		</div>
	</form>

	<form method="get" action="<%=request.getContextPath()%>/back-end/backstageAccount/listAllInfo.jsp">
		<div>
			<input type="submit" value="返回上一頁">
		</div>
	</form>

	<table id="table-1">
		<tr>
			<td>
				<h3>管理員資料修改</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageIndex.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/BackstageAccountInfo.do" name="form1">
		<table>
			<tr>
				<td>管理員編號:<font color=red><b>*</b></font></td>
				<td>${param.bmId}</td>
			</tr>
			<tr>
				<td>管理員姓名:</td>
				<td><input type="TEXT" name="bmName" size="45"
					value="${param.bmName}" /><span style="color:red">${errorMsgs.bmName}</span></td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input type="TEXT" name="bmAccount" size="45"
					value="${param.bmAccount}" /><span style="color:red">${errorMsgs.bmAccount}</span></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="TEXT" name="bmPassword" size="45"
					value="${param.bmPassword}"><span style="color:red">${errorMsgs.bmPassword}</span></td>
			</tr>
			<tr>
				<td>電子郵件:</td>
				<td><input type="TEXT" name="bmEmail" size="45"
					value="${param.bmEmail}" /><span style="color:red">${errorMsgs.bmEmail}</span></td>
			</tr>
			<tr>
				<td>帳號狀態:</td>
				<td><select class="Status" name="bmStatus">
				<option value="0" ${(backstageAccountVO.bmStatus==0)? 'selected': ''}>停用</option>
				<option value="1" ${(backstageAccountVO.bmStatus==0)? 'selected': ''}>啟用</option>
				</select>
				</td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="bmId" value="${param.bmId}">
		<input type="submit" value="送出修改">
	</FORM>
</body>
</html>