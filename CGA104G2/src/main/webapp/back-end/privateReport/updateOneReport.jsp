<%@page import="com.privateReport1.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
session.getAttribute("privateReportVO1");
session.getAttribute("memberId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}

table, tr, th, td {
	border: 2px solid black;
}
</style>
<title>回覆單一檢舉頁面</title>
</head>
<body bgcolor="lightYellow">

	<div id="header">
		<h1 id="test">管理員回覆單一檢舉</h1>
	</div>

	<div id='select'>
		<table id="reportTable" style='border: 1px solid black'>
			<caption>
				<h2>檢舉編號 "${privateReportVO1.privateReportId}" 的項目</h2>
			</caption>
			<tr>
				<th>檢舉編號</th>
				<th>住戶名稱</th>
				<th>檢舉日期/時間</th>
				<th>檢舉表單內容</th>
				<th>檢舉內容附圖</th>
			</tr>
			<tr>
				<th>${privateReportVO1.privateReportId}</th>
				<th>${privateReportVO1.memberName}</th>
				<th>${privateReportVO1.privateReportTime}</th>
				<th>${privateReportVO1.privateReportContent}</th>
				<c:choose>
					<c:when test="${privateReportVO1.privateReportPic == null}">
						<th>無附圖</th>
					</c:when>
					<c:otherwise>
						<th>${privateReportVO1.privateReportPic}</th>
					</c:otherwise>
				</c:choose>
		</table>
	</div>

	<div>
		<form method="post"
			action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do"
			enctype="multipart/form-data">
			請填寫回覆內容:<br>
			<textarea name="replyOfReport" rows="5" cols="45" required></textarea>
		<p>
			回覆附圖:<br> <input type="file" accept="image/*" name="replyPic" value="點我上傳圖片">
		<p>
		<input type="hidden" name="privateReportId" value="${privateReportVO1.privateReportId}">
		<input type="hidden" name="memberId" value="${privateReportVO1.memberId}">
			<input type="hidden" name="privateReportStatus" value="1"> <input
				type="hidden" name="action" value="update"> <input
				type="submit" value="確定"> <input type="reset" value="清除">
			<input type="button" value="回上一頁" onClick="history.back()">
		</form>
	</div>
<div>
</div>

</body>
</html>