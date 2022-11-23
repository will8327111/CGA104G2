<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 0.5px solid blue;
}
th, td {
	padding: 10px;
	text-align: center;
}
</style>
</head>
<body>

<table>
		<tr>
			<td>
				<h1>顯示預約</h1>
				<h4>
					<a href="${pageContext.request.contextPath}/front-end/ame/showAme.jsp">回瀏覽頁</a>
				</h4>
			</td>
		</tr>
</table>

<table>
		<tr>
			<th>住戶編號</th>
			<th>公設編號</th>
			<th>預約日期</th>
			<th>預約時段</th>
			<th>預約人數</th>
		</tr>

		<c:forEach var="recordVO" items="${list}">
			<tr>
				<td>${recordVO.memberId}</td>
				<td>${recordVO.ameId}</td>
				<td>${recordVO.recordDate}</td>
				<td>${recordVO.recordStatime}</td>
				<td>${recordVO.recordCount}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>