<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>公佈欄查詢</title>

    <link href="${pageContext.request.contextPath}/resources/back-end/assets/css/main/app.css" rel="stylesheet">

</head>
<body>

<div>
    <tr>
        <td><h3 class="page-title-headings">公佈欄查詢</h3></td>
    </tr>
</div>
<br>
<h4><a href="${pageContext.request.contextPath}/back-end/bulletinboard/Bboard_index.jsp">回首頁</a></h4>

<c:if test="${not empty errorMsgs}">
    <span style="color:red">請修正以下錯誤:</span>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<ul>
    <div class="page-content">
        <section class="section">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="row-cols-md-10">
                            <li><a href='${pageContext.request.contextPath}/back-end/bulletinboard/listAllBboard.jsp'>列出全部公布欄</a>  <br><br></li>
                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do">
                                    <b>請輸入公佈欄編號 (如數字：1):</b>
                                    <input type="text" name="bbsubid">
                                    <input type="hidden" name="action" value="getOneBb_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <jsp:useBean id="bulletinboardSvc" scope="page" class="com.bulletinboard.model.BulletinboardService"/>

                            <li>
                                <FORM METHOD="get" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do">
                                    <b>選擇公佈欄編號:</b>
                                    <select size="1" name="bbsubid" class="form-select">
                                        <c:forEach var="bulletinboardVO" items="${bulletinboardSvc.all}">
                                        <option value="${bulletinboardVO.bbSubId}">${bulletinboardVO.bbSubId}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOneBb_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <li>
                                <FORM METHOD="get" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do">
                                    <b>選擇公佈欄類別:</b>
                                    <select size="1" name="bbsubid" class="form-select">
                                        <c:forEach var="bulletinboardVO" items="${bulletinboardSvc.all}">
                                        <option value="${bulletinboardVO.bbSubId}">${bulletinboardVO.bbClass}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOneBb_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>
                            </li>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do">
                                    <b>選擇公佈欄標題: </b>
                                    <select size="1" name="bbsubid" class="form-select">
                                        <c:forEach var="bulletinboardVO" items="${bulletinboardSvc.all}">
                                        <option value="${bulletinboardVO.bbSubId}">${bulletinboardVO.bbTitle}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOneBb_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>

                            </li>

                            <li>
                                <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/bulletinboard/bulletinboard.do">
                                    <b>選擇社區規約: </b>
                                    <select size="1" name="bbsubid" class="form-select">
                                        <c:forEach var="bulletinboardVO" items="${bulletinboardSvc.all}">
                                        <option value="${bulletinboardVO.bbSubId}">${bulletinboardVO.bbTitle}
                                            </c:forEach>
                                    </select>
                                    <input type="hidden" name="action" value="getOneBb_For_Display">
                                    <input type="submit" class="btn btn-outline-primary" value="送出">
                                </FORM>

                            </li>


                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</ul>
<div class="page-link">
</div>

</body>
</html>