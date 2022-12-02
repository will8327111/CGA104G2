<%@page import="java.util.List"%>
<%@ page import="com.ame.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html >

<head>
    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
<!-- <!--    禁止本地端快取--> 
   <Meta http-equiv="Pragma" Content="No-cache">
<!-- <!--    隱藏圖片下載-->
    <meta http-equiv="imagetoolbar" content="false">
    <meta name="keywords" content="">
<!--     定義為RWD web -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
<!--     最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<!--     =============Google Font =============== -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
<!--     !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">

<!--     ==============css=============== -->
<!--     font awesome kit -->
    <script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
<!--     !!固定!! 前台樣式 -->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">
<!--     modaal -->
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/modaal.min.css">

<!--     =============js============= -->
<!--     延遲載入 -->
    <script src="../../resources/front-end/assets/js/lazyload.min.js"></script>

<!--     ==============這邊放自己的 css=============== -->
<style>
.calendar {
	width: 100%;
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
#tbody {
margin-left : 100px;
}
</style>

<!--     ==============css=============== -->
    <style>
  /*!!固定!! 字形*/ 
       @font-face { 
             font-family: 'huninn'; 
             src: url('../../resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype"); 
         } 
         body { 
             font-family: 'huninn',serif; 
         } 
    </style>
</head>


<body>
        <header id="header">

<!--!!固定!! 導覽列 start -->
            <nav id="pc-nav">
<!--!!固定!! logo -->
                <div>
                    <h1><a href="../../front-end/web/front-index2.html"><img src="../../resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 50%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
                </div>
            </nav>
                <ul>
                    <div id="login-div" >
                        <a href="#"><button class="cap"  id="login" data-tippy-content="<div class='inner-cap'><p>住戶登入/登出。</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-right-to-bracket"></i><label style="font-size: 1rem;"> 登出</label></button></a>
                    </div>
                </ul>
            <ul>
                <div id="out-div" >
                    <a href="#"><button class="cap"  id="out" data-tippy-content="<div class='inner-cap'><p>住戶訊息通知。</p><p>檢視您的個人訊息。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-bell"></i><label style="font-size: 1rem;"> 通知</label></button></a>
                </div>
            </ul>
<!-- 導覽列 end -->
        </header>

<!--!!固定!! 空白遮罩 -->
        <div style="width: 100%; height:100px;"></div>

<!--!!固定!! main area -->
        <div id="container">
            <main id="main-area">

<!--這邊往下新增 -->

<div class="calendar">
		<div id="tbody" class="title">

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
			<h2 class="green" id="calendar-title">Month</h2>
			<h2 class="green small" id="calendar-year">Year</h2>
		</div>

		<div id="tbody" class="body">
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
<!--main area end -->
            </main>
<!--             container -->
        </div>

<!--!!固定!! footer -->
        <footer id="footer">
<!--右上角menu -->
            <div class="openbtn"><span></span><span>Menu</span><span></span></div>
            <div id="g-nav">
                <div id="g-nav-list">
                    <ul>
                        <li><a href=""></a> <img src="../../resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
                        <li><a href="#">住戶帳號</a></li>
                        <li><a href="#">社區帳單</a></li>
                        <li><a href="#">郵件</a></li>
                        <li><a href="#">公共設施</a></li>
                        <li><a href="#">活動</a></li>
                        <li><a href="#">檢舉與維修</a></li>
                        <li><a href="#">特約商店</a></li>
                    </ul>
                </div>
            </div>
            <p class="footer-logo">Community Management</p>
            <small>2022 &copy; 陪你e生e世　社區服務平台</small>
<!--            返回最上方小圖示 -->
            <p id="page-top"><a href="#">Top</a></p>
        </footer>
<!--         /wrapper -->
    

<!--     =============JS =============== -->
<!--     jQuery -->
    <script src="../../resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
<!--     news tickerー -->
    <script src="../../resources/front-end/assets/js/jquery.bxslider.min.js"></script>
<!--     背景線延伸效果 -->
    <script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>
<!--     apang 動畫 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!--     Tippy -->
    <script src="https://unpkg.com/popper.js@1"></script>
    <script src="https://unpkg.com/tippy.js@5"></script>

<!--     other -->
    <script src="../../resources/front-end/assets/js/modaal.min.js"></script>
    <script src="../../resources/front-end/assets/js/script.js"></script>
    <script src="../../resources/front-end/assets/js/search_origin.js"></script>

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