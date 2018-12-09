<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	background-color:#000000;
	color:#ffffff;
}

.enterImage {
	text-align:center;
}


.enterImage img {
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="enterImage">
		<h1>홈페이지에 오신 것을 환영합니다.</h1>
		<img onclick=" location.href='/main' " src="resources/jazzEnterImage.jpg"/>
	</div>
</body>
</html>