 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.min.js"></script>
</head>
<body>

		 	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/ActServlet" style="margin-bottom: 0px;">
			   	<input  id="id" type="TEXT" name="ID">ID
			     <input type="hidden" name="action" value="ID">
					<input type="submit" onclick="html()" value="登入">
			     </FORM>


<script>


	function html(){
		const id = \$("#id").val();
		sessionStorage.setItem('id',id);
	}




</script>


</body>
</html>	