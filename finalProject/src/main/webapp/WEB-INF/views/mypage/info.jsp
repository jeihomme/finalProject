<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ajax 모음 jsp -->
<jsp:include page="ajax.jsp" />

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
/* 		border: 2px solid #fff; */
		height: 600px;
		width:700px;
		margin: 0 auto;
	}
	
	.adminMypageMainInfo {
		margin: 10px;
		width:300px;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminDetailInfo {
		font-size:20px;
		color:gold;
/* 		float:left; */
	}
	
	.adminDetailInfo2 {
		font-size:15px;
 		float:right;
	}
	
	.adminMypageMainImage {
/* 		border: 1px solid #fff; */
		margin: 10px;
		width: 335px;
		height: 575px;
		float:right;
	}
	
	.myPageMainImage {
		width: 335px;
		height: 575px;
	}
	
	.selectMenu {
		color: gold;
	}
	
</style>

<c:if test="${loginInfo.roleId eq 0 }">
	<div class="adminMenu">
		<p id="mypageInfo" class="selectMenu" onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageUserAdmin() ">Users</p>
		<p onclick="viewMypageBoardAdmin() ">Boards</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Mypage </p>
			<hr>
			<b class="adminDetailInfo">계정</b> <b class="adminDetailInfo2">${member.userId }</b><br>
			<b class="adminDetailInfo">이름</b> <b class="adminDetailInfo2">${member.userName }</b><br>
			<b class="adminDetailInfo">이메일</b> <b class="adminDetailInfo2">${member.email }</b><br>
			<b class="adminDetailInfo">연락처</b> <b class="adminDetailInfo2">${member.contact }</b><br>
		</div>
		<div class="adminMypageMainImage">
			<img src="../resources/adminMainImage.png" class="myPageMainImage">
		</div>
		
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p class="selectMenu" onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBand() ">Application</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Mypage </p>
			<hr>
			<b class="adminDetailInfo">계정</b> <b class="adminDetailInfo2">${member.userId }</b><br>
			<b class="adminDetailInfo">이름</b> <b class="adminDetailInfo2">${member.userName }</b><br>
			<b class="adminDetailInfo">이메일</b> <b class="adminDetailInfo2">${member.email }</b><br>
			<b class="adminDetailInfo">연락처</b> <b class="adminDetailInfo2">${member.contact }</b><br>
			<b class="adminDetailInfo">바</b> <b class="adminDetailInfo2">${bar.barName }</b><br>
		</div>
		<div class="adminMypageMainImage">
			<img src="../resources/barMainImage.jpg" class="myPageMainImage">
		</div>
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p id="mypageInfo" class="selectMenu" onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Mypage </p>
			<hr>
			<b class="adminDetailInfo">계정</b> <b class="adminDetailInfo2">${member.userId }</b><br>
			<b class="adminDetailInfo">이름</b> <b class="adminDetailInfo2">${member.userName }</b><br>
			<b class="adminDetailInfo">이메일</b> <b class="adminDetailInfo2">${member.email }</b><br>
			
			<b class="adminDetailInfo">연락처</b> <b class="adminDetailInfo2">${member.contact }</b><br><br>
			<b class="adminDetailInfo">밴드</b> <b class="adminDetailInfo2">${band.bandName }</b><br>
			<b class="adminDetailInfo">멤버</b><br>
			
			<ul class="adminDetailInfo2">
				<c:forEach items="${bandMemberList }" var="i">
				<li>${i.bandMemName } - ${i.mPosition }</li>
				</c:forEach>
			</ul>
			
		</div>
		<div class="adminMypageMainImage">
			<img src="../resources/BandMainImage.gif" class="myPageMainImage">
		</div>
	</div>
</c:if>