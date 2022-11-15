<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="com.ame.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>新增</title>
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
				<h1>新增</h1>
				<h4>
					<a href="/CGA104G2/back-end/ame/First.jsp">回首頁喔</a>
				</h4>
			</td>
		</tr>
	</table>

	<form METHOD="POST" ACTION="ame.do" enctype="multipart/form-data">

		公設名稱: <input type="text" name="amename" value=""> <br>
		人數上限: <input type="text" name="amemax" value=""> <br>
		公社介紹: <input type="text" name="ameintroduce" value=""> <br>
		點數需求: <input type="text" name="amepoint" value=""> <br>
		開放時間: <select name="opentime">
			<option value="0" selected>00:00</option>
			<option value="1">01:00</option>
			<option value="2">02:00</option>
			<option value="3">03:00</option>
			<option value="4">04:00</option>
			<option value="5">05:00</option>
			<option value="6">06:00</option>
			<option value="7">07:00</option>
			<option value="8">08:00</option>
			<option value="9">09:00</option>
			<option value="10">10:00</option>
			<option value="11">11:00</option>
			<option value="12">12:00</option>
			<option value="13">13:00</option>
			<option value="14">14:00</option>
			<option value="15">15:00</option>
			<option value="16">16:00</option>
			<option value="17">17:00</option>
			<option value="18">18:00</option>
			<option value="19">19:00</option>
			<option value="20">20:00</option>
			<option value="21">21:00</option>
			<option value="22">22:00</option>
			<option value="23">23:00</option>
		</select> <br> 關閉時間: <select name="closetime">
			<option value="0" selected></option>
			<option value="1">01:00</option>
			<option value="2">02:00</option>
			<option value="3">03:00</option>
			<option value="4">04:00</option>
			<option value="5">05:00</option>
			<option value="6">06:00</option>
			<option value="7">07:00</option>
			<option value="8">08:00</option>
			<option value="9">09:00</option>
			<option value="10">10:00</option>
			<option value="11">11:00</option>
			<option value="12">12:00</option>
			<option value="13">13:00</option>
			<option value="14">14:00</option>
			<option value="15">15:00</option>
			<option value="16">16:00</option>
			<option value="17">17:00</option>
			<option value="18">18:00</option>
			<option value="19">19:00</option>
			<option value="20">20:00</option>
			<option value="21">21:00</option>
			<option value="22">22:00</option>
			<option value="23">23:00</option>
			<option value="24">00:00</option>
		</select> <br> 圖片: <input type="file" name="ameimg"> 
		<input type="hidden" name="action" value="addOneAme"> 
		<input type="submit" value="新增送出">
	</form>



	<script>
		
	</script>
</body>
</html>