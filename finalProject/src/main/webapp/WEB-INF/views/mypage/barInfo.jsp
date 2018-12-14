<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
.barInfoMypageImage {
	border: 1px solid #fff;
	margin: 10px;
	width: 335px;
	height: 300px;
	float: left;
}

.barInfoMypagePosition {
	float: left;
	text-align: center;
}

.barCenter {
	border: 1px solid #fff;
	width: 800px;
	height: 400px;
	background: #A4A4A4;
}

.adminMenu p {
	float: left;
	cursor: pointer;
	padding: 10px;
	margin: 0 auto;
}

.selectMenu {
	color: gold;
}

</style>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p class="selectMenu" onclick=" location.href='/mypage/info' ">Mypage</p>
		<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/barInfo' ">바 소개</p>
		<p onclick="location.href='/board/list' ">지원 현황</p>
		<p onclick="location.href='/board/list' ">일정표</p>
	</div><br><br>
</c:if>
	
<div class="barCenter">
	<div class="barInfoMypageImage">
		<p>이미지 넣어주세요</p>
	</div>

	<div><br>
	<b>Information</b> 
	<input type="text" name="barinfo" style="color:black">${barno.barinfo }<br><br><br>
	<b>담당자</b>
	<input type="text" name="barinfo" style="color:black"><br><br><br>
	<b>연락처</b>
	<input type="text" name="barinfo" style="color:black"><br><br><br>
	</div>
</div><br>

<div class="barCenter">
	<div class="barInfoMypageImage">
		<p>지도</p>
	</div>

	<div><br>
	<b>Location</b>  
	<input type="text" name="barinfo" style="color:black" 
			placeholder="내용을 입력해 주세요" ><br><br><br>

	</div>
</div>
