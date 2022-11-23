<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String code = (String)request.getAttribute("code"); 
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="121; 
url=<%=request.getContextPath()%>/back-end/backstageGetPassword/passwordForgotten.jsp">
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
<body bgcolor="lightYellow">

	<table border="1" width="500" height="300">
		<tr>
			<th>您好，驗證信已發送，請至信箱查收驗證碼： <br> 系統即將在<span id="result"
				style="color: red;"></span>秒後跳轉回忘記密碼頁面!<br> <br> <br>
				<form method="get"
					action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">

					請輸入驗證碼: <input type="text" name="confirmCode"> <br> <br>
					<div style="color: red">${sendMsgs}</div>

					<input type="hidden" name="action" value="sendConfirmation">
					<input type="hidden" name="code" value="<%= code %>">
					<input id="1" type="submit" value="確認送出" style="margin-left: 100px">
				</form>

				<form method="get"
					action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp">
					<input id="cancel" type="submit" value="取消" style="margin-right: 100px">
				</form>
			</th>

		</tr>
	</table>

	<script>
		
		var worker;
		var result = document.getElementById("result");
		var cancel = document.getElementById("cancel");
		window.onload = function() {
			if (window.Worker) {

				// 建立一個 Dedicated Worker
				worker = new Worker("../../resources/js/timeTest.js");
				// 監聽 worker 是否有回傳資料，有的話就執行
				worker.onmessage = function(e) {
					document.getElementById("result").innerHTML = e.data;
				};
				
			} else {
				console.log('不支援 Worker');
			}
		};
		cancel.onclick = function() {
			// 停止 worker 的執行
			worker.terminate();
		};

	</script>
</body>
</html>