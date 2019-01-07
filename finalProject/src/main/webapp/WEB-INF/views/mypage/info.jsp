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
		float:right;
	}
	
	.selectMenu {
		color: gold;
	}
	
</style>

<c:if test="${loginInfo.roleId eq 0 }">
	<div class="adminMenu">
		<p class="selectMenu" onclick=" location.href='/mypage/info' ">Mypage</p>
		<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/userAdmin' ">회원 관리</p>
		<p onclick="location.href='/mypage/boardAdmin' ">게시글 관리</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">관리자 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
			<p class="adminDetailInfo">이메일 : ${member.email }</p>
			<p class="adminDetailInfo">연락처 : ${member.contact }</p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p class="selectMenu" onclick=" location.href='/mypage/info' ">Mypage</p>
		<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/intro' ">바 소개</p>
		<p onclick="location.href='/mypage/applicationToBand' ">지원 현황</p>
		<p onclick="location.href='/mypage/calendar' ">일정표</p>
	</div><br><br>
	<hr>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Bar 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
			<p class="adminDetailInfo">이메일 : ${member.email }</p>
			<p class="adminDetailInfo">연락처 : ${member.contact }</p>
			<p class="adminDetailInfo">바 : ${bar.barName }</p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p class="selectMenu" onclick=" location.href='/mypage/info' ">Mypage</p>
		<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/intro' ">밴드 소개</p>
		<p onclick="location.href='/mypage/applicationToBar' ">지원 현황</p>
		<p onclick="location.href='/mypage/recommand' ">추천 Bar</p>
		<p onclick="location.href='/mypage/calendar' ">일정표</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Band 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
			<p class="adminDetailInfo">이메일 : ${member.email }</p>
			<p class="adminDetailInfo">연락처 : ${member.contact }</p><br>
			<p class="adminDetailInfo">밴드 : ${band.bandName }</p>
			<p class="adminDetailInfo">멤버</p>
			
			<ul>
				<c:forEach items="${bandMemberList }" var="i">
				<li>${i.bandMemName } - ${i.mPosition }</li>
				</c:forEach>
			</ul>
			
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
	</div>
</c:if>