<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	.adminMenu p{
		float:left;
		cursor:pointer;
		padding:10px;
	}
	
	.adminMenu p:hover{
		color: gold;
		cursor:pointer;
	}
	
	.adminMypageMain {
		border: 2px solid #fff;
		height: 600px;
		margin:10px;
	}
	
	.adminMypageMainInfo {
		margin: 10px;
		width:340px;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminDetailInfo {
		font-size:20px;
		float:left;
	}
	
	.adminMypageMainImage {
		border: 1px solid #fff;
		margin: 10px;
		width: 295px;
		height: 575px;
		float:left;
	}
</style>

<c:if test="${loginInfo.roleId eq 0 }">
	<div class="adminMenu">
		<p onclick=" location.href='/board/list' ">Mypage</p>
		<p onclick="location.href='/board/list' ">회원 정보수정</p>
		<p onclick="location.href='/board/list' ">회원 관리</p>
		<p onclick="location.href='/board/list' ">게시글 관리</p>
	</div><br><br>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">관리자 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">아이디 : </p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick=" location.href='/board/list' ">Mypage</p>
		<p onclick="location.href='/board/list' ">회원 정보수정</p>
		<p onclick="location.href='/board/list' ">지원 현황</p>
		<p onclick="location.href='/board/list' ">일정표</p>
	</div><br><br>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Bar 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">아이디 : </p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick=" location.href='/board/list' ">Mypage</p>
		<p onclick="location.href='/board/list' ">회원 정보수정</p>
		<p onclick="location.href='/board/list' ">밴드 소개</p>
		<p onclick="location.href='/board/list' ">지원 현황</p>
		<p onclick="location.href='/board/list' ">추천 Bar</p>
		<p onclick="location.href='/board/list' ">일정표</p>
	</div><br><br>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Band 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">아이디 : </p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>