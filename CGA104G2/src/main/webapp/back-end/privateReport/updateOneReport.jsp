<%@page import="com.privateReport.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.getAttribute("privateReportVO1");
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
	<form method="get" action="">
		請填寫回覆內容:<br>
		<input type="hidden" name="ReplyOfReport">
		<textarea name="comment" rows="5" cols="45"></textarea>
		<p>
			回覆附圖:<br>
			<input type="hidden" name="ReplyPic">
			<textarea name="comment" rows="5" cols="45"></textarea>
			<span><input type="button" value="點我上傳圖片"></span>
		<p>
			<input type="button" value="確定"> <input type="reset"
				value="清除"> <input type="button" value="回上一頁"
				onClick="history.back()">
	</form>
</div>

</body>
</html>