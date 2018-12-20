<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
	#barInfo{
		color:black;
	}
	
	.btn{
		margin-left: 69%;
	}
</style>

<div class="container1">
	<div class="back topleft" onclick="location.href= '/bar/barlist' ">뒤로가기</div>
	<div class="barName topleft"> ${info.barName }</div>
</div>

<form action="/bar/updatebarinfo" method="post" enctype="multipart/form-data">
	<img src="https://${info.path }/${info.originName }">
	Informaiton <textarea id="barInfo" name="barInfo" rows="20" cols="40" >${info.barInfo }</textarea><br>
	담당자 <input type="text" name="manager" value="${info.manager }"/><br><br>
	연락처 <input type="text" name="contact" value="${info.contact }"/>
	
	<div class="btn">
		<button id="btnUpdate" class="btn btn-warning">수정하기</button>
	
		<a href ="/bar/viewbar?barNo=${info.barNo }"><button  type="button" class="btn btn-warning" style="margin-left: 0px" >취소</button></a>
	</div>
</form>
