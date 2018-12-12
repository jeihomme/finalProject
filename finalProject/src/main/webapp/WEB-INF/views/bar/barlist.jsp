<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	.test {
		display: inline-block;
	}
	.test img{
		width: 130px;
	}
	.font {
		text-align:center;
	}
</style>

<div class="test">
	<p onclick="location.href= '/main' "> 메인으로 </p>
</div> <br>

<div class="test">
	<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/1.png"> </p> 
	<p class="font" onclick="location.href= '/bar/viewbar' "> 1번 바 </p> 
</div>

<div class="test">
	<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/2.jpg"> </p> 
	<p class="font" onclick="location.href= '/bar/viewbar' "> 2번 바 </p> 
</div>

<div class="test">
	<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/3.jpg"> </p> 
	<p class="font" onclick="location.href= '/bar/viewbar' "> 3번 바 </p> 
</div>

<div class="test">
	<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/4.jpg"> </p> 
	<p class="font" onclick="location.href= '/bar/viewbar' "> 4번 바 </p> 
</div>

<div class="test">
	<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/5.jpg"> </p> 
	<p class="font" onclick="location.href= '/bar/viewbar' "> 5번 바 </p> 
</div>

<div class="test">
	<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/6.jpg"> </p> 
	<p class="font" onclick="location.href= '/bar/viewbar' "> 6번 바 </p> 
</div>