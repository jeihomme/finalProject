<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.img-rounded{
	border-radius: 10px;
	width: 800;
	height: 600;
}
</style>

<div style="background-color:gray; border-radius:20px;">

	<!-- 밴드 사진 -->
	<div style="border: 2px solid yellow;">
		<img class="img-rounded" src="http://${profile.path }/${profile.originName}" />
	</div>
	
	<!-- 밴드 맴버 -->
	<div style="border: 2px solid yellow;">0
		<table>
			
		</table>
	</div>
	
	<!-- 밴드 History -->
	<div style="border: 2px solid yellow;">
		<table>
		
		</table>
	</div>
	
	<!-- 밴드 소개 -->
	<div style="border: 2px solid yellow;">
	
	</div>
	
	1. ${band }<br>
	2. ${band.info }<br><br>
	
	3-1. ${band.info.resumesNo }<br>
	3-2. ${band.info.publicResumes }<br>
	3-3. ${band.info.resumesTitle }<br>
	3-4. ${band.info.bandNo }<br>
	3-5. ${band.info.bandInfo }<br>
	3-6. ${band.info.musicNo }<br>
	
	<h3>밴드맴버</h3>
	
	<c:forEach items="${band.member }" var="bm">
		${bm.bandMemName } : ${bm.mPosition }<br>
	</c:forEach>
</div>