<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="com.ame.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- 定義為RWD web -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 最佳兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!-- 防止搜索引擎索引及檢索 -->
    <meta name="robots" content="noindex,nofollow">

    <!-- !!固定!! 後台樣板 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css">

    <!-- !!固定!! favicon 網址列屬於網站的小圖示 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/favicon2.ico" type="image/x-icon">
<!--=============================================================================================-->
<!--    需要用自己的css請放在這邊註解下方覆蓋 start -->



<!--    自己的css end-->

<!--    網址列標題-->
    <title>陪你e生e世　社區服務平台：後台Home</title>
<!-- Validate用js end -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style>
form label {
	display: inline-block;
 	width: 100px;
        }
form div {
	margin-bottom: 10px;
        }
.error {
	color: red;
	margin-left: 5px;
        }
label.error {
	display: inline;
        }
</style>
</head>
<body>

<!-- !!固定!! 旁邊導覽列sidebar menu start (不是js動態產生的,放body)-->
<script src="${pageContext.request.contextPath}/resources/back-end/assets/js/sidebar.js"></script>
<!-- !!固定!! 旁邊導覽列sidebar menu end -->


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

                                    <h3>後台管理 -HOME</h3>
                                    <p class="text-subtitle text-muted">歡迎來到陪你e生e世 服務平台：後台管理HOME</p>

                                </div>

                        <!--右上方標註目前在哪個頁面-->
                                <div class="col-12 col-md-6 order-md-2 order-first">
                                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="back-index.html">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Home Page</li>
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
                                <div class="card-body">

        <form id="form" method="post" action="<%=request.getContextPath()%>/back-end/ame/ame.do" enctype="multipart/form-data">
        <div>
            <label for="amename">公設名稱 : </label>
            <input type="text" id="amename" name="amename"></input>
        </div>
        <div>
            <label for="amemax">人數上限 : </label>
            <input type="text" id="amemax" name="amemax"></input>
        </div>
        <div>
            <label for="ameintroduce">公設介紹 : </label>
            <input type="text" id="ameintroduce" name="ameintroduce"></input>
        </div>
        <div>
            <label for="amepoint">公設點數 : </label>
            <input type="text" id="amepoint" name="amepoint"></input>
        </div>

        <div>
            <label for="opentime">開放時間 : </label>
            <select name="opentime" id="opentime">
                <option value="0" selected>00:00</option>
                <option value="1">01:00</option>
                <option value="2">02:00</option>
                <option value="3">03:00</option>
                <option value="4">04:00</option>
                <option value="5">05:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
            </select>
        </div>

        <div>

            <label for="closetime">開放時間 : </label>
            <select name="closetime" id="closetime">
                <option value="0" selected></option>
                <option value="1">01:00</option>
                <option value="2">02:00</option>
                <option value="3">03:00</option>
                <option value="4">04:00</option>
                <option value="5">05:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
                <option value="24">00:00</option>
            </select>
        </div>

        <div>
            <label for="ameimg">公設圖片 : </label>
            <input type="file" id="ameimg" name="ameimg"></input>
        </div>

        <div>
            <input type="hidden" name="action" value="addOneAme" />
            <input type="submit" value="送出" />
        </div>
    </form>
    
	
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
                        <p>2022 &copy; 陪你e生e世　社區服務平台</p>
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

<script>
    $(function () {
        $('#form').validate({
            onkeyup: function (element, event) {
                //去除左側空白
                var value = this.elementValue(element).replace(/^\s+/g, "");
                $(element).val(value);
            },

            rules: {
                amename: {
                    required: true,
                    checkInput: true ,
                    minlength: 2
                },
                amemax: {
                    required: true,
                    number: true
                },
                ameintroduce:{
                 required : true
                },
                 amepoint: {
                    required: true,
                    number: true
                },
                ameimg: {
                    required: true
                },
                closetime: {
                    checkOpening: true
                },
            },
                messages: {
                    amename: {
                        required: '必需填',
                        checkInput: '只能是中、英文、數字和- , 請　重　新　輸　入　！！！',
                        minlength: '公設名稱最少兩字 請重新輸入'
                    },
                    amemax: {
                        required: '必需填',
                        number: '人數需為數字'
                    },
                    ameintroduce: '必需填',
                    amepoint: {
                        required: '必需填',
                        number: '人數需為數字'
                    },
                    closetime: {
                    checkOpening: '關閉時間不能小於、等於開放時間 請 重 新 選 ！！！'
                    },
                    ameimg: {
                    required: '必需選'
                     },
                },
            });
    });

    $.validator.addMethod("checkInput", function(value, element) {
        var pattern = new RegExp("[.`~!@#$^&*=|{}':;',\\[\\]<>《》/?~！@#￥……&*|{}【】‘；：”“'。，、？' ']");
        var reg = /^([0-9]+)$/;
    if(pattern.test(value)) {
        return false;
    } else if(value.indexOf(" ") != -1){
        return false;
    } else {
        return true;
    }
}, "禁止输入特殊字符");

$.validator.addMethod("checkOpening", function(value, element){
    let opentime = document.getElementById("opentime").value;
    opentime = parseInt(opentime);
    
    let closetime = document.getElementById("closetime").value;
    closetime = parseInt(closetime);
    return(closetime > opentime);
    
}, );
$.validator.setDefaults({
	submitHandler: function (form) {
		alert("新增公共設施成功喔！！！");
		form.submit();
	}
});
</script>
</body>
</html>




