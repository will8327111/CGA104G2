<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style type="text/css">
body {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    min-height: 100vh;
    flex-direction: column;
}

svg {
    width: 400px;
	height: 400px;
}

h2 {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    font-size: 36px;
    margin-top: 40px;
    color: #333;
    opacity: 0;
}

input[type="checkbox"]:checked~h2 {
    animation: .6s title ease-in-out;
    animation-delay: 1.2s;
    animation-fill-mode: forwards;
}

.circle {
    stroke-dasharray: 1194;
    stroke-dashoffset: 1194;
}

@keyframes circle {
    from {
        stroke-dashoffset: 1194;
    }
    to {
        stroke-dashoffset: 2388;
    }
}

input[type="checkbox"]:checked+svg .circle {
    animation: circle 1s ease-in-out;
    animation-fill-mode: forwards;
}

.tick {
    stroke-dasharray: 350;
    stroke-dashoffset: 350;
}

@keyframes tick {
    from {
        stroke-dashoffset: 350;
    }
    to {
        stroke-dashoffset: 0;
    }
}

input[type="checkbox"]:checked+svg .tick {
    animation: tick 0.8s ease-in-out;
    animation-fill-mode: forwards;
    animation-delay: .95s;
}

@keyframes title {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
</style>
</head>
<body>
<input type="checkbox" hidden="" id="check123">
		<svg>
			<circle class="circle" fill="none" stroke="#68E534" stroke-width="20" cx="200" cy="200" r="190" stroke-linecap="round" transform="rotate(-90,200,200)"></circle>
			<polyline class="tick" fill="none" stroke="#68E534" stroke-width="24" points="88,214 173,284 304,138" stroke-linecap="round" stroke-linejoin="round"></polyline>
			<h2>匯款繳費已完成，請等待審核!</h2>
		</svg>
	<script>
	document.getElementById('check123').checked=true;
	</script>

</body>
</html>