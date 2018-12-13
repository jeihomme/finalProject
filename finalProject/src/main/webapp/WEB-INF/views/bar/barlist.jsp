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

<h2>Bar List</h2>
<hr>

<c:forEach var="row" items="${list }">
	<div class="test">
		<p onclick="location.href= '/bar/viewbar' "> <img src="/resources/testimage/1.png"> </p> 
		<p class="font" onclick="location.href= '/bar/viewbar?barName=${row.barName}'"> ${row.barName } </p> 
	</div>
</c:forEach>

