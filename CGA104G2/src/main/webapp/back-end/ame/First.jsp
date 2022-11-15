<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
<meta charset="UTF-8">
<title>首頁</title>
</head>
<body>
	<table >
		<tr>
			<td>
				<h1>頁面</h1>
			</td>
		</tr>
	</table>
	
	<form METHOD="POST" ACTION="../../ame.do" >
		<input type="hidden" name="action" value="addView">
		<input type="submit" value="新增公設">
	</form><br><br>
	<form METHOD="POST" ACTION="../../ame.do" >
		<input type="hidden" name="action" value="control">
		<input type="submit" value="管理公設">
	</form><br><br>
	
<script>
window.history.replaceState(null, null, window.location.href);
</script>
</body>
</html>