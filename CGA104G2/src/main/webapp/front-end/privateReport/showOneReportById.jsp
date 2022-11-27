<%@page import="com.privateReport1.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.getAttribute("privateReportVO1");
%>

<html>
<head>
<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}

table, tr, th, td {
	border: 2px solid black;
}

form {
	margin: 0px;
	display: inline;
	padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>私人檢舉頁面</title>
</head>

<body bgcolor="lightYellow">

	<div id="header">
		<h1 id="test">您好，這裡是住戶檢舉頁面！</h1>
	</div>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
		<b>請選擇: </b> <select name="privateReportStatus">
			<option value="1"
				${(privateReportVO1.privateReportStatus == 1) ? 'selected' : '' }>瀏覽已完成檢舉</option>
			<option value="0"
				${(privateReportVO1.privateReportStatus == 0) ? 'selected' : '' }>瀏覽未完成檢舉</option>
		</select> <input type="hidden" name="action" value="getAllSelected"> <input
			type="submit" value="確定">
	</form>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
		<b> 依表單編號查詢: </b><input type="text" name="privateReportId"> <input
			type="hidden" name="memberAc" value="EreYea1"> <input
			type="hidden" name="action" value="getOneReportById2"> <input
			type="submit" value="送出">
	</form>

	<a
		href="<%=request.getContextPath()%>/front-end/privateReport/showReport.jsp">
		<button>返回所有檢舉列表</button>
	</a>

	<form method="get"
		action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
		<input type="hidden" name="action" value="toReport"><input
			type="hidden" name="memberAc" value="EreYea1"> <input
			type="submit" value="我要檢舉" style="width: 100px; height: 50px;">
	</form>

	<div id='select'>
		<table id="reportTable" style='border: 1px solid black'>
			<caption>
				<h2>住戶所有檢舉列表</h2>
			</caption>
			<tr>
				<th>檢舉編號</th>
				<th>住戶名稱</th>
				<th>檢舉日期/時間</th>
				<th>檢舉表單內容</th>
				<th>檢舉內容附圖</th>
				<th>檢舉狀態</th>
				<th>回覆內容</th>
				<th>回覆內容附圖</th>
				<th>回覆日期/時間</th>
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

				<c:choose>
					<c:when test="${privateReportVO1.privateReportStatus == 1}">
						<th>已結案</th>
					</c:when>
					<c:otherwise>
						<th>未結案</th>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${empty privateReportVO1.replyOfReport}">
						<th><font color="red"><b>管理員尚未回覆!</b></th>
					</c:when>
					<c:otherwise>
						<th>${privateReportVO1.replyOfReport}</th>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when
						test="${(empty privateReportVO1.replyPic) and privateReportVO1.privateReportStatus == 0}">
						<th><font color="red"><b>管理員尚未回覆!</b></th>
					</c:when>
					<c:when
						test="${(empty privateReportVO1.replyPic) and privateReportVO1.privateReportStatus == 1}">
						<th>無附圖</th>
					</c:when>
					<c:otherwise>
						<th><img
							src="<%=request.getContextPath()%>/back-end/privateReport1/privateReportPicServlet.do?action=showPic&memberAc=EreYea1&privateReportId=${privateReportVO1.privateReportId}"
							width="300px" /></th>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when
						test="${(empty privateReportVO1.replyOfReportTime) and privateReportVO1.privateReportStatus == 0}">
						<th><font color="red"><b>管理員尚未回覆!</b></th>
					</c:when>
					<c:otherwise>
						<th>${privateReportVO1.replyOfReportTime}</th>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>

</body>

</html>