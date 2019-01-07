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
	width: 250px;
	height: 250px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var general = "${general}";
	console.log(general);
});

</script>

<c:set var="proPic" value="${general.proPic }" />
<c:set var="band" value="${general.band }" />
<c:set var="resumes" value="${general.resumes }" />
<c:set var="music" value="${general.music }" />

<div style="background-color:gray; border-radius:20px;">

	<!-- 밴드 사진 -->
	<div style="border: 2px solid yellow;">
		<img class="img-rounded" src="http://${proPic.path }/${proPic.originName}" />
	</div>
	
	<!-- 밴드 맴버 -->
	<div style="border: 2px solid red;">0
		<table>
			
		</table>
	</div>
	
	<!-- 밴드 History -->
	<div style="border: 2px solid blue;">
		<table>
		
		</table>
	</div>
	
	<!-- 밴드 소개 -->
	<div style="border: 2px solid green;">
		band basic Info<br>
		bandName: ${band.bandName }<br>
		bandInfo ${resumes.bandInfo }<br><br>
	</div>
	
	<div style="border: 2px solid white;">
		resumes Info<br>
		resumesNo: ${resumes.resumesNo }<br>
		publicResumes ${resumes.publicResumes }<br>
		Title ${resumes.resumesTitle }<br>
	</div>
	
	<div style="border: 2px solid cyan;">
	
	
		music Info<br>
		musicNo: ${music.musicNo }<br>
		musicTitle: ${music.musicTitle }<br>
		Path: ${music.path }<br>
	</div>
</div>