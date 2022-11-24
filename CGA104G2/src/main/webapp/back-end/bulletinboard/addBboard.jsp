<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bulletinboard.model.*" %>
<%--<%@ page import="com.bulletinboardpic.model.*" %>--%>
<%--<%@ page import="com.bulletinboardpic.model.BulletinBoardPicVO" %>--%>
<%--<%@ page import="com.bulletinboardpic.model.*" %>--%>

<%
    BulletinboardVO bulletinboardVO = (BulletinboardVO) request.getAttribute("bulletinboardVO");
%>
<%--<%--%>
<%--    BulletinBoardPicVO bulletinBoardPicVO = (BulletinBoardPicVO) request.getAttribute("bulletinboardpicVO");--%>
<%--%>--%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>公佈欄資料新增 - addBulletinboard.jsp</title>
    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">
   </head>

<body>

    <h4><a href="${pageContext.request.contextPath}/back-end/bulletinboard/Bboard_index.jsp">
        <img src="${pageContext.request.contextPath}/resources/back-end/assets/images/main/favicons/back.svg" width="30" height="30"
                                                                    alt="返回">回首頁</a></h4>

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
                <ul class="form-group">
                    <div class="card">
                        <div class="card-header">
                        <h3>公佈欄資料新增 - addBulletinboard.jsp 新</h3>
                        <br>
                        <h4 class="card-title">新增公佈欄</h4>
                        <h4 class="card-subtitle">標示<span style="color: red; "><b>紅色*</b></span>為必填項目</h4>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-auto">
                                    <table>
                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>公佈欄類別:</td>
                                        <td>
                                            <select size="1" style="width:inherit" type="test" name="bbclass" class="form-select" id="bbclass">
                                                <option value="
                                                                <%= (bulletinboardVO== null)?"":bulletinboardVO.getBbClass()%>">
                                                    <%=(bulletinboardVO== null)?"請選擇公佈欄類別":bulletinboardVO.getBbClass()%>
                                                </option>
                                                <option value="重大事項宣導" >重大事項宣導</option>
                                                <option value="管委會議記錄" >管委會議記錄</option>
                                                <option value="社區規約" >社區規約</option>
                                                <option value="社區財報" >社區財報</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>文章標題:</td>
                                        <td><input type="TEXT" name="bbtitle" size="40" class="form-control"
                                                   value="<%= (bulletinboardVO==null)?
                                                    "請住戶們共同協助守護社區回收場的整潔，讓環境能夠更美好。" : bulletinboardVO.getBbTitle()%>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>文章內容:</td>
                                        <td>
                                            <div class="mb-3 mt-3">
                                                <label for="bbcontent">Comments:</label>
                                                <textarea class="form-control" rows="5" id="bbcontent" name="bbcontent"
                                                          value="<%= (bulletinboardVO==null)? "" : bulletinboardVO.getBbContent()%>"></textarea>
                                            </div>

                                        </td>
                                    </tr>

                                        <tr>
                                            <td>上傳圖檔:</td>
                                            <td><input type="file" name="bbpic" class="form-control"/>
                                            </td>
                                        </tr>

                                    <tr>
                                        <td><span style="color: red; width: inherit; "><b>*</b></span>發佈日期:</td>
                                        <td><input type="text" name="bbpostdate" size="15" class="form-control"
                                                   value="<%= (bulletinboardVO==null)? "" : bulletinboardVO.getBbPostdate()%>"/></td>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; width: inherit; "><b>*</b></span>更新日期:</td>
                                        <td><input type="text" name="bbupdate" size="15" class="form-control"
                                                   value="<%= (bulletinboardVO==null)? "" : bulletinboardVO.getBbUpdate()%>"/></td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>發佈狀態:</td>
                                        <td>
                                            <select size="1" style="width:inherit" type="test" name="bbarticalstate" class="form-select" id="bbarticalstate">
                                                <option value="0" selected>0:下架</option>
                                                <option value="1" >1:上架</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><span style="color: red; "><b>*</b></span>管理員:</td>
                                        <td>
                                            <select size="1" style="width:inherit" type="test" name="bmid" class="form-select" id="bmid">
<%--                                                <option value="--%>
<%--                                                               <%= (bulletinboardVO== null)?"":bulletinboardVO.getBmId()%>">--%>
<%--                                                    <%=(bulletinboardVO== null)?"請選擇管理員":bulletinboardVO.getBmId()%>--%>
<%--                                                </option>--%>
                                                <option value="1" selected>1:小丸子</option>
                                                <option value="2" >2:小智</option>
                                                <option value="3" >3:庫拉皮卡</option>
                                            </select>
                                        </td>
                                    </tr>

                                </table>
                                    <div id="msg" class="error"></div>
                                    <input type="hidden" name="action" value="insert">
                                    <input type="submit" class="btn btn-outline-primary" id="btn1"  value="送出新增">
                            </div>
                        </div>
                    </div>
                    </div>
                </ul>
            </section>
        </div>

   </FORM>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%--<%--%>
<%--    java.sql.Date bbPostdate = null;--%>
<%--    try {--%>
<%--        bbPostdate = bulletinboardVO.getBbPostdate();--%>
<%--    } catch (Exception e) {--%>
<%--        bbPostdate = new java.sql.Date(System.currentTimeMillis());--%>
<%--    }--%>
<%--%>--%>
<%--        <%--%>
<%--    java.sql.Date bbUpdate = null;--%>
<%--    try {--%>
<%--        bbUpdate = bulletinboardVO.getBbPostdate();--%>
<%--    } catch (Exception e) {--%>
<%--        bbUpdate = new java.sql.Date(System.currentTimeMillis());--%>
<%--    }--%>
<%--%>--%>
<%--<link rel="stylesheet" type="text/css"--%>
<%--      href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css"/>--%>
<%--<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>--%>

<%--<style>--%>
<%--    .xdsoft_datetimepicker .xdsoft_datepicker {--%>
<%--        width: 300px; /* width:  300px; */--%>
<%--    }--%>

<%--    .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {--%>
<%--        height: 151px; /* height:  151px; */--%>
<%--    }--%>
<%--</style>--%>

<%--<script>--%>
<%--    $.datetimepicker.setLocale('zh');--%>
<%--    $('.f_date1').datetimepicker({--%>
<%--        theme: '',              //theme: 'dark',--%>
<%--        timepicker: true,       //timepicker:true,--%>
<%--        step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)--%>
<%--        format: 'Y-m-d',         //format:'Y-m-d H:i:s',--%>
<%--        value: ''<%=bbPostdate%>''<%=bbUpdate%>'',// value:   new Date(),--%>
<%--        //di
<%--    });--%>

<%--</script>--%>
</body>
</html>
