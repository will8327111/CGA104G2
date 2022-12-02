<%@page import="com.memberLogin.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>陪你e生e世　社區服務平台 前台登入</title>
  <!-- ===== Iconscout CSS ===== -->
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">


  <!-- ===== CSS ===== -->
  <style>
    /* ===== Google Font Import - Poformsins ===== */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: #ffffff;
    }

    /*========= body背景色變化 ===============*/

    body {
      animation: bgchange 40s ease infinite;

    }

    @keyframes bgchange {
      0% {
        background: #ffe6e1;
      }

      25% {
        background: #e8f5bb;
      }

      50% {
        background: #c1d2f9;
      }

      75% {
        background: #f7f7c6;
      }

      90% {
        background: #b2dffb;
      }

      100% {
        background: #d7f4ee;
      }

    }

    .container {
      position: relative;
      max-width: 430px;
      width: 100%;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 10px rgba(86, 85, 85, 0.1);
      overflow: hidden;
      margin: 0 20px;
    }

    .container .forms {
      display: flex;
      align-items: center;
      height: 440px;
      width: 200%;
      transition: height 0.2s ease;
    }


    .container .form {
      width: 50%;
      padding: 30px;
      background-color: #fff;
      transition: margin-left 0.18s ease;
    }

    .container.active .login {
      margin-left: -50%;
      opacity: 0;
      transition: margin-left 0.18s ease, opacity 0.15s ease;
    }

    .container .signup {
      opacity: 0;
      transition: opacity 0.09s ease;
    }

    .container.active .signup {
      opacity: 1;
      transition: opacity 0.2s ease;
    }

    .container.active .forms {
      height: 600px;
    }

    .container .form .title {
      position: relative;
      font-size: 27px;
      font-weight: 600;
    }

    .form .title::before {
      content: '';
      position: absolute;
      left: 0;
      bottom: 0;
      height: 3px;
      width: 30px;
      background-color: #4070f4;
      border-radius: 25px;
    }

    .form .input-field {
      position: relative;
      height: 50px;
      width: 100%;
      margin-top: 30px;
    }

    .input-field input {
      position: absolute;
      height: 100%;
      width: 100%;
      padding: 0 35px;
      border: none;
      outline: none;
      font-size: 16px;
      border-bottom: 2px solid #ccc;
      border-top: 2px solid transparent;
      transition: all 0.2s ease;
    }

    .input-field input:is(:focus, :valid) {
      border-bottom-color: #4070f4;
    }

    .input-field i {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      color: #999;
      font-size: 23px;
      transition: all 0.2s ease;
    }

    .input-field input:is(:focus, :valid)~i {
      color: #4070f4;
    }

    .input-field i.icon {
      left: 0;
    }

    .input-field i.showHidePw {
      right: 0;
      cursor: pointer;
      padding: 10px;
    }

    .form .checkbox-text {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: 20px;
    }

    .checkbox-text .checkbox-content {
      display: flex;
      align-items: center;
    }

    .checkbox-content input {
      margin-right: 10px;
      accent-color: #4070f4;
    }

    .form .text {
      color: #333;
      font-size: 14px;
    }

    .form a.text {
      color: #4070f4;
      text-decoration: none;
    }

    .form a:hover {
      text-decoration: underline;
    }

    .form .button {
      margin-top: 35px;
    }

    .form .button input {
      border: none;
      color: #fff;
      font-size: 17px;
      font-weight: 500;
      letter-spacing: 1px;
      border-radius: 6px;
      background-color: #4070f4;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .button input:hover {
      background-color: #8f9ec6;
    }

    .form .login-signup {
      margin-top: 30px;
      text-align: center;
    }

    /*==================================================
slider css
===================================*/
    .slider {
      position: relative;
      z-index: 1;
      height: 100vh;
    }

    .slider-item01 {
      background: url(<%=request.getContextPath()%>/resources/front-end/assets/img/main_sakura_s.jpg);
      opacity: 80%;
      border-radius: 5px;
    }


    .slider-item {
      width: 100%;
      height: 100vh;
      background-repeat: no-repeat;
      background-position: center;
      background-size: cover;
    }


    /*========= layout ===============*/
    ul {
      margin: 0;
      padding: 0;
      list-style: none;
    }

    a {
      color: #fff;
    }

    a:hover,
    a:active {
      text-decoration: none;
    }

    h1 {
      position: absolute;
      z-index: 2;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
      font-size: 3.8vw;
      letter-spacing: 0.1em;
      color: #fff;
    }

    .wrapper {
      position: relative;
    }

    .container {
      background: #555;
    }

    .container p {
      padding: 300px 0;
      text-align: center;
      color: #fff;
    }

    #slide {
      z-index: -10;
      width: 600px;
    }
  </style>

  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
  <!--<title>Login & Registration Form</title>-->
</head>
<body>

<div>
  <div id="slide" class="wrapper">
    <h1>陪你e生e世</h1>
    <ul class="slider">
      <li class="slider-item slider-item01"></li>
    </ul>
    <!--/wrapper-->
    <div style="width:800px" class="container">
      <!--/container-->
    </div>
  </div>
</div>


<!-- 登入表單 -->
<div class="container">
  <div class="forms">
    <div class="form login">
      <span class="title">用戶登入</span>

      <%--      <form method="post" action="<%=request.getContextPath()%>/front-end/memberLogin/MemberLogin.do">--%>
      <div style="color:red">${errorMsgs}</div>

      <form method="post" action="<%=request.getContextPath()%>/front-end/memberLogin/MemberLogin.do">
        <div class="input-field">
          <input type="text" name="memberAc" placeholder="輸入您的帳號" >
          <i class="uil-user-circle"></i>
        </div>
        <div class="input-field">
          <input type="password" name="memberPw"  class="password" placeholder="輸入您的密碼" >
          <i class="uil uil-lock icon"></i>
          <i class="uil uil-eye-slash showHidePw"></i>
        </div>

        <div class="checkbox-text">
          <div class="checkbox-content">

            <%--						<div>--%>
            <%--							<input type="hidden" name="action" value="textForLogin"> <span>--%>
            <%--					<input type="submit" value="登入">--%>
            <%--				</span> <span><input type="submit" value="忘記密碼"></span>--%>
            <%--						</div>--%>

            <input type="checkbox" id="logCheck">
            <label for="logCheck" class="text">記住我</label>
          </div>

          <span><input style="border-color: #4079a5; background-color: #c9def4; color:#1c4784; border-radius: 5px" type="submit" value="忘記密碼"></span>
        </div>

        <div class="input-field button">
          <input type="hidden" name="action" value="textForLogin">
          <span>
					<input type="submit" value="登入">
				</span>
        </div>
      </form>

      <div class="login-signup">
                    <span class="text">還不是用戶?
                        <a href="../../back-end/member/addMember.jsp" class="text signup-link">請先找社區管理員註冊</a>
                    </span>
      </div>

    </div>
  </div>
</div>

<%--	登入畫面用js--%>
<script>
  const container = document.querySelector(".container"),
          pwShowHide = document.querySelectorAll(".showHidePw"),
          pwFields = document.querySelectorAll(".password"),
          signUp = document.querySelector(".signup-link"),
          login = document.querySelector(".login-link");

  //   js code to show/hide password and change icon
  pwShowHide.forEach(eyeIcon => {
    eyeIcon.addEventListener("click", () => {
      pwFields.forEach(pwField => {
        if (pwField.type === "password") {
          pwField.type = "text";

          pwShowHide.forEach(icon => {
            icon.classList.replace("uil-eye-slash", "uil-eye");
          })
        } else {
          pwField.type = "password";

          pwShowHide.forEach(icon => {
            icon.classList.replace("uil-eye", "uil-eye-slash");
          })
        }
      })
    })
  })

  // js code to appear signup and login form
  signUp.addEventListener("click", () => {
    container.classList.add("active");
  });
  login.addEventListener("click", () => {
    container.classList.remove("active");
  });


</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>