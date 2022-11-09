<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>


<%
ActivityVO activityVO = (ActivityVO) request.getAttribute("activity");
%>


<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改活動</title>

<style type="text/css">

img{
	width:200px;
	height:200px
}

</style>

</head>



<body>

	<h3>總資料資料查詢:</h3>
	<ul>
		<li><a href='/CGA104G2/front-end/activity/list.jsp'>返回list</a></li>
	</ul>

	<FORM METHOD="post" action="ActServlet" name="form1"
		enctype="multipart/form-data">
		<table>

			<jsp:useBean id="typeSvc" scope="page"
				class="com.activitytype.model.ActivityTypeService" />


			<tr>
				<td>新增活動圖片:</td>
				<td><input type="file" name="photo1" multiple="multiple" /></td>
			</tr>



			<tr>
				<td>活動種類:<font color=red><b>*</b></font></td>
				<td><select size="1" name="acttypeno">
						<c:forEach var="activityTypeVO" items="${typeSvc.all}">
							<option value="${activityTypeVO.actTypeId}"
								${(activityTypeVO.actTypeId ==null)? 'selected':'' }>${activityTypeVO.actTypeName}
						</c:forEach>
				</select></td>
			</tr>


			<tr>
				<td>活動名字:</td>
				<td><input type="TEXT" name="actname"
					value="<%=activityVO.getActName()%>" /></td>
			</tr>

			<tr>
				<td>活動內容:</td>
				<td><input type="TEXT" name="actcontent"
					value="<%=activityVO.getActContent()%>" /></td>
			</tr>

			<tr>
				<td>活動最大人數:</td>
				<td><input type="TEXT" name="actMax"
					value="<%=activityVO.getActMaxCount()%>" /></td>
			</tr>
			<tr>
				<td>活動最小人數:</td>
				<td><input type="TEXT" name="actMin"
					value="<%=activityVO.getActMinCount()%>" /></td>
			</tr>

			<tr>
				<td>報名開始日期:</td>
				<td><input name="singst" id="date1" type="text"></td>
			</tr>


			<tr>
				<td>報名結束日期:</td>
				<td><input name="singet" id="date2" type="text"></td>
			</tr>

			<tr>
				<td>活動開始日期:</td>
				<td><input name="actst" id="date3" type="text"></td>
			</tr>

			<tr>
				<td>活動結束日期:</td>
				<td><input name="actet" id="date4" type="text"></td>
			</tr>


			<tr>
				<td>活動縣市:</td>
				<td><select name="actcountry">
						<option
							value='<%=(activityVO == null) ? "" : activityVO.getActCountry()%>'><%=(activityVO == null) ? "請選擇" : activityVO.getActCountry()%></option>
						<option value='基隆市'>基隆市</option>
						<option value='台北市'>台北市</option>
						<option value='新北市'>新北市</option>
						<option value='宜蘭縣'>宜蘭縣</option>
						<option value='桃園市'>桃園市</option>
						<option value='新竹市'>新竹市</option>
						<option value='新竹縣'>新竹縣</option>
						<option value='苗栗縣'>苗栗縣</option>
						<option value='台中市'>台中市</option>
						<option value='南投縣'>南投縣</option>
						<option value='彰化縣'>彰化縣</option>
						<option value='雲林縣'>雲林縣</option>
						<option value='嘉義縣'>嘉義縣</option>
						<option value='台南市'>台南市</option>
						<option value='高雄市'>高雄市</option>
						<option value='屏東縣'>屏東縣</option>
						<option value='花蓮縣'>花蓮縣</option>
						<option value='臺東縣'>臺東縣</option>
						<option value='澎湖縣'>澎湖縣</option>
						<option value='金門縣'>金門縣</option>
						<option value='連江縣'>連江縣</option>
				</select></td>
			</tr>



			<tr>
				<td>活動地址:</td>
				<td><input name="actlocation" type="text"
					value="<%=activityVO.getActLocation()%>" /></td>
			</tr>

			<tr>
				<td>活動費用:</td>
				<td><input name="actcost" type="text"
					value="<%=activityVO.getActCost()%>" /></td>
			</tr>

		</table>
		<input type="hidden" name="action" value="up"> <input
			type="hidden" name="id" value="<%=activityVO.getActId()%>">
		<button type="submit">送出資料</button>
	</form>
	
	<div id="img"></div>
	
	
</body>


<%
java.sql.Date actst = null;
java.sql.Date actet = null;
java.sql.Date sgst = null;
java.sql.Date sget = null;
try {
	actst = activityVO.getActStart();
	actet = activityVO.getActEnd();
	sgst = activityVO.getSignStart();
	sget = activityVO.getSignEnd();
} catch (Exception e) {

}
%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
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
	
	let res = await fetch("<%= request.getContextPath() %>/activity/ActPhotoServlet?action=actPhoto&actId=<%=activityVO.getActId()%>", { method: 'get' })
	let data = await res.json();
	console.log(data)
	html=""
	for(let i in data){
		html += `<img src=data:image/jpeg;base64,\${data[i].photo} >
		<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/activity/ActPhotoServlet">
		<input type="hidden" name="deletePhoto"  value="\${data[i].actPhotoId}"">
		<input type="hidden" name="actId" value="\${data[i].actId}">
		<input type="hidden" name="action" value="deleteById">
		<button type="submit">刪除</button>
		</FORM>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/ActPhotoServlet" enctype="multipart/form-data">
		<input type="hidden" name="updatePhoto"  value="\${data[i].actPhotoId}"">
		<input type="hidden" name="action" value="updateById">
		<input type="hidden" name="actId" value="\${data[i].actId}">
		<input type="file" name="photoChange"/>
		<button type="submit">圖片更換送出</button>
		</FORM>
		`				
	}
	document.getElementById("img").innerHTML = html;
	
	
	
	
	
	
	
	
	
	
}






</script>



</html>