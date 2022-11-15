<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ page import='com.store.model.*'%>>
<%
StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
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
#getStoreOne {
	border: 1px solid #CCCCFF;
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

#getStoreOne th {
	border: 1px solid #CCCCFF;
	padding: 5px;
	text-align: center;
}

#getStoreOne td {
	border: 1px solid #CCCCFF;
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body>
	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id='table-1'>
		<tr>
			<td>
				<h3>員工資料 - ListOneEmp.jsp</h3>
				<h4>
					<a href='storeIndex.html'>回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table id='getStoreOne'>
		<tr>
			<th>商店編號</th>
			<th>商店項目編號</th>
			<th>商店內容</th>
			<th>商店位置</th>
			<th>商店經度</th>
			<th>商店緯度</th>
			<th>商店圖片</th>


		</tr>
		<tr>
			<td><%=storeVO.getStoreId()%></td>
			<td><%=storeVO.getStoreTypeId()%></td>
			<td><%=storeVO.getStoreInfo()%></td>
			<td><%=storeVO.getStoreLoc()%></td>
			<td><%=storeVO.getStoreLon()%></td>
			<td><%=storeVO.getStoreLat()%></td>
			<td><img width='150px' height='100px'
				src='data:image/jpeg;base64,<%=storeVO.getBase64img()%>'></td>
		</tr>
	</table>
	
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/store/store.do" style="margin-bottom: 0px;" enctype="multipart/form-data">
	<table class='content'>
	
		<tr>
			<td>商店編號:</td>
			<td><input type='text' name='storeId'
				value='<%=storeVO.getStoreId()%>'></td>
		</tr>

		<tr>
			<td>商店項目編號:</td>
			<td><input type='text' name='storeTypeId'
				value='<%=storeVO.getStoreTypeId()%>'></td>
		</tr>

		<tr>
			<td>商店位置:</td>
			<td><input type='text' id='storeLoc' name='storeLoc'
				value='<%=storeVO.getStoreLoc()%>'></td>
		</tr>


		<tr>
			<td>商店經度:</td>
			<td><input type='text' name='storeLon'
				value='<%=storeVO.getStoreLon()%>'></td>
		</tr>

		<tr>
			<td>商店緯度:</td>
			<td><input type='text' name='storeLat'
				value='<%=storeVO.getStoreLat()%>'></td>

		</tr>

		<tr>
			<td>商店圖片:</td>
			<td><input type='file' name='storePhoto'></td>
		</tr>

		<tr>
			<td>商店內容:</td>
			<td><textarea name='storeInfo' rows='10px' cols='30px'><%=storeVO.getStoreInfo()%></textarea></td>
		</tr>

		<tr>			
			<td>
					<input type='hidden' name='action' value='update'> 
					<input type='submit' value='資料送出'>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>