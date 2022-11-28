<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bulletinboard.model.*" %>

<%
    BulletinboardVO bulletinboardVO = (BulletinboardVO) request.getAttribute("bulletinboardVO");
%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>公佈欄資料修改</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
</head>

<body>
<ul class="form-group">
<tr>
    <td>
        <h3>公佈欄資料修改</h3>
        <br>
<%--        <h4><a href="${pageContext.request.contextPath}/index.jsp"><img src="./images/back.svg" width="30" height="30"--%>
<%--                                                                        alt="返回">回首頁</a></h4>--%>
    </td>
</tr>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <span style="color:red">請修正以下錯誤:</span>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do" name="form1" enctype="multipart/form-data">
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-header">
<%--                    <h4 class="card-title">Update Bulletinboard</h4>--%>
                    <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-auto">
                            <table>
                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄編號:</td>
                                    <td><%=bulletinboardVO.getBbSubId()%></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄類別:</td>
                                    <td><input type="TEXT" name="bbclass" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbClass()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄標題:</td>
                                    <td><input type="TEXT" name="bbtitle" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbTitle()%>"/></td>
                                </tr>

                                <tr>
                                    <td><span style="color: red; "><b>*</b></span>公佈欄內文:</td>
                                    <td><input type="text"  style="width:100%;height:100px ;" name="bbcontent" class="form-control"
                                           value="<%=bulletinboardVO.getBbContent()%>"/>

                                    </td>
                                    <td>
<%--                                        <div class="mb-3 mt-3">--%>
<%--                                            <label for="bbcontent">Comments:</label>--%>
<%--                                            <textarea class="form-control" rows="5" id="bbcontent" name="bbcontent"--%>
<%--                                                      value="<%=bulletinboardVO.getBbContent()%>"/></textarea>--%>
<%--                                        </div>--%>

                                </tr>
                                <tr>
                                    <td>公佈欄發佈日期:</td>
                                    <td><input type="TEXT" name="bbpostdate" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbPostdate()%>"/></td>
                                </tr>

                                <tr>
                                    <td>公佈欄更新日期:</td>
                                    <td><input type="TEXT" name="bbupdate" size="40" class="form-control"
                                               value="<%=bulletinboardVO.getBbUpdate()%>"/></td>
                                </tr>
<%--                                <tr>--%>
<%--                                    <td>公佈欄圖:<td><img src="<%=request.getContextPath()%>/bulletinboardpic/BulletinBoardPicServlet?bbpicid=${bulletinboardpicVO.bbPicId}" width="200px">--%>
<%--                                    <input name="bbpic" class="form-control"  type="file" value="<%=bulletinboardVO.getBbPic()%>"></td></td>--%>
<%--                                </tr>--%>

                                <tr>
                                    <td>公佈欄管理員:</td>
                                    <td>
                                        <select size="1" name="bmid" class="form-select">

                                        <option value="1" <c:if test="${bulletinboardVO.bmId==('1')}"> selected="selected"</c:if>>1:邱艾倫</option>
                                        <option value="2" <c:if test="${bulletinboardVO.bmId==('2')}"> selected="selected"</c:if>>2:威爾高</option>
                                            <option value="3" <c:if test="${bulletinboardVO.bmId==('3')}"> selected="selected"</c:if>>3:吸精瓶</option>

                                    </select>
                                    </td>
                                </tr>


                                <tr>
                                   <td><span style="color: red; "><b>*</b></span>公佈欄狀態:</td>
                                    <td>
                                        <select size="1" name="bbarticalstate" class="form-select">
<%--                                            <option value="<%= (memberVO== null)?"":memberVO.getAcState()%>"><%=(memberVO== null)?"請選擇帳號狀態":memberVO.getAcState()%></option>--%>
                                            <option value="0" <c:if test="${bulletinboardVO.bbArticalState==('0')}"> selected="selected"</c:if>>0:下架</option>
                                            <option value="1" <c:if test="${bulletinboardVO.bbArticalState==('1')}"> selected="selected"</c:if>>1:上架</option>

                                        </select>
                                       </td>
                                </tr>


                            </table>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="bbsubid" value="<%=bulletinboardVO.getBbSubId()%>"/>
                <input type="submit" class="btn btn-outline-primary" value="送出修改">
            </div>
        </section>
    </div>

</FORM>

<%--   <script type="text/javascript">--%>
<%--       function changeText(){--%>
<%--           document.getElementById("bbcontent").value=document.getElementById("bbcontent1").value;--%>
<%--       }--%>
<%--   </script>--%>


<%--<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->--%>

<link rel="stylesheet" type="text/css"
      href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css"/>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
    .xdsoft_datetimepicker .xdsoft_datepicker {
        width: 300px; /* width:  300px; */
    }

    .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
        height: 151px; /* height:  151px; */
    }
</style>

<script>
    $.datetimepicker.setLocale('zh');
    $('#f_date1').datetimepicker({
        theme: '',              //theme: 'dark',
        timepicker:true,       //timepicker:true,
        step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
        format: 'Y-m-d',         //format:'Y-m-d H:i:s',
        value: '<%=bulletinboardVO.getBbUpdate()%>', // value: new Date()
<%--        //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含--%>
<%--        //startDate:	            '2017/07/10',  // 起始日--%>
<%--        //minDate:               '-1970-01-01', // 去除今日(不含)之前--%>
<%--        //maxDate:               '+1970-01-01'  // 去除今日(不含)之後--%>
    });


</script>
</body>
</html>