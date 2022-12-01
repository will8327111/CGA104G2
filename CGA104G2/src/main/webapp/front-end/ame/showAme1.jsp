<%@page import="java.util.List"%>
<%@ page import="com.ame.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	text-align: left;
}
img{
    width: 100%;
    height: 100%;
    object-fit:cover;
}
</style>
<meta charset="UTF-8">
<title>顯示</title>
</head>
<body>
	
	<table>
		<tr>
			<th>圖示</th>
			<th>詳解</th>
			
		</tr>

		<c:forEach var="ameVO" items="${list}">
			<tr>
				<td><img src="<%=request.getContextPath()%>/Amepho_Servlet?AME_ID=${ameVO.ameId}" ></td>
				<td><font size="6">公設編號 : </font> <font size="5">${ameVO.ameId} </font><br>
				<font size="6">點數需求 : </font><font size="5">${ameVO.amePoint} </font><br>
				<font size="6">公設名稱 : </font><font size="5">${ameVO.ameName} </font><br>
				<font size="6">開放時段 : </font><font size="5">${ameVO.ameOpening} </font><br>
				<font size="6">公設介紹 : </font><font size="5">${ameVO.ameIntroduce} </font></td>
				<td>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/ame_sta.do" style="margin-bottom: 0px;">
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