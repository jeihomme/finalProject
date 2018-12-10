<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	.adminMenu p{
		float:left;
		cursor:pointer;
		padding:10px;
		margin: 0 auto;
	}
	
	.adminMenu p:hover{
		color: gold;
		cursor:pointer;
	}
	
	.adminMypageMain {
		border: 2px solid #fff;
		height: 600px;
		width:700px;
		margin: 0 auto;
	}
	
	.adminMypageMainInfo {
		margin: 10px;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminDetailInfo {
		font-size:20px;
/* 		float:left; */
	}
	
	.adminMypageMainImage {
		border: 1px solid #fff;
		margin: 10px;
		width: 335px;
		height: 575px;
		float:left;
	}
	
	.selectMenu {
		color: gold;
	}
	
</style>

<div class="adminMenu">
	<p onclick=" location.href='/mypage/info' ">Mypage</p>
	<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
	<p onclick="location.href='/mypage/userAdmin' ">회원 관리</p>
	<p class="selectMenu" onclick="location.href='/mypage/boardAdmin' ">게시글 관리</p>
</div><br><br>

<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">관리자 마이페이지 메인 </p>
		<hr>
		<p class="adminDetailInfo">계정 : ${loginInfo.userId }</p>
		<p class="adminDetailInfo">이름 : ${loginInfo.userName }</p>
	</div>
	<div class="adminMypageMainImage">
		<p >이미지 넣어주세요 </p>
	</div>
	
</div>

