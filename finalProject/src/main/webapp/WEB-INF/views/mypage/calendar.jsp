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
		width:700px;
		height: 300px;
		margin: 10px auto;
	}
	
	.adminMypageSearchDiv {
		border: 2px solid #fff;
		width:700px;
		height: 50px;
		margin: 10px auto;
		
		font-size:18px;
		text-align:center;
	}
	
	.adminMypageSearchRes {
		border: 2px solid #fff;
		width:700px;
		height: auto;
		margin: 10px auto;
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
		font-size:13px;
	}
	
	.adminMypageMainImage {
		border: 1px solid #fff;
		margin: 10px;
		width: 335px;
		height: 280px;
		float:right;
	}
	
	.selectMenu {
		color: gold;
	}
	
	.searchBtn {
		color: black;
	}
	
	.searchUserinfo {
/* 	 	float:right;  */
/* 		text-align:right; */
		margin:0px 5px 3px 5px;
/* 		padding:0 100px 3px 10px; */
		box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-moz-border-radius: 3px;
		-khtml-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 3px;
	/* 	background-color:#5c5c5c; */
	}
	
	/* tr th:not(:nth-child(2)) { */
	tr th {
		text-align: center;
		color:#000;
		background-color: gold;
	}
	td {
		border-left: 1px solid white;
		border-right: 1px solid white;
		color:#fff;
		background-color: black;
	}
</style>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p onclick="viewMypageIntro() ">바 소개</p>
		<p onclick="viewMypageAppToBand() ">지원 현황</p>
		<p class="selectMenu" onclick="viewMypageCalendar() ">일정표</p>
	</div><br><br>
	<hr>
	
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Bar 일정표 </p>
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
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<b class="bandIntroHeader">일정표</b>
			<table class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>이번 달</th>
					<th>다음 달</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p onclick="viewMypageIntro() ">밴드 소개</p>
		<p onclick="viewMypageAppToBar() ">지원 현황</p>
		<p onclick="viewMypageRecommand() ">추천 Bar</p>
		<p class="selectMenu" onclick="viewMypageCalendar() ">일정표</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Bar 일정표 </p>
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
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<b class="bandIntroHeader">일정표</b>
			<table class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>이번 달</th>
					<th>다음 달</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</c:if>