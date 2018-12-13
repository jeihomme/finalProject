<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	.test b{
		float:left;
		cursor:pointer;
		padding:10px;
		margin: 0 auto;
	}
	
	#location {
		border: 1px solid #fff;
		width: 1200px;
		height: auto;
		margin: 10px auto;
		
	}
</style>

<div class="test">
	<p onclick="location.href= '/main' "> 메인으로 </p>
</div>

<div id="location">
	<div>
		바 소개글
	</div>

</div>

<div class="test">
	<p onclick="location.href= '/bar/barlist' "> 바 리스트로 </p>
</div>    