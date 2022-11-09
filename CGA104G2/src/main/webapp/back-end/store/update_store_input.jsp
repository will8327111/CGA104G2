<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>

<%
  StoreVO storeVO = (StoreVO) request.getAttribute("storeVO"); 
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改 - update_store_input.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_store_input.jsp</h3>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">請修正以下錯誤:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

<FORM METHOD="post" ACTION="store.do" name="form1">
<table>
	<tr>
		<td>住戶編號:</td>
		<td><input type="TEXT" name="storeId" size="45" value="<%=storeVO.getStoreId()%>" /></td>
	</tr>
	<tr>
		<td>郵件項目:</td>
		<td><input type="TEXT" name="storeInfo" size="45" value="<%=storeVO.getStoreInfo()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="storeId" value="<%=storeVO.getStoreId()%>">
<input type="submit" value="送出修改"></FORM>
</body>




</html>