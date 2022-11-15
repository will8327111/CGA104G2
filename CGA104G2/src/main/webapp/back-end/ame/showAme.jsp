<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ame.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
AmeService ameSvc = new AmeService();
List<AmeVO> list = ameSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 0.5px solid blue;
}

th, td {
	padding: 10px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>顯示</title>
</head>
<body>
	<table >
		<tr>
			<td>
				<h1>顯示</h1>
				<h4>
					<a href="/CGA104G2/back-end/ame/First.jsp">回首頁喔</a>
				</h4>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>編號</th>
			<th>名稱</th>
			<th>介紹</th>
			<th>圖片</th>
			<th>點數</th>
			<th>人數</th>
			<th>開放時段</th>
		</tr>

		<c:forEach var="ameVO" items="${list}">
			<tr>
				<td>${ameVO.ameId}</td>
				<td>${ameVO.ameName}</td>
				<td>${ameVO.ameIntroduce}</td>
				<td><img src="<%=request.getContextPath()%>/Amepho_Servlet?AME_ID=${ameVO.ameId}" width="200"></td>
				<td>${ameVO.amePoint}</td>
				<td>${ameVO.ameMax}</td>
				<td>${ameVO.ameOpening}</td>
				<td>
					<form METHOD="post" ACTION="../../ame/ame_sta.do" style="margin-bottom: 0px;">
						<input type="hidden" name="action" value="doRecord">
						<input type="hidden" name="ameid" value="${ameVO.ameId}"> 
						<input type="submit" value="我要預約">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

<!-- 	<script> 
		window.history.replaceState(null, null, window.location.href);
 	</script>  -->
</body>
</html>