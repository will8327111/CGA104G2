<%@page import="com.maintenanceRecord.model.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>會員個人維修提報頁面</title>
</head>
<body>

	<div id="header">
		<h1 id="test">我要提報維修:</h1>
	</div>

	<div>
		<h3 style="color: red;">*提報內容請勿空白,圖片可放可不放!</h3>
	</div>

	<div>
		<h3 style="color: red;">*如有任何不雅字眼,管理員審核將會刪除該檢舉表單,請斟酌用詞!</h3>
	</div>

	<div>
		<form method="post"
			action="<%=request.getContextPath()%>/back-end/maintenanceRecord/maintenanceRecordServlet.do"
			enctype="multipart/form-data">
			請填寫檢舉內容:<br>
			<textarea name="maintenanceContent" rows="5" cols="45" required></textarea>
			<p>
				回覆附圖:<br> <input type="file" accept="image/*"
					name="maintenancePic" value="點我上傳圖片">
			<p>
				<input type="hidden" name="maintenanceId"
					value="${maintenanceRecordVO.maintenanceId}"> <input
					type="hidden" name="memberId" value="${maintenanceRecordVO.memberId}">
				<input type="hidden" name="maintenanceStatus" value="0"> <input
					type="hidden" name="action" value="maintain"> <input 
					type="submit" value="確定"> <input type="reset" value="清除">
				<input type="button" value="回上一頁" onClick="history.back()">
		</form>
	</div>
	
</body>
</html>