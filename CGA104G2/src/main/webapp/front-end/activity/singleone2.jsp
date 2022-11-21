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
<html lang="en">
<head>
<title></title>
    <meta charset="utf-8">
    <title>社區業務管理系統-陪你e生e世</title>
    <meta name="robots" content="noindex,nofollow">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!--=============Google Font ===============-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300&display=swap" rel="stylesheet">
    <!--==============css===============-->
    <link rel="stylesheet" href="../../resources/css/homestyle.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/jquery.bxslider.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/parts.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/layout.css">
    <link rel="stylesheet" type="text/css" href="../../resources/front-end/assets/css/modaal.min.css">
<link href="https://cdn.bootcss.com/flexslider/2.6.3/flexslider.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/flexslider/2.6.3/jquery.flexslider-min.js"></script>
<link rel="stylesheet" href="../resources/css/formstyle.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        @font-face {
            font-family: 'huninn';
            src: url('/resources/front-end/assets/font/jf-openhuninn-1.1.ttf')format("truetype");
        }
        body {
            font-family: 'huninn',serif;
        }
    </style>



</head>
<body>

 <div id="splash">
        <div id="splash-logo">
            <div class="bgextend bgLRextend"><span class="bgappear">Community Management</span><br>
                <span class="bgappear">陪你e生e世 社區服務平台</span></div>
        </div>
        <!--/splash-->
    </div>
    <div class="splashbg"></div>
    <!---画面遷移用-->


  <div id="container">

        <header id="header">
<!--            <h3><a href="#"><span class="bgextend bgLRextendTrigger">-->
            <h1><div> <a href="front-index.html"><img src="../../resources/front-end/assets/img/logo11_trans4.png" alt="" style="width: 50%"></a></div></h1>
<!--            </a></h3>-->
                        <!-- <span class="bgappearTrigger">陪你e生e世</span> -->

<!--                    </span></a></h1>-->

            <nav id="pc-nav">
<!--                    <li><span class="bgappearTrigger"><img src="img/logo11_trans.png" alt="" style="width: 40%"></span></li>-->
                <ul>
                    <li><a href="#vision"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">帳號管理</span></span></a></li>
                    <li><a href="#service"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">活動</span></span></a></li>
                    <li><a href="#about"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">公共設施</span></span></a></li>
                    <li><a href="#faq"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">檢舉與維修</span></span></a></li>
                    <li><a href="#contact"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">特約商店</span></span></a></li>
                    <li><a href="#contact"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">社區帳單</span></span></a></li>
                    <li><a href="#contact"><span class="bgextend bgLRextendTrigger"><span
                                    class="bgappearTrigger">聯絡我們</span></span></a></li>
                </ul>
            </nav>
        </header>


 <main id="main-area">
	<div><a>返回首頁</a></div>
	<div class="wrapper">
		<div class="title">活動詳情</div>
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
					value="<%=activityVO.getActCost()%>" readonly
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

			<h3 style=" margin-left: 260px">留言板</h3>
			<div class="inputfield" id="reply">
			</div>
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

 <footer id="footer">

            <div class="openbtn"><span></span><span>Menu</span><span></span></div>
            <div id="g-nav">
                <div id="g-nav-list">
                    <ul>
                        <li><a href=""></a> <img src="../../resources/front-end/assets/img/logo11_trans3.png" alt="" style="width: 70%"></li>
                        <li><a href="#vision">社區起源</a></li>
                        <li><a href="#service">個人管理</a></li>
                        <li><a href="#about">活動</a></li>
                        <li><a href="#faq">公共設施</a></li>
                        <li><a href="#contact">檢舉與維修</a></li>
                    </ul>
                </div>
            </div>
               <p class="footer-logo">CommunityManagement</p>
            <small>&copy; CommunityManagement：社區物業管理系統-陪你e生e世</small>
        </footer>
        <!--/wrapper-->
    </div>


    <!--=============JS ===============-->
    <!--jQuery-->
    <script src="../../resources/front-end/assets/js/jquery-3.4.1.min.js"></script>
    <!--news tickerー-->
    <script src="../../resources/front-end/assets/js/jquery.bxslider.min.js"></script>
    <!--背景線延伸效果-->
    <script src="../../resources/front-end/assets/js/scrollgress.min.js"></script>
    <!--apang 動畫-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apng-canvas/2.1.1/apng-canvas.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
 <script src="../../resources/front-end/assets/js/script.js"></script>
    <script src="../../resources/front-end/assets/js/modaal.min.js"></script>



	<script>


showPhotos()
async function showPhotos(){
let res = await fetch(" <%=request.getContextPath()%>/activity/ActPhotoServlet?action=actPhoto&actId=<%=activityVO.getActId()%>" , { method: 'get' })
let data = await res.json();
data.forEach(photo=>{
	$("#addPhoto").append(`<li><img src="data:image/jpeg;base64,\${photo.photo}"></li>`)	
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
	let res = await fetch(`<%=request.getContextPath()%>/activity/ActivitySignup?action=remove&actId=<%=activityVO.getActId()%>&current=<%=activityVO.getActCurrentCount()%>`,{ method: 'get' })
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
	$("#reply").append(`<label>住戶姓名:\${reply.memId}</label> <input type="text" class="input"
			value="\${reply.content}" readonly
			style="background-color: transparent; border: 0">`)	
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