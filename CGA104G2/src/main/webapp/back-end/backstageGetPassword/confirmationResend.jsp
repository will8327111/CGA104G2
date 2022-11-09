<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8" HTTP-EQUIV="Refresh"
	CONTENT="120; URL=passwordForgotten.jsp">
<title>驗證信已發送!</title>
<style>
table {
	background-color: lightBlue;
}

form {
	display: inline;
}
;
</style>

</head>
<body>
	<!-- 	<form method="get" -->
	<%-- 		action="<%=request.getContextPath()%>/back-end/backstageLogin.do"> --%>
	<!-- 		<input type="hidden" name="action " value="TimeTest" -->
	<!-- 			style="margin-left: 200px"> -->
	<!-- 	</form> -->


	<table border="1" width="500" height="300">
		<tr>
			<th>您好，驗證信已發送，請至信箱查收驗證碼： <br> 系統即將在<span
				style="color: red;">120</span>秒後跳轉回忘記密碼頁面!<br> <br> <br>

				<form method="get"
					action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
					
					請輸入驗證碼: <input type="text" name="confirmCode"> <br> <br>
					<div style="color: red">${sendMsgs}</div>
					
					<input type="hidden" name="action" value="sendConfirmation">
					<input id="1" type="submit" value="確認送出" style="margin-left: 100px">
				</form>

				<form method="get"
					action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
					<input type="submit" value="取消" style="margin-right: 100px">
				</form>
			</th>
	
		</tr>

	</table>

</body>
</html>