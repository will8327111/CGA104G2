<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>後台管理員登入介面</title>
<style>
#border {
	border: 1px solid black;
}
;
</style>

</head>
<body bgcolor="lightYellow">
	<form method="get"
		action="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
		<div id="border">
			<div>
				帳號: <input type="text" name="bmAccount"><span> </span>
			</div>

			<div>
				密碼: <input type="text" name="bmPassword"><span> </span>
			</div>
			<div>
				<span> <input type="hidden" name="action"
					value="textForLogin"> <input type="submit" value="登入">
				</span>
			</div>
	</form>

	<form method="get">
		<div>
			<a
				href="http://localhost:8081/CGA104G2/back-end/backstageGetPassword/passwordForgotten.jsp">忘記密碼?</a>
		</div>
	</form>
	<div style="color: red">${errorMsgs}</div>
</body>
</html>