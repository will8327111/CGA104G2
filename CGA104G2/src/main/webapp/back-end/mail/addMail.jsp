<%-- <%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%-- <%@ page import="com.mail.model.*"%> --%>

<%-- <% --%>
//   MailVO mailVO = (MailVO) request.getAttribute("mailVO");
<%-- %> --%>

<!-- <html> -->

<!-- <head> -->
<!--     <title>Insert title here</title> -->

<!--     <style> -->
/* /*     	*{ */ */
/* /*     		font-size:0px; */ */
/* /*     	} */ */
/*         .content { */
/*             border: 1px solid red; */
/*             font-size:16px; */
/*         } */

/*         .content td { */
/*             border: 1px solid black; */
/*             font-size:16px; */
/*         } */
/* /*         input{ */ */
/* /*         	font-size:16px; */ */
/* /*         } */ */
/* /*         .err{ */ */
/* /*         	font-size:16px; */ */
/* /*         } */ */
/* /*         .h4{ */ */
/* /*         	font-size:16px; */ */
/* /*         } */ */
<!--     </style> -->
<!-- </head> -->

<%-- <%-- 錯誤表列 --%> --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red" class="err">請修正以下錯誤:</font> -->
<!-- 	<ul class="err"> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red" class="err">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

<!-- <body> -->
<!-- <h4 class='h4'><a href="select_page.jsp" class='h4'>回首頁</a></h4> -->
<!--     	<form action="mail.do" method="POST" enctype="multipart/form-data"> -->
<!-- 		    <table class="content"> -->
<!-- 			    <tr> -->
<!-- 			      	<td>查詢住戶編號:</td> -->
<!-- 			     	<td> -->
<!-- 				       	<input type="text" name="memberName" placeholder="請輸入住戶姓名"  -->
<%-- 				       		value="<%= (mailVO == null)? "" : mailVO.getMemberName()%>"> --%>
<!-- 				       	<input type="hidden" name="action" value="get_Member_Name"> -->
<!-- 				       	<input type="submit" value="搜尋"></input> -->
<!-- 			      	</td> -->
<!-- 		 	 	</tr> -->
<!-- 		    </table> -->
<!-- 	    </form> -->
	    
<!--         <form action="mail.do" method="POST" enctype="multipart/form-data"> -->
<!--             <table class="content"> -->
                
<!--                 <tr> -->
<!--                     <td>住戶編號:</td> -->
<%--                     <td><input type="text" name="memberId" value="${mailVO.memberId}"></td> --%>
<%-- <%--                     <td>${errorMsgs.ename}</td> --%> --%>
<!--                 </tr> -->

<!--                 <tr> -->
<!--                     <td>郵件項目:</td> -->
<!--                     <td><input type="radio" name="mailType" value="包裹" checked>包裹 -->
<!--                         <input type="radio" name="mailType" value="掛號">掛號 -->
<!--                     </td> -->
<!--                 </tr> -->

<!--                 <tr> -->
<!--                     <td>郵件到達時間:</td> -->
<!--                     <td><input type="text" id=mailDelTime name="mailDelTime"></td> -->
<!--                 </tr> -->
				
<!--                 <tr> -->
<!-- 					<td> -->
<!-- 						<input type="hidden" name="action" value="insert"> -->
<!-- 						<input type="submit" value="資料送出"></input> -->
<!-- 					</td> -->
<!--                 </tr> -->
<!--             </table> -->
<!--         </form> -->


    
<!-- </body> -->

<%-- <%  --%>
//   java.sql.Date mailDelTime = null;
//   try {
// 	  mailDelTime = mailVO.getMailDelTime();
//    } catch (Exception e) {
// 	   mailDelTime = new java.sql.Date(System.currentTimeMillis());
//    }
<%-- %> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" /> --%>
<%-- <script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script> --%>

<!-- <style> -->
/*   .xdsoft_datetimepicker .xdsoft_datepicker { */
/*            width:  300px;   /* width:  300px; */ */
/*   } */
/*   .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box { */
/*            height: 151px;   /* height:  151px; */ */
/*   } */
<!-- </style> -->

<!-- <script> -->
// //===========================================錯誤判斷==========================================
	
	
// //===========================================日期=============================================
//         $.datetimepicker.setLocale('zh');
//         $('#mailDelTime').datetimepicker({
// 	       theme: '',              //theme: 'dark',
// 	       timepicker:false,       //timepicker:true,
// 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
// 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%-- 		   value: '<%=mailDelTime%>', // value:   new Date(), --%>
//            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
//            //startDate:	            '2017/07/10',  // 起始日
//            //minDate:               '-1970-01-01', // 去除今日(不含)之前
//            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
//         });

<!-- </script> -->
<!-- </html> -->