<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>

<%
ActivityVO activityVO = (ActivityVO) request.getAttribute("activity");
Integer memid = (Integer) session.getAttribute("id");
Integer status = (Integer) request.getAttribute("status");
%>

<!doctype html>
<html>
<head>
   <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
<!--    禁止本地端快取-->
<!--    <Meta http-equiv="Pragma" Content="No-cache">-->
<!--    隱藏圖片下載-->
    <meta http-equiv="imagetoolbar" content="false">
    <meta name="keywords" content="">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!--=============Google Font ===============-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
    <!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="../../resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">
     <!--==============css===============-->
    <!--font awesome kit-->
    <script src="https://kit.fontawesome.com/7e021e96db.js" crossorigin="anonymous"></script>
    <!--!!固定!! 前台樣式-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/front-end/assets/css/parts.css">
    <!--modaal-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/front-end/assets/css/modaal.min.css">
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

    

    <!--=============js=============-->
    <!--延遲載入-->
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/lazyload.min.js"></script>

    <!--==============這邊放自己的 css===============-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/formstyle.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <!--==============css===============-->
    <style>
 /*!!固定!! 字形*/
        @font-face {
            font-family: 'huninn';
            src: url('<%=request.getContextPath()%>/resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype");
        }
        body {
        	background:  rgb(225, 238, 234);
            font-family: 'huninn',serif;
        }
        
        
    </style>
</head>

</head>
<body>


         <header id="header">

<!--!!固定!! 導覽列 start-->
            <nav id="pc-nav">
                <!--!!固定!! logo-->
                <div>
                    <h1 style="width:166px" ><a href="<%=request.getContextPath()%>/front-end/web/front-index2.html"><img src="<%=request.getContextPath()%>/resources/front-end/assets/img/logo11_trans4.png" alt="陪你e生e世　社區服務平台" style="width: 100%; display: flex;justify-content: flex-start; flex-direction: inherit;"></a></h1>
                </div>
            </nav>
            <span style="margin-left:10px"></span>
                <ul>
                    <div>
                        <a href="<%=request.getContextPath()%>/front-end/activity/homepage3.html"><button class="cap" id="mylist" data-tippy-content="<div class='inner-cap'><p>回到活動首頁</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-house"></i><label style="font-size: 1rem;">活動首頁</label></button></a>
                    </div>
                </ul>
                <ul>
                    <div>
                        <a href="<%=request.getContextPath()%>/front-end/activity/mylist.html"><button class="cap" id="mylist" data-tippy-content="<div class='inner-cap'><p>我舉辦的活動</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-table-list"></i><label style="font-size: 1rem;">我舉辦的活動</label></button></a>
                    </div>
                </ul>
                  <ul>
                    <div  >
                        <a href="<%=request.getContextPath()%>/front-end/activity/myaddlist.html"><button class="cap"  id="login" data-tippy-content="<div class='inner-cap'><p>我參加的活動</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-user-plus"></i><label style="font-size: 1rem;"> 我參加的活動</label></button></a>
                    </div>
                </ul>
                    <ul>
                    <div >
                        <a href="<%=request.getContextPath()%>/front-end/activity/addactivity.html"><button class="cap"  id="add" data-tippy-content="<div class='inner-cap'><p>新增活動。</p><p>社區住戶專用。</p></div>"><i style="font-size: 1rem;" class="fa-solid fa-plus"></i><label style="font-size: 1rem;"> 新增活動</label></button></a>
                    </div>
                </ul>
                
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
            <!--導覽列 end-->
        </header>

<!--!!固定!! 空白遮罩-->
        <div style="width: 100%; height:50px;"></div>

<!--!!固定!! main area-->

  <div id="container">

		<main id="main-area">




	<div class="wrapper">
		<div class="title1">活動詳情</div>
		<div class="flexslider">
			<ul class="slides" id="addPhoto">
			</ul>
		</div>
		<div class="form">
			<div class="inputfield">
				<label>活動名稱</label> <input type="text" class="input"
					value="<%=activityVO.getActName()%>" readonly
					style="background-color: transparent; border: 0">
			</div>
			<div class="inputfield">
				<label>活動內容</label> <input type="text" class="input" 
					value="<%=activityVO.getActContent()%>" readonly
					style="background-color: transparent; border: 0">
			</div>
			<div class="inputfield">
				<label>活動地址</label> <input type="text" class="input"
					value="<%=activityVO.getActLocation()%>" readonly
					style="background-color: transparent; border: 0">
			</div>
			<div class="inputfield">
				<label>活動開始日期</label> <input type="text" class="input"
					value="<%=activityVO.getActStart()%>" readonly
					style="background-color: transparent; border: 0">
			</div>
			<div class="inputfield">
				<label>活動結束日期</label> <input type="text" class="input"
					value="<%=activityVO.getActEnd()%>" readonly
					style="background-color: transparent; border: 0">
			</div>
			<div class="inputfield">
				<label>活動費用</label> <input type="text" class="input"
					value="<%=activityVO.getActCost()%>元" readonly
					style="background-color: transparent; border: 0">
			</div>

			<div class="inputfield">
				<label>活動狀態</label> <input type="text" class="input" readonly
					value="<%=((activityVO.getActCurrentCount()) < (activityVO.getActMinCount()))
		? "尚未成團 目前人數:" + (activityVO.getActCurrentCount())
		: "已成團 目前人數:" + (activityVO.getActCurrentCount())%>"
					style="background-color: transparent; border: 0">
			</div>
			<div class="inputfield">
				<c:if
					test="<%=(activityVO.getActCurrentCount()) < (activityVO.getActMaxCount()) && status == 0%>">
					<label>報名活動</label>
					<form id="form2">
						<span>報名人數</span> <input type='number' id="quantity"
							name='quantity' value="1" min='1'
							max="<%=(activityVO.getActMaxCount()) - (activityVO.getActCurrentCount())%>"
							class="amount" style="width: 30px" /> <input type="button"
							class="btn" value="我要報名" onclick="join()">
					</form>
				</c:if>

				<c:if test="<%=(status != 0 && status == 1)%>">
					<label>退出活動</label>
					<input type="button" class="btn" value="取消報名" onclick="remove()">
				</c:if>
				
			</div>

		<div class="inputfield">
				
				<c:if test="<%=(activityVO.getActCurrentCount()) == (activityVO.getActMaxCount()) %>">
					<label>活動人數</label>
					<input type="text" class="input"
					value="已額滿" readonly
					style="background-color: transparent; border: 0">
				</c:if>

</div>

			<div class="inputfield">
				<label>檢舉活動</label> <input type="submit" value="檢舉活動" class="btn" onclick="report()"
					style="width: 100px; margin-left: 41px;">
			</div>

			<h3 id="reply" style=" margin-left: 260px">留言板</h3>
		<form >
			<div class="inputfield">
				<label>我要留言</label>
				<textarea id="content" class="input"></textarea>
			</div>
			<div class="inputfield">
				<input type="button" value="送出" class="btn" style="width: 100px;margin-left: 250px" onclick="getReply()">
			</div>
		</form>	
		</div>
	</div>
	
	</main>
            <!--container-->
        </div>

<!--!!固定!! footer-->
        <footer id="footer">
<!--右上角menu-->
            <div class="openbtn"><span></span><span>Menu</span><span></span></div>
            <div id="g-nav">
                <div id="g-nav-list">
                    <ul>
                        <li><a href=""></a> <img src="<%=request.getContextPath()%>/resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
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
<!--            返回最上方小圖示-->
            <p id="page-top"><a href="#">Top</a></p>
        </footer>
        <!--/wrapper-->
    </div>

    <!--=============JS ===============-->
    <!--jQuery-->
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
    <!--news tickerー-->
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/jquery.bxslider.min.js"></script>
    <!--背景線延伸效果-->
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/scrollgress.min.js"></script>
    <!--apang 動畫-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!--Tippy-->
    <script src="https://unpkg.com/popper.js@1"></script>
    <script src="https://unpkg.com/tippy.js@5"></script>

    <!--other-->
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/modaal.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/script.js"></script>
    <script src="<%=request.getContextPath()%>/resources/front-end/assets/js/search_origin.js"></script>
    
    
    <link href="https://cdn.bootcss.com/flexslider/2.6.3/flexslider.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/flexslider/2.6.3/jquery.flexslider-min.js"></script>
    
<style>

.flex-direction-nav a:before {
    font-family: flexslider-icon;
    font-size: 31px;
    display: inline-block;
    content: '\f001';
}

#container {
    position: relative;
    z-index: 1;
    background: #eae7e7;

}



input,
select,
textarea {
  background-color: transparent;
  border-style: groove;
  color: inherit;
}
</style>

	<script>


showPhotos()
async function showPhotos(){
let res = await fetch(" <%=request.getContextPath()%>/activity/ActPhotoServlet?action=actPhoto&actId=<%=activityVO.getActId()%>" , { method: 'get' })
let data = await res.json();
data.forEach(photo=>{
	$("#addPhoto").append(`<li><img class=img1 src="data:image/jpeg;base64,\${photo.photo}"></li>`)	
})

showReply()

$(function () {
    $(".flexslider").flexslider({
        animation: "slide",
        touch: true
    });
}); 
}



async function join(){
	const number = $("#quantity").val();
	let res = await fetch(`<%=request.getContextPath()%>/activity/ActivitySignup?action=insert&number=\${number}&actId=<%=activityVO.getActId()%>`, { method: 'get' })
	let data = await res.json();	
 	if(data.number==1){
 		Swal.fire({
 			  icon: 'success',
 			  title: '參加成功',
 			  showConfirmButton: false,
 				timer: 1500 
 		}).then(function(){
 			location.reload();
 		}
 				)
 		 		
 	}else{
 		Swal.fire({
			  icon: 'failed',
			  title: '參加失敗',
			  showConfirmButton: false,
				timer: 1500 
		}).then(function(){
			location.reload();
		}
				)
 		
 	}	
 
}



async function remove(){
	let res = await fetch(`<%=request.getContextPath()%>/activity/ActivitySignup?action=remove&actId=<%=activityVO.getActId()%>`,{ method: 'get' })
	let data = await res.json();
 	if(data.number==1){
 		
 		Swal.fire({
			  icon: 'success',
			  title: '取消成功',
			  showConfirmButton: false,
				timer: 1500 
		}).then(function(){
			location.reload();
		}
				)
 	}else{
 		alert("取消失敗")
 	}	
}


async function getReply(){
	const reply = $("#content").val();
	let res = await fetch(`<%=request.getContextPath()%>/activity/ActivityReplyServlet?action=insert&actId=<%=activityVO.getActId()%>&reply=\${reply}`,{ method: 'get' })
	location.reload();
}


async function showReply(){
	let res = await fetch(`<%=request.getContextPath()%>/activity/ActivityReplyServlet?action=search&actId=<%=activityVO.getActId()%>`,{ method: 'get' })
	let data = await res.json();
	data.forEach(reply=>{
	$("#reply").after(`<div class="inputfield"><label>住戶姓名:\${reply.memId}</label><input type="text" class="input"
			value="\${reply.content}" readonly
			style="background-color: transparent; border: 0"></div>`)
	})
	
}


function getWeb(){
    let path = window.location.pathname;
	let web = path.substring(0, path.indexOf('/', 1));
    return web
}



function report(){
	Swal.fire({
		  title: '我要檢舉',
		  text: "確定是否要檢舉!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:"取消",
		  confirmButtonText: '確定'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		    	title:"檢舉內容",
		    	html:`
		    	<textarea  style="resize:none;width:300px;height:200px;" id="report"></textarea>`,
		    	confirmButtonText:'送出',
	             showCancelButton:true,
	             cancelButtonText:'取消',
	             cancelButtonColor:'#d33',
	             
	             preConfirm:function(){
	            	 let memberId = sessionStorage.getItem("id")
	            	 let reportContent = document.getElementById('report').value
						let actId= <%=activityVO.getActId()%>;
						 if(true){
			                   return{
			                	 actId: actId,
			                	 memberId: memberId,
			                	 reportContent: reportContent,
			                   }
			                  }
						
	             }
	             
	             
	             }).then(function(result){
		    	if(result.isConfirmed){
		    		   let web = getWeb();
		    		  fetch(web+'/activity/ActReport?action=addReport', {
		                   method: 'post',
		                   headers: {
		                    'Content-Type': 'application/json'
		                   },
		                   body: JSON.stringify(result.value)
		                  });
		    		  
		    		  Swal.fire({
		    			  icon: 'success',
		    			  title: '已檢舉',
		    			  showConfirmButton: false,
		    			  timer: 1500
		    			})
				    	
		    		  
		    		
		    	}else{
		    		Swal.fire('取消','取消檢舉');
		    	}
	            	 
	            	 
		    })
		  
		  
		  
		  }
		})
		
	
}






</script>



</body>
</html>