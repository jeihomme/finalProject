<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	
	.container2{
		display:inline;
		background-color:gray;
	}
	.topleft{
		display:inline;
		width:100px;
		height:100px;
/* 		border:1px solid white; */
	}
	.back{
		padding-right:150px
	}
	.barName{
		padding-left:150px;
		text-align:center;
		font-size:38px;
	}
	
</style>


<div class="container1">
	<div class="back topleft" onclick="location.href= '/bar/barlist' ">뒤로가기</div>
	<div class="barName topleft"> ${view.barName }</div>
	<div class="update">
		<p onclick="location.href='/bar/barupdate'">수정하기</p>
	</div>
	<div class="calendar">
		<p onclick="location.href='/bar/calendar'">스케줄보기</p>
	</div>
	<div class="map">
		<p onclick="location.href='/bar/map'">위치보기</p>
	</div>
</div> <br><br><br><br><br>

<div id="body">
<form name="view" method="get">
<!-- 	<div id="barInfo"> -->
			
			<div id="barInfo">
				${view.barInfo }<br>
			</div>
			
			<div id="barInfo">
				${view.manager }<br>
			</div>
			
			<div id="barInfo">
				${view.barAddress}<br>
			</div>
			
			<div id="barInfo">
				${view.genreName }<br>
			</div>
		
<!-- 	</div> -->
</form>
</div>

<div class="test">
	<p onclick="location.href= '/bar/barlist' "> 바 리스트로 </p>
</div>    