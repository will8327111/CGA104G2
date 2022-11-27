<%@page import="com.memberLogin.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  MemberLoginVO memberLoginVO = (MemberLoginVO) request.getAttribute("memberLoginVO");
%>

<html>
<head>
<meta charset="UTF-8">
<title>住戶登入介面</title>
<style>
#border {
	border: 1px solid black;
}
;
</style>

</head>
<body>
	<form method="post" action="<%=request.getContextPath()%>/front-end/memberLogin/MemberLogin.do">
		<div id="border">
			<div>
				帳號: <input type="text" name="member_ac" ><span>
				</span>
			</div>
			<div>
				密碼: <input type="password" name="member_pw"><span>
				</span>
			</div>
			<br>
			<div>
				<input type="hidden" name="action" value="textForLogin"> <span>
					<input type="submit" value="登入">
				</span> <span><input type="submit" value="忘記密碼"></span>
			</div>
			<div style="color:red">${errorMsgs}</div>
	</form>


</body>
</html>