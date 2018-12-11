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
	
	.modifyInfoDone b{
		color:#fff;
	}
	
	.modifyInfoDone input{
		color:#000;
	}
	
	.modifyBtn {
		color:#000;
	}

	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: #000; /* Fallback color */
	    background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	    background-color: #000;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #fff;
	    width: 80%;
	}
	
	/* The Close Button */
	.close {
	    color: #ffffff;
	    float: right;
	    font-size: 28px;
	    cursor:pointer;
	}
	
	.close:hover,
	.close:focus {
	    color: #fff;
	    text-decoration: none;
	    cursor: pointer;
	}
</style>

<script type="text/javascript">
$(document).ready(function() {
	//	모달
	$("#modifyPwBtn").click(function() {
	  $("#myModal").css({
	    "display": "block"
	  });
	});
	
	$(".close").click(function() {
	  $("#myModal").css({
	    "display": "none"
	  });
	});
	
	$("html").click(function(event) {
	  if (event.target.id === "myModal") {
	    $("#myModal").css({
	      "display": "none"
	    });
	  }
	});
});
</script>
<c:if test="${loginInfo.roleId eq 0 }">
	<div class="adminMenu">
		<p onclick=" location.href='/mypage/info' ">Mypage</p>
		<p class="selectMenu" onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
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
				<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button><br>
				
										<form class="modifyInfoDone" action="/mypage/modifyPw" method="post">
											<!-- The Modal -->
											<div id="myModal" class="modal">
											  <!-- Modal content -->
											  <div id="modal-content" class="modal-content">
											    <p class="close">X</p>
											    <h2>비밀번호 변경</h2>
											    
												<b class="adminDetailInfo">현재 PW : </b><input type="password" class="inputIDPW" name="password" ><br>
												<b class="adminDetailInfo">새 PW : </b><input type="password" class="inputIDPW" name="newPassword" ><br>
												<b class="adminDetailInfo">새 PW 확인 : </b><input type="password" class="inputIDPW" name="newPassword" ><br>
												
												<button class="modifyBtn">수정</button><br>
												
											  </div>
											</div>
										</form>
			
			<form class="modifyInfoDone" action="/mypage/modifyInfo" method="post">
				<b class="adminDetailInfo">이메일 : </b><input name="email" value="${member.email }"/><br>
				<b class="adminDetailInfo">통신사 : </b><input name="telcom" value="${member.telcom }"/><br>
				<b class="adminDetailInfo">연락처 : </b><input name="contact" value="${member.contact }"/><br>
				<button class="modifyBtn">수정</button>
			</form>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick=" location.href='/board/list' ">Mypage</p>
		<p class="selectMenu" onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/intro' ">바 소개</p>
		<p onclick="location.href='/board/list' ">지원 현황</p>
		<p onclick="location.href='/board/list' ">일정표</p>
	</div><br><br>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Bar 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick=" location.href='/board/list' ">Mypage</p>
		<p class="selectMenu" onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/intro' ">밴드 소개</p>
		<p onclick="location.href='/mypage/voluenteer' ">지원 현황</p>
		<p onclick="location.href='/mypage/recommand' ">추천 Bar</p>
		<p onclick="location.href='/mypage/calendar' ">일정표</p>
	</div><br><br>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Band 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
	</div>
</c:if>
