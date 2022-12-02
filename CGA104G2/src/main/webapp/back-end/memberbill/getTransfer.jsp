<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.transfer.model.*"%>
<%@ page import="com.transfer.controller.*"%>

<!DOCTYPE html>
<!--繁體中文-->
<html lang="zh-Hant">

<head>

<meta charset="UTF-8">
<!-- 定義為RWD web -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 最佳兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- 防止搜索引擎索引及檢索 -->
<meta name="robots" content="noindex,nofollow">

<!-- !!固定!! 後台樣板 css -->
<link rel="stylesheet"
	href=${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css>

<!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
<link rel="shortcut icon"
	href=${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico
	type="image/x-icon">
<!--=============================================================================================-->
<!--    需要用自己的css請放在這邊註解下方覆蓋 start -->
<meta charset="UTF-8">
<link href='https://css.gg/eye-alt.css' rel='stylesheet'>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
 .btn.btn-danger:focus , .btn.btn-danger:hover{
background-color: #cfe2ff;
border:#cfe2ff;
}
.btn.btn-warning{
background-color: #3d8bfd;
border:#3d8bfd;

}
.btn.btn-danger{

background-color: #cfe2ff;
border:#cfe2ff;
}

.btn.btn-warning:hover {
    background-color: #052c65;
    border:#052c65;
    transition: 0.6s;
}

.btn.btn-danger:hover {
     background-color: #9ec5fe;
    border:#052c65;
    transition: 0.6s;
}


.photo {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 6rem;
            border-radius: 5px;
            box-shadow: 0 3rem 5rem rgba(0, 0, 0, 0.3);
            z-index: 310;
            
        }

        .overlay {
/*             position: absolute; */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(3px);
            z-index: 305;
        }
        .hidden{
        display:none;
        }
        .gg-eye-alt {
    position: relative;
    display: block;
    transform: scale(var(--ggs,1));
    width: 24px;
    height: 18px;
    border-bottom-right-radius: 100px;
    border-bottom-left-radius: 100px;
    overflow: hidden;
    box-sizing: border-box
}
.gg-eye-alt::after,
.gg-eye-alt::before {
    content: "";
    display: block;
    border-radius: 100px;
    position: absolute;
    box-sizing: border-box
}
.gg-eye-alt::after {
    top: 2px;
    box-shadow:
        inset 0 -8px 0 2px,
        inset 0 0 0 2px;
    width: 24px;
    height: 24px
}
.gg-eye-alt::before {
    width: 8px;
    height: 8px;
    border: 2px solid transparent;
    box-shadow:
        inset 0 0 0 6px,
        0 0 0 4px,
        6px 0 0 0,
        -6px 0 0 0 ;
    bottom: 4px;
    left: 8px
}
</style>
<head>
<meta>
<!--    自己的css end-->

<!--    網址列標題-->
<title>陪你e生e世 社區服務平台：後台Home</title>

</head>

<body>
<div class="photo hidden">
	<img id="showPhoto">
</div>

<div class="overlay hidden">

</div>
	<!-- !!固定!! 旁邊導覽列sidebar menu start -->
    <script src=${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js></script>
    <!-- !!固定!! 旁邊導覽列sidebar menu end -->
	<div id='app'>
        </div>

	<!-- !!Home頁面? 固定!!  右上方放小鈴鐺+登出+通知等等的 navbar -->
    <div id="main" class='layout-navbar'>
        <header class='mb-3'>
            <nav class="navbar navbar-expand navbar-light navbar-top">
                <div class="container-fluid">
                    <a href="#" class="burger-btn d-block">
                        <i class="bi bi-justify fs-3"></i>
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-lg-0">
                        <li><a class="dropdown-item" href="#">
                            <i  class="bi-sub fs-4 bi bi-box-arrow-left"></i> Logout</a>
                        </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </header>
        <!-- !!固定!! 右上方 navbar end -->
		<!-- 頁面 START!　網頁請從這邊以下開始修改，不需要此格式想用自己的請刪除 ~　-->
		<div id="main-content">
			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">

							<h3>匯款管理</h3>
							<p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：匯款管理</p>

						</div>

						<!--右上方標註目前在哪個頁面-->
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="http://localhost:8081/CGA104G2/member/bill.do?action=getAll">帳單管理</a></li>
									<li class="breadcrumb-item active" aria-current="page">匯款管理</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- 內頁排版section(會直接套用RWD效果) START -->
				<section class="section">
					<div class="card">
						<div class="card-header">
							<!--標題-->
							<h4 class="card-title"></h4>
						</div>
						<!--內容區塊-->

						<body>
						<div class="card-body">
							<th>匯款查詢頁面</th>
							<form method="post" action="transfer" name="form2"
								enctype="multipart/form-data">
							<table id="table-1" class="table table-hover">
								<div style="width: 500px; display: flex; flex-wrap: nowrap;" >
									<div style="width: 200px; margin-left: 10px;">
										<select name="memberPay" class="form-select">
											<option disabled selected>請選擇繳費方式</option>
											<option value="2">待審核</option>
											<option value="1">已繳費</option>
										</select>
									</div>
									<div style="width: 50px; margin-left: 10px;">
										<input type="hidden" name="action" value="select_memberPay">
										<input type="submit" value="查詢" class="btn btn-primary">
									</div>

								</div>
							</table>
							</form>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>住戶帳單編號</th>
										<th>住戶編號</th>
										<th>住戶姓名</th>
										<th>銀行代號</th>
										<th>後五碼</th>
										<th>匯款時間</th>
										<th>繳費證明</th>
										<th>帳單月份</th>
										<th>繳費狀態</th>
										<th></th>
									</tr>
								</thead>
							
								<c:forEach var="TransferVO" items="${list}" varStatus="s">
									<tr>
										<td>${TransferVO.memberBillId}</td>
										<td>${TransferVO.memberId}</td>
										<td>${TransferVO.memberName}</td>
										<td>${TransferVO.bankId}</td>
										<td>${TransferVO.bankNumber}</td>
										<td>${TransferVO.bankDate}</td>
										<td><i class="gg-eye-alt"><img
											src="${pageContext.request.contextPath}/member/bill.do?action=memberphoto&memberBillId=${TransferVO.memberBillId}"
											width="160px" hight="200px" id="img" class="openPhoto"></i></td>
										<td>${TransferVO.billDate}</td>
										<td>${TransferVO.memberPay}</td>
<!-- 										 selected -->
										<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/bill.do" style="margin-bottom: 0px;">
											<span>繳費狀態:</span>
											<select name="memberPay" disabled id="open${s.count}">
												<option>修改繳費狀態</option>
<!-- 												<option value="0">未繳費</option> -->
												<option value="1">已繳費</option>
											</select>
											<br>
											<div style="display: flex;justify-content: space-around;margin-top:10px;">
											<button style="color:#052c65;" type="button" onclick="toggleSelect(${s.count})" class="btn btn-danger">編輯</button>
											<input type="submit" value="修改" class="btn btn-warning" style="color:#cff4fc">
											<input type="hidden" name="memberBillId" value="${TransferVO.memberBillId}">
											<input type="hidden" name="action" value="getOne_For_Update">
											</div>
											
										</FORM>
									</td style="border-bottom: 1px solid black">
									</tr>
								</c:forEach>
							</table>
							</div>
					</div>
				</section>
				<!-- 網頁排版用section END -->

			</div>
			<!-- 整頁page end -->


			<!-- !!固定!! footer(擺每個頁面最下方的版權用) START -->
			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2022 &copy; 陪你e生e世 社區服務平台</p>
					</div>
					<div class="float-end">
						<p>Community Management</p>
					</div>
				</div>
			</footer>
			<!--        !!固定!! footer END-->
		</div>
	</div>
	<!-- 樣板用js start -->
	<script
		src=${pageContext.request.contextPath}/resources/back-end/assets/js/bootstrap.js></script>
	<script
		src=${pageContext.request.contextPath}/resources/back-end/assets/js/app.js></script>
	<!-- 樣板用js end -->
	<!-- !!固定!! 後台樣板 css -->
	<link rel="stylesheet" href=${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css>
	<script src="https://code.jquery.com/jquery-3.6.1.js"integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="crossorigin="anonymous"></script>
	
	<script>
		function toggleSelect(count) {
			const select = document.querySelector(`#open\${count}`);
			select.disabled = !select.disabled;
		}
	</script>
	<script type="text/javascript">
	window.onload=function(){
	var op = document.getElementById("open${s.count}");
	var opts = op.getElementByTagName("option");
	var om = document.getElementById("toggleSelect(${s.count})")
	
	om.onclick = function(){
		opts[1].selected = true;
		}	
	}
	 </script>
	 
	
	<script>
	const overlay = document.querySelector('.overlay');
	const photo = document.querySelector('.photo');
	const openPhoto = document.querySelectorAll('.openPhoto');
	const showPhoto = document.querySelector('#showPhoto');
	
	
	openPhoto.forEach(e=>{
		e.addEventListener('click', openPhotoDiv);
	})
	
	overlay.addEventListener('click', closePhoto);
	
	//顯示照片
    function openPhotoDiv(e) {
        photo.classList.remove('hidden');
        overlay.classList.remove('hidden');
        showPhoto.src=e.target.src;
       
    };

    //關閉照片
    function closePhoto() {
        overlay.classList.add('hidden');
        photo.classList.add('hidden')
    }
	
	</script>

</body>
</html>