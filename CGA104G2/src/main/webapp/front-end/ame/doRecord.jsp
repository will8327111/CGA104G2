<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Integer ameid = (Integer)request.getAttribute("ameid");  %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="utf-8">
<title>預約頁面1</title>


<style>
.calendar {
	width: 80%;
	height: 80%;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.1);
	padding: 1%;
}

#calendar-title {
	text-align: center;
}

#calendar-year {
	text-align: center;
}

.body-list {
	width: 100%;
	font-family: arial;
	font-weight: bold;
	font-size: 16px;
}

.body-list ul {
	width: 88%;
	font-family: arial;
	font-weight: bold;
	font-size: 16px;
	text-align: center;
}

.body-list ul li {
	width: 14.28%;
	height: 60px;
	line-height: 55px;
	list-style-type: none;
	display: block;
	box-sizing: border-box;
	float: left;
}
.body-list ul li button{
	width: 70%;
	height: 60px;
	line-height: 55px;
	list-style-type: none;
	display: block;
	box-sizing: border-box;
	float: right;
}

.lightgrey {
	color: #a8a8a8; /*浅灰色*/
}

.darkgrey {
	color: #565656; /*深灰色*/
}

.green {
	color: #6ac13c; /*绿色*/
}

.greenbox {
	border: 1px solid #6ac13c;
	background: #e9f8df; /*浅绿色背景*/
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
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
				<h1>顯示日曆</h1>
				<h4>
					<a href="<%=request.getContextPath()%>/front-end/ame/showAme.jsp">回瀏覽頁</a>
<!-- 					http://localhost:8081/CGA104G2/front-end/ame/showAme.jsp -->
<!-- 					http://localhost:8081/CGA104G2/front-end/ame/ame_sta.do -->
<!-- 					/front-end/ame/front-end/ame/showAme.jsp -->
				</h4>
			</td>
		</tr>
	</table>
	<div class="calendar">
		<div class="title">

			<a href="" id="prev" style="float: left;"><svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
 			<path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
			</svg></a> <a href="" id="next" style="float: right;"><svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
						d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
			</svg></a>
			<h1 class="green" id="calendar-title">Month</h1>
			<h2 class="green small" id="calendar-year">Year</h2>
		</div>

		<div class="body">
			<div class="lightgrey body-list">
				<ul>
					<li>MON</li>
					<li>TUE</li>
					<li>WED</li>
					<li>THU</li>
					<li>FRI</li>
					<li>SAT</li>
					<li>SUN</li>
				</ul>
			</div>
			<div class="darkgrey body-list">
				<ul id="days">
				</ul>
			</div>
		</div>
	</div>

	<script>
		var month_olympic = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		var month_normal = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		var month_name = [ "January", "Febrary", "March", "April", "May",
				"June", "July", "Auguest", "September", "October", "November",
				"December" ];

		var holder = document.getElementById("days");
		var prev = document.getElementById("prev");
		var next = document.getElementById("next");
		var ctitle = document.getElementById("calendar-title");
		var cyear = document.getElementById("calendar-year");

		var my_date = new Date();
		var my_year = my_date.getFullYear();
		var my_month = my_date.getMonth();
		var my_day = my_date.getDate();

		function dayStart(month, year) {
			var tmpDate = new Date(year, month, 1);
			return (tmpDate.getDay());
		}

		function daysMonth(month, year) {
			var tmp = year % 4 === 0 && year % 100 !== 0 || year % 400 === 0;
			if (tmp == 0) {
				return (month_olympic[month]);
			} else {
				return (month_normal[month]);
			}
		}

		function refreshDate() {
			var str = "";
			var totalDay = daysMonth(my_month, my_year); //获取该月总天数
			var firstDay = dayStart(my_month, my_year); //获取该月第一天是星期几
			var myclass;
			var value = "";
			for (var i = 1; i < firstDay; i++) {
				str += "<li></li>"; //为起始日之前的日期创建空白节点
			}
			for (var i = 1; i <= totalDay; i++) {
				if(i < 10){
				value = my_year + "-" + (my_month + 1) + "-" + 0 + i;
				}else{
				value = my_year + "-" + (my_month + 1) + "-" + i;
				}
				if ((i < my_day && my_year == my_date.getFullYear() && my_month == my_date.getMonth()) || my_year < my_date.getFullYear() || (my_year == my_date.getFullYear() && my_month < my_date.getMonth())) {
					myclass = " class='lightgrey'"; //当该日期在今天之前时，以浅灰色字体显示
					str += `<li \${myclass} > \${i}</li>`; //创建日期节点
				} else if (i == my_day && my_year == my_date.getFullYear() && my_month == my_date.getMonth()) {
					myclass = " class='green greenbox'"; //当天日期以绿色背景突出显示
					str += `<form METHOD="post" style="margin-bottom: 0px;"> 
						<li \${myclass} > \${i}  
						<input type="hidden" name="action" value="doRecord2"> 
						<input type="hidden" name="ameid" value="${ameid}">  
						<input type="hidden" name="ame_StaDate" value="\${value}"> 
						<button class="btn btn-outline-success" > 查看時段 </button> </li></form>`; //创建日期节点
					
				} else if(i < my_day + 30 && my_year == my_date.getFullYear() && my_month == my_date.getMonth() ){
					myclass = " class='darkgrey'"; //当该日期在今天之后时，以深灰字体显示
					str += `<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/ame/ame_sta.do" style="margin-bottom: 0px;"> 
						<li \${myclass} > \${i}  
						<input type="hidden" name="action" value="doRecord2"> 
						<input type="hidden" name="ameid" value="${ameid}">  
						<input type="hidden" name="ame_StaDate" value="\${value}">  
						<button class="btn btn-outline-success" > 查看時段 </button> </li></form>`; //创建日期节点
										
				} else if(i < my_day && my_year == my_date.getFullYear() && my_month == my_date.getMonth() +1 ){
					myclass = " class='darkgrey'"; //当该日期在今天之后时，以深灰字体显示
					str += `<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/ame/ame_sta.do" style="margin-bottom: 0px;"> 
						<li \${myclass} > \${i}  
						<input type="hidden" name="action" value="doRecord2"> 
						<input type="hidden" name="ameid" value="${ameid}">  
						<input type="hidden" name="ame_StaDate" value="\${value}">  
						<button class="btn btn-outline-success" > 查看時段 </button> </li></form>`; //创建日期节点

				
				}else {
					myclass = " class='lightgrey'"; //当该日期在今天之前时，以浅灰色字体显示
					str += `<li \${myclass} > \${i}</li>`; //创建日期节点
				}
			}
			holder.innerHTML = str; //设置日期显示
			ctitle.innerHTML = month_name[my_month]; //设置英文月份显示
			cyear.innerHTML = my_year; //设置年份显示
		}
		refreshDate(); //执行该函数

		prev.onclick = function(e) {
			e.preventDefault();
			my_month--;
			if (my_month < 0) {
				my_year--;
				my_month = 11;
			}
			refreshDate();
		}
		next.onclick = function(e) {
			e.preventDefault();
			my_month++;
			if (my_month > 11) {
				my_year++;
				my_month = 0;
			}
			refreshDate();
		}
		

// 		function myFunction(value) {
// 			$.ajax({
// 				url : "${pageContext.request.contextPath}/front-end/ame/ame_sta.do",
// 				dataTpye : "json",
// 				data : {
// 				},
// 				type : "post",
// 				success : function(msg) {
// 					let parsedJson = jQuery.parseJSON(msg);
// 					console.log(parsedJson)
// 				for(let i = 0; i < parsedJson; i++){
// 					console.log(obj[i])
// 					alert("!!!")
// 				};
// 				},
// 				error : function() { //请求失败的回调方法
// 					alert("請求失敗 在試一次 ~");
// 				}

// 			})
// 		}
// 			valDate = e.toString().substring(0, 4) + "-"
// 					+ e.toString().substring(4, 6) + "-"
// 					+ e.toString().substring(6, 8);
	</script>
</body>
</html>

























