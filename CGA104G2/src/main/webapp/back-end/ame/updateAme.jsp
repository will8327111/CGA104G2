<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="com.ame.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
AmeVO ameVO = (AmeVO) request.getAttribute("ameVO");
List li =(List)request.getAttribute("list");

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
<meta charset="utf-8">
<title>修改</title>
</head>

<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<table>
		<tr>
			<td>
				<h1>修改頁面</h1>
				<h4>
					<a href="/CGA104G2/back-end/ame/First.jsp">回首頁喔</a>
				</h4>
			</td>
		</tr>
	</table>
<form METHOD="POST" ACTION="ame.do" enctype="multipart/form-data">
	<table>
		<tr>
			<td>公設編號 :</td>
			<td><%=ameVO.getAmeId()%></td>
		</tr>
		<tr>
			<td>公設名稱 :</td>
		 	<td><input type="text" name="amename" value="<%=ameVO.getAmeName()%>"></td>
		</tr>
		<tr>
			<td>人數上限 :</td>
		 	<td><input type="text" name="amemax" value="<%=ameVO.getAmeMax()%>"></td>
		</tr>
		<tr>
			<td>公社介紹 :</td>
		 	<td><input type="text" name="ameintroduce" value="<%=ameVO.getAmeIntroduce()%>"></td> 
		</tr>
		<tr>
			<td>點數需求 :</td>
		 	<td><input type="text" name="amepoint" value="<%=ameVO.getAmePoint()%>"></td> 
		</tr>
		<tr>
			<td>公設圖片 :</td>
		 	<td><img src="<%=request.getContextPath()%>/Amepho_Servlet?AME_ID=${ameVO.ameId}" name="ameimg" width="200">
				<input type="file" name="ameimg">
		 	</td>
		
		
		</tr>
	</table>
	
<% 
String op = ameVO.getAmeOpening();
int first = op.indexOf("0");
int last = op.lastIndexOf("0");
%> 
	<table>
		<tr>
			<td>開放時間 :</td>
		 	<td><input type="text" name="ameOpenning" value="<%=ameVO.getAmeOpening()%>"></td> 
		</tr>
		<tr><td>	
		開放時間 :<select name="opentime">
		
		<c:set var="first" scope="page" value="<%= first%>"/>
		<c:forEach var="ameopening" items="${list}" varStatus="loop">
		<c:choose>
   			<c:when test="${loop.index == first}">
    			<option selected="selected" value="${loop.index}">${loop.index}:00</option>
   			</c:when>
   			<c:otherwise>
     		 <option value="${loop.index}">${loop.index}:00</option>
   			</c:otherwise>
		</c:choose>
    	</c:forEach>
		</select>
		 <br> 
		 關閉時間: <select name="closetime">
		 
		<c:set var="last" scope="page" value="<%= last-1%>"/>
		
		<c:forEach var="ameopening" items="${list}" varStatus="loop">
		
		<c:choose>
   			<c:when test="${loop.index == last}">
    			<option selected="selected" value="${loop.count}">${loop.count}:00</option>
   			</c:when>
   			<c:otherwise>
     		 <option value="${loop.count}">${loop.count}:00</option>
   			</c:otherwise>
		</c:choose>

    	</c:forEach>
		 
		</select> 
		</tr>
	</table>
		
		<input type="hidden" name="ameid" value="<%=ameVO.getAmeId()%>"> 
		<input type="hidden" name="action" value="updateAme"> 
		<input type="submit" value="確認修改">
</form>

		 
	



	<script>
		
	</script>
</body>
</html>