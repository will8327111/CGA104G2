<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

<meta charset="UTF-8">
<title>後台首頁</title>

<style>
#header {
	border: 2px solid black;
	border-collapse: collapse;
}
</style>
</head>

<body bgcolor="lightYellow">

	<div id="header">
		<h1>私人檢舉與維修服務</h1>
	</div>
	<br>
	<button>
		<a href="../../back-end/privateReport/privateReportInfo.jsp">私人檢舉頁面</a>
	</button>
	
	<button>
		<a href="../../back-end/maintenanceRecord/maintenanceRecordInfo.jsp">維修服務頁面</a>
	</button>


</body>

</html>