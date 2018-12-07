<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html id="html">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 	모든 페이지에 적용되는 스타일 */

.wrap {
	width: 700px;
	margin: 0 auto;
}

.header {
/* 	width: 700px; */
	border: 1px solid red;
}

.footer {
/* 	width: 700px; */
	border: 1px solid blue;
}

#body{
	background-color:#000000;
	text-color:#ffffff;
}

</style>

<script
	type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js">
</script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	
</head>
<body id="body">
	<!-- header -->
	<tiles:insertAttribute name="header"/>

	<!-- body -->
	<div class="wrap">
		<tiles:insertAttribute name="body"/>
	</div>
	
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
</body>

</html>