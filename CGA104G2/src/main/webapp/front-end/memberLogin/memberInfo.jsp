<%@page import="com.memberLogin.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberLoginVO memberloginVO = (MemberLoginVO) request.getAttribute("memberloginVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>


<html>

<head>
<meta charset="UTF-8">
<title>登入成功頁面</title>

<style>
#memberInfo {
	border: 2px solid black;
	border-collapse: collapse;
}

tr, td {
	border: 2px solid black;
}
</style>
</head>

<body>
<form method="get" action="<%=request.getContextPath()%>/front-end/memberLogin/memberLogin.jsp">
	<div>
		<h1>${memberLoginVO.memberName}您好，歡迎登入住戶管理系統！</h1>
	</div>

	<table id="memberInfo" border="2">
		<tr>
			<caption>
				<h2>基本資料</h2>
			</caption>
		</tr>
		<tr>
			<th>住戶編號</th>
			<th>帳號</th>
			<th>密碼</th>
			<th>住戶姓名</th>
			<th>住戶暱稱</th>
			<th>住戶性別</th>
			<th>住戶棟別</th>
			<th>住戶email</th>
			<th>住戶手機</th>
			<th>住戶市話</th>
			<th>郵遞區號</th>
			<th>住戶住址</th>
			<th>住戶點數</th>
			<th>住戶頭貼</th>
			<th>加入時間</th>
			<th>住戶身份別</th>
			<th>帳號狀態</th>

		</tr>
		<tr>
			<th>${memberLoginVO.memberId}</th>
			<th>${memberLoginVO.memberAc}</th>
			<th>${memberLoginVO.memberPw}</th>
			<th>${memberLoginVO.memberName}</th>
			<th>${memberLoginVO.memberNickname}</th>
			<th>${memberLoginVO.memberSex}</th>
			<th>${memberLoginVO.memberBuilding}</th>
			<th>${memberLoginVO.memberEmail}</th>
			<th>${memberLoginVO.memberMobile}</th>
			<th>${memberLoginVO.memberTel}</th>
			<th>${memberLoginVO.memberPost}</th>
			<th>${memberLoginVO.memberAddress}</th>
			<th>${memberLoginVO.memberPoints}</th>
			<th>${memberLoginVO.memberPic}</th>
			<th>${memberLoginVO.regDate}</th>
			<th>${memberLoginVO.memberIdState}</th>
			<th>${memberLoginVO.acState}</th>
		</tr>
	</table>
	<br>
	<div>
		<input type="submit" value="登出" name="logOut">
	</div>
</form>
</body>

</html>