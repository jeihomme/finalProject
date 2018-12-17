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
/* 		border: 2px solid #fff; */
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
		width: 290px;
		height: 280px;
		float:left;
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
</style>

<div class="adminMenu">
	<p onclick=" location.href='/mypage/info' ">Mypage</p>
	<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
	<p class="selectMenu" onclick="location.href='/mypage/intro' ">밴드 소개</p>
	<p onclick="location.href='/mypage/volunteer' ">지원 현황</p>
	<p onclick="location.href='/mypage/recommand' ">추천 Bar</p>
	<p onclick="location.href='/mypage/calendar' ">일정표</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">밴드 소개 </p>
		<hr>
		<ul class="adminDetailInfo">
			<li >이력서는 최대 5개까지 작성 가능합니다.</li>
			<li>지원하고자 하는 Bar마다 내용을 다르게 할 수 있습니다.</li>
		</ul>
	</div>
	
	<div class="adminMypageMainImage">
		<p >이미지 넣어주세요 </p>
	</div>
</div>
<!-- <div class="adminMypageSearchDiv"> -->
<!-- 	<div class="searchUserinfo"> -->
<!-- 		<form action="/mypage/userAdmin" method="post"> -->
<!-- 			검색조건 <select class="searchBtn" name="searchCategory"> -->
<!-- 				<option class="searchBtn" value="">카테고리</option> -->
<!-- 			    <option class="searchBtn" value="userId">아이디</option> -->
<!-- 			    <option class="searchBtn" value="contact">연락처</option> -->
<!-- 			    <option class="searchBtn" value="userName">이름</option> -->
<!-- 			</select> -->
			
<!-- 			검색어 입력 <input class="searchBtn" type="text" name="searchKeyowrd" /> -->
<!-- 			<button class="searchBtn"> 검색 </button> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- </div> -->
<style type="text/css">
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
<style>
	.bandIntroHeader {
		font-size:20px;
	}
	
	.bandIntroInsert {
		color: black;
		background-color:gold;
		float:right;
	}
	
	.bandModifyBtn {
		float:right;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#commitPublicResumes").click( function() {
		
		publicResumes = $("checkbox[name='publicResumes']").val();
		
		$.ajax({
			type: "post"
			, url: "/mypage/commitPublicResumes"
				, data: {
					publicResumes : publicResumes
					}
			, dataType: "html"
			, success: function(res) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
});
</script> 
<div class="adminMypageSearchRes">
	<div>
		<b class="bandIntroHeader">밴드소개 리스트</b>
		<button class="bandIntroInsert" onclick="location.href='/mypage/createResumes' ">소개 등록</button>
		<table class="table table-hover table-striped table-condensed">
			
			<tr>
				<th>공개</th>
				<th>밴드소개 제목</th>
				<th>첨부파일</th>
			</tr>
			<c:forEach
			items="${resumesList }" var="i"
			>
				<tr>
					<td>
					<c:if test="${i.publicResumes eq 1}"> 
						<input type="checkbox" name="publicResumes" value="1" checked="checked">
					</c:if>
					<c:if test="${i.publicResumes eq 0}"> 
						<input type="checkbox" name="publicResumes" value="0">
					</c:if>
					</td>
					<td>
					<a href="/mypage/resumes?resumesNo=${i.resumesNo }">${i.resumesTitle }</a>
						
							
						<form class="bandModifyBtn" action="/mypage/deleteResumes" method="post">
							<input type="hidden" name="resumesNo" value="${i.resumesNo }">
							<button class="searchBtn">삭제</button>
						</form>
						<form class="bandModifyBtn" action="/mypage/deleteUser" method="post">
							<input type="hidden" name="userId" value="${i.resumesNo }">
							<button class="searchBtn">수정</button>
						</form>
						<button id="commitPublicResumes" class="searchBtn">대표 이력서 설정</button>
					</td>
					<td>${i.musicNo }</td>
				</tr>
				
			</c:forEach>
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<div>
		<form action="/mypage/deleteUser" method="post">
			<b class="bandIntroHeader">첨부파일 리스트</b>
			<button class="bandIntroInsert">파일 첨부</button>
		</form>
		<table class="table table-hover table-striped table-condensed">
			
			<tr>
				<th>파일명</th>
				<th>등록/수정일</th>
			</tr>
		
			<c:forEach items="${musicList }" var="i">
	<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
					<tr>
		<!-- 			<tr id="memberView"> -->
		<%-- 				<td><input type="hidden" id="board_no${i.board_no }" name="board_no${i.board_no }" value="${i.board_no }">${i.board_no }</td> --%>
		<%-- 				<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td> --%>
						<td><a href="">${i.musicTitle }</a>
							<form class="bandModifyBtn" action="/mypage/deleteSound" method="post">
								<input type="hidden" name="musicNo" value="${i.musicNo }">
								<button class="searchBtn">삭제</button>
							</form>
						</td>
						<td>${i.writtenDate }</td>
					</tr>
			</c:forEach>
		</table>
	</div>
</div>
