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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.bootcss.com/flexslider/2.6.3/flexslider.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/flexslider/2.6.3/jquery.flexslider-min.js"></script>
<link rel="stylesheet" href="../resources/css/formstyle.css">

</head>
<body>

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
				<label>檢舉活動</label> <input type="submit" value="檢舉活動" class="btn"
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
 		alert("參加成功")	
 	}else{
 		alert("參加失敗")
 	}	
 	location.reload();
}



async function remove(){
	let res = await fetch(`<%=request.getContextPath()%>/activity/ActivitySignup?action=remove&actId=<%=activityVO.getActId()%>&current=<%=activityVO.getActCurrentCount()%>`,{ method: 'get' })
	let data = await res.json();
 	if(data.number==1){
 		alert("取消成功")	
 	}else{
 		alert("取消失敗")
 	}	
  	location.reload();
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



</script>



</body>
</html>