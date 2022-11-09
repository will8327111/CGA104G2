<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mail.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MailService mailSvc = new MailService();
    List<MailVO> list = mailSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有郵件資料 - listAllMail.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>郵件編號</th>
		<th>住戶編號</th>
		<th>郵件項目</th>
		<th>郵件到達日期</th>
		<th>郵件領取日期</th>
		<th>郵件狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	查詢新版處理<input type='text' placeholder=''>
	<c:forEach var="mailVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${mailVO.mailId}</td>
			<td>${mailVO.memberId}</td>
			<td>${mailVO.mailType}</td>
			<td>${mailVO.mailDelTime}</td>
			<td>${mailVO.mailPickupTime}</td>
			<td>${mailVO.mailState}等整合</td>
<%-- 			<td><img src = "/CGA104G2/back-end/mail/mail.do?action=get&memberId=${mailVO.memberId}" width='150px' height='100px'></td> --%>
			
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mail/mail.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="mailId"  value="${mailVO.mailId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/mail/mail.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="mailId" value="${mailVO.mailId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>


</html>