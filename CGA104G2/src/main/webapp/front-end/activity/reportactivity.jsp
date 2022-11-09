 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ page import="com.activity.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="<%=request.getContextPath()%>/activity/ActReportServlet">



	<table>
		<tr>
		<th>活動名字</th>
		</tr>
		<tr>
		<td id="name"></td>
		</tr>
		<tr>
		<th>活動內容</th>
		</tr>
		<tr>
		<td id="content"></td>
		</tr>


	</table>
	<h4>檢舉內容</h4>
	<textarea name="report"></textarea>
	<div id="report">
	</div>
	<input type="hidden" name="action" value="addReport">
	<button type="submit">送出</button>
</form>

<script>

			const actId =sessionStorage.getItem("actId")
			act()
			async function act( ){
				let res =  await fetch("../../activity/ActServlet?action=adddata&actid="+actId,{ method: 'get' } )
				let data = await res.json()
				document.getElementById("name").innerText=data.activityName
				document.getElementById("content").innerText=data.activityContent
				document.getElementById("report").innerHTML= `<input type='hidden' id='actId' name='actId' value=\${data.activityId}>`
			}



</script>


</body>
</html>