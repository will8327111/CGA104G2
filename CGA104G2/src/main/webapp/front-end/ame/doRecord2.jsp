<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約頁面2</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<Style>
.form {
	
}
</Style>
</head>
<body>

	<table>
		<tr>
			<td>
				<h1>顯示時段</h1>
				<h4>
					<a href="<%=request.getContextPath()%>/front-end/ame/showAme.jsp">回瀏覽頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<c:forEach items="${statime}" var="tmp" varStatus="loop">
			<c:if test="${tmp == 0}">
					<form METHOD="post" id="form1" ACTION="<%=request.getContextPath()%>/front-end/ame/ame_sta.do">
						<input type="hidden" name="action" value="doRecord3">
						<input type="hidden" name="ameid" value="${ameid}">
						<input type="hidden" name="ame_StaDate" value="${ame_StaDate}">
						<input type="hidden" name="statime" value="${statime}">
						<input type="hidden" name="statime_ind" value="${loop.index}">
						<input type="button" onclick="test()" value="${loop.index}:00" class="btn btn-success btn-lg"><br>
					</form>
			</c:if>
			<c:if test="${tmp == 1}">
					<button value="${loop.index}" disabled="disabled" class="btn btn-danger btn-lg">${loop.index}:00</button>
					<br>
			</c:if>
		</c:forEach>
	</table>
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
// Swal.fire({
// 	  position: 'top-end',
// 	  icon: 'success',
// 	  title: 'Your work has been saved',
// 	  showConfirmButton: false,
// 	  timer: 1500
// 	})
function test() {
	let form = document.getElementById("form1")
	Swal.fire({
  		position: 'center',
 		icon: 'success',
 		title: '預約成功喔',
 		showConfirmButton: false,
  		timer: 3000
	}).then(function (){
		form.submit();
	})
	}

</script>

</body>
</html>




