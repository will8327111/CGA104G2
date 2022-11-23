<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>信箱驗證成功頁面</title>
<style>
font{
font-weight:bold;
};
</style>
</head>
<body bgcolor="lightYellow">
	${backstageAccountVO.bmName}您好，驗證碼已驗證成功，請牢記原密碼並至首頁重新登入！
	<table border="10" width="500" height="10">
		<tr>
			<td>您的原密碼是: <font color="red"> ${backstageAccountVO.bmPassword}</td>
		</tr>
	</table>

	<h4>
		<a
			href="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">回登入頁面</a>
	</h4>
	
</body>
</html>