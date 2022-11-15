<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約頁面2</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<Style>
.form {
	
}
</Style>
</head>
<body>
	<table>
		<c:forEach items="${statime}" var="tmp" varStatus="loop">
			<c:if test="${tmp == 0}">
					<form METHOD="post" ACTION="../CGA104G2/ame_sta.do">
						<input type="hidden" name="action" value="doRecord3">
						<input type="hidden" name="ameid" value="${ameid}">
						<input type="hidden" name="ame_StaDate" value="${ame_StaDate}">
						<input type="hidden" name="statime" value="${statime}">
						<input type="hidden" name="statime_ind" value="${loop.index}">
						<input type="submit" value="${loop.index}:00" class="btn btn-success btn-lg"><br>
					</form>
			</c:if>
			<c:if test="${tmp == 1}">
					<button value="${loop.index}" disabled="disabled" class="btn btn-danger btn-lg">${loop.index}:00</button>
					<br>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>