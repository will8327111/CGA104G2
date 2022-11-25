 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		 	
			   	<input  id="id" type="TEXT" name="ID">ID
			     <input type="hidden" name="action" value="ID">
					<input type="submit" onclick="html()" value="登入">
	
	

<script>

async function html(){
	const id = document.getElementById("id").value
	console.log(id)
	let kk = await fetch("../../activity/ActServlet?action=ID&ID="+id,  { method: 'post' })
	let res = await fetch("../../activity/ActServlet?action=getName&memId="+id,  { method: 'post' })
		let data = await res.json();
		let name = data.name
	sessionStorage.setItem("name",name)
			sessionStorage.setItem('id',id);
			location = "homepage3.html"
		
}

</script>


</body>
</html>	