<%@page import="com.privateReport1.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
PrivateReportService1 privateReportService1 = new PrivateReportService1();
List<PrivateReportVO1> list = privateReportService1.getAllReport(); // 設定Account的getAll集合
pageContext.setAttribute("list", list);
%>
<html>
<head>

<meta charset="UTF-8">
<title>私人檢舉頁面</title>

<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}

span {
	padding: 10px;
}

table, tr, th, td {
	border: 2px solid black;
}
</style>
</head>

<body bgcolor="lightYellow">

	<div id="header">
		<h1 id="test">您好，這裡是住戶檢舉頁面！</h1>
	</div>

	<span><b>請選擇: </b><select>
			<option selected>瀏覽全部檢舉</option>
			<option>瀏覽已完成檢舉</option>
			<option>瀏覽未完成檢舉</option>
	</select> <!-- 	<input id="SelectDoneOrUndone" type="submit" value="送出"> --> </span>


	<span><b> 依表單編號查詢: </b><input id="privateReportId" type="text">
		<input id="SubmitOneReport" type="submit" value="送出"> </span>

	<span><b> 依住戶姓名查詢: </b><input id="privateReportId" type="text">
		<input id="SubmitOneReport" type="submit" value="送出"> </span>

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
				<th>管理員回覆</th>
			</tr>
			<c:forEach var="privateReportVO1" items="${list}">
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
							<th>${privateReportVO1.replyPic}</th>
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

					<c:choose>
						<c:when test="${not empty privateReportVO1.replyOfReportTime}">
							<th><input type="submit" value="管理員回覆" disabled="disabled"></th>
						</c:when>
						<c:otherwise>
							<th>
								<form method="get"
									action="<%=request.getContextPath()%>/back-end/privateReport1/privateReportServlet.do">
									<input type="hidden" name="privateReportId"
										value="${privateReportVO1.privateReportId}"> <input
										type="submit" value="管理員回覆"> <input type="hidden"
										name="action" value="getOne_For_Update">
								</form>
							</th>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>

</html>