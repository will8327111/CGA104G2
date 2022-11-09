<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改活動</title>
<link rel="stylesheet"
	href="../..<%=request.getContextPath()%>/resources/css/update.css">
<style type="text/css">
img {
	width: 200px;
	height: 200px
}
</style>

</head>



<body>

	
	<h1>原有圖片修改</h1>
	<div id="img" class="flex"></div>
	<div class="container">
		   <form id="contact"  action="ActServlet" name="form1"
			enctype="multipart/form-data">


			<fieldset>
				<jsp:useBean id="typeSvc" scope="page"
					class="com.activitytype.model.ActivityTypeService" />
			</fieldset>

			<fieldset>
				新增活動圖片 <input type="file" name="photo1" multiple="multiple" />
			</fieldset>


		
			<fieldset>
				活動種類:<select size="1"
					name="acttypeno">
					<c:forEach var="activityTypeVO" items="${typeSvc.all}">
						<option value="${activityTypeVO.actTypeId}"
							${(activityTypeVO.actTypeId ==null)? 'selected':'' }>${activityTypeVO.actTypeName}
					</c:forEach>
				</select>
			</fieldset>

		
			<fieldset>
				活動名字 <input type="TEXT" name="actname"
					value="${param.actName}">
			</fieldset>

			<fieldset>
				活動內容 <input type="TEXT" name="actcontent"
					value="${param.actContent}" />
			</fieldset>

			<fieldset>
				活動最大人數: <input type="TEXT" name="actMax"
					value="${param.actMaxNumber}" />
			</fieldset>

			<fieldset>
				活動最小人數: <input type="TEXT" name="actMin"
					value="${param.actMinNumber}" />

			</fieldset>

			<fieldset>
				報名開始日期: <input name="singst" id="date1" type="text"
					value="${param.actSignupStart}">
			</fieldset>


			<fieldset>
				報名結束日期: <input name="singet" id="date2" type="text"
					value="${param.actSingupEnd}">
			</fieldset>

			<fieldset>
				活動開始日期: <input name="actst" id="date3" type="text"
					value="${param.actStart }">
			</fieldset>

			<fieldset>
				活動結束日期: <input name="actet" id="date4" type="text"
					value="${param.actEnd}">
			</fieldset>

<!-- 			<fieldset> -->
<!-- 				活動縣市: <select name="actcountry"> -->
<!-- 					<option -->
<!-- 						value=(${param.actCountry} == null )? " " : ${param.actCountry}> -->
<!-- 					<option value='台北市'>台北市</option> -->
<!-- 					<option value='新北市'>新北市</option> -->
<!-- 					<option value='宜蘭縣'>宜蘭縣</option> -->
<!-- 					<option value='桃園市'>桃園市</option> -->
<!-- 					<option value='新竹市'>新竹市</option> -->
<!-- 					<option value='新竹縣'>新竹縣</option> -->
<!-- 					<option value='苗栗縣'>苗栗縣</option> -->
<!-- 					<option value='台中市'>台中市</option> -->
<!-- 					<option value='南投縣'>南投縣</option> -->
<!-- 					<option value='彰化縣'>彰化縣</option> -->
<!-- 					<option value='雲林縣'>雲林縣</option> -->
<!-- 					<option value='嘉義縣'>嘉義縣</option> -->
<!-- 					<option value='台南市'>台南市</option> -->
<!-- 					<option value='高雄市'>高雄市</option> -->
<!-- 					<option value='屏東縣'>屏東縣</option> -->
<!-- 					<option value='花蓮縣'>花蓮縣</option> -->
<!-- 					<option value='臺東縣'>臺東縣</option> -->
<!-- 					<option value='澎湖縣'>澎湖縣</option> -->
<!-- 					<option value='金門縣'>金門縣</option> -->
<!-- 					<option value='連江縣'>連江縣</option> -->
<!-- 				</select> -->
<!-- 			</fieldset> -->



			<fieldset>
				活動地址: <input name="actlocation" type="text"
					value="${param.actLocation}" />
			</fieldset>

			<fieldset>
				活動費用: <input name="actcost" type="text"
				value="${param.actCost}">
			</fieldset>


			<input type="hidden" name="action" value="up"> <input
				type="hidden" name="id" value="${param.actId}">
			<button type="submit">送出資料</button>
		</form>
	</div>
</body>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
	$.datetimepicker.setLocale('zh');
	$(function() {
		$('#date1').datetimepicker({
			format : 'Y-m-d',
			onShow : function() {
				this.setOptions({
					maxDate : $('#date2').val() ? $('#date2').val() : false
				})
			},
			timepicker : false
		});

		$('#date2').datetimepicker({
			format : 'Y-m-d',
			onShow : function() {
				this.setOptions({
					minDate : $('#date1').val() ? $('#date1').val() : false,
					maxDate : $('#date3').val() ? $('#date3').val() : false
				})
			},
			timepicker : false
		});

		$('#date3').datetimepicker({
			format : 'Y-m-d',
			onShow : function() {
				this.setOptions({
					maxDate : $('#date4').val() ? $('#date4').val() : false,
					minDate : $('#date2').val() ? $('#date2').val() : false
				})
			},
			timepicker : false
		});

		$('#date4').datetimepicker({
			format : 'Y-m-d',
			onShow : function() {
				this.setOptions({
					minDate : $('#date3').val() ? $('#date3').val() : false
				})
			},
			timepicker : false
		});
	});
</script>


<script>

pic()
async function pic(){
	let res = await fetch(`<%= request.getContextPath() %>/activity/ActPhotoServlet?action=actPhoto&actId=${param.actId}`, { method: 'get' })
	let data = await res.json();
	console.log(data)
	html=""
	for(let i in data){
		html += `<div class="flex-wrap justify-content" style="width:30%">
		<img src=data:image/jpeg;base64,\${data[i].photo} >
		<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/activity/ActPhotoServlet">
		<input type="hidden" name="deletePhoto"  value="\${data[i].actPhotoId}"">
		<input type="hidden" name="actId" value="\${data[i].actId}">
		<input type="hidden" name="action" value="deleteById">
		<button type="submit">刪除</button>
		</FORM></div> `				
	}
	document.getElementById("img").innerHTML = html;
	
	
	
	
	
	
	
	
	
	
}






</script>



</html>