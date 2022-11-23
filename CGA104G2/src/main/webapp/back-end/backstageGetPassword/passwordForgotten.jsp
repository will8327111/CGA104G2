<%@page import="com.backstageAccount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼驗證</title>
</head>
<body bgcolor="lightYellow">
	<table border="1" cellpadding="5"
		style="border: 2px #black solid; text-align: center;">
		<tr>
			<th colspan="2">忘記密碼了嗎?
			<th>
		</tr>

		<tr>
			<th>
				<FORM METHOD="get"
					ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.do">
					<div>
						原帳號: <input type="text" name="bmAccount">
					</div>
					<br>
					<div>
						原Email: <input type="text" name="bmEmail">
					</div>
			</th>
		</tr>
		<tr>
			<th>
				<div>
					<input type="hidden" name="action" value="passwordForgotten">
					<input type="submit" name="confirmation" value="寄送驗證碼"
						style="float: left">
				</div>
				</FORM>

				<FORM METHOD="get"
					ACTION="<%=request.getContextPath()%>/back-end/backstageAccount/backstageLogin.jsp"
					style="margin-bottom: 0px;">
					<input type="submit" value="取消">
				</FORM>
			</th>
		</tr>

	</table>
	<div style="color: red">${sendMsgs}</div>

</body>
</html>