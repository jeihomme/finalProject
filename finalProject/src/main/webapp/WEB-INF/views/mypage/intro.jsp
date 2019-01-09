<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	.bandIntroInfo {
		margin: 10px;
		width:300;
		float:left;
	}
	
	.barIntroInfo {
		margin: 10px;
		width:300;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminMypageMainImage {
		border: 1px solid #fff;
		margin: 10px;
		width: 290px;
		height: 280px;
		float:right;
	}
	
	.selectMenu {
		color: gold;
	}
	
	.searchBtn {
		color: black;
		float:right;
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
	
	.introDetailInfo {
/*  		width:144px; */
		font-size:13px;
/* 		float:left; */
	}
	
	.adminDetailMust {
		font-size:8px;
		color:gold;
		float:left;
	}
	
	.resumesBtn {
		margin: 0 auto;
		color: black;
	}
	
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
	
	.resumesViewDiv {
		text-align:center;
	}
	
	.profilePicSize {
		width: 220px;
		height: 200px;
	}
	
	.mousePointer {
		cursor:pointer;
	}
	
	.mousePointer:hover{
		color: gold;
		cursor:pointer;
	}
</style>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p class="selectMenu" onclick="viewMypageIntro() ">바 소개</p>
		<p onclick="viewMypageAppToBand() ">지원 현황</p>
		<p onclick="viewMypageCalendar() ">일정표</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class=bandIntroInfo>
			<p class="adminDetailTitle">기본정보 </p>
			
			<div class="bandIntroInfo">
				<img class="profilePicSize" src="http://${pPic.path }/${pPic.originName }">
<!-- 				<input type="file" name="profileNo"/> -->
			</div>
			<div class="bandIntroInfo">
				<b class="introDetailInfo">바명</b><p class="adminDetailMust">(필수) </p><br>
				${bar.barName }<br><br>
	<!-- 			<input type="text" name="bandName"/><br> -->
				<b class="introDetailInfo">담당자 </b><p class="adminDetailMust">(필수) </p><br>
				${bar.manager }<br><br>
				<b class="introDetailInfo">연락처 </b><p class="adminDetailMust">(필수) </p><br>
				${member.contact }<br><br>
	<!-- 			<input type="text" name="contact"/><br> -->
			</div>
			<div class="bandIntroInfo">
				<b class="introDetailInfo">이메일 </b><p class="adminDetailMust">(필수) </p><br>
	<!-- 			<input type="text" name="email"/><br> -->
				${member.email }<br><br>
				<b class="introDetailInfo">장르 </b><p class="adminDetailMust">(필수) </p><br>
				${genre.genreName }<br><br>
	<!-- 			<input type="text" name="genreNo"/><br> -->
	<!-- 			<select name="genre"> -->
	<!-- 				<option value=""></option> -->
	<!-- 				<option value="비밥"></option><option value="스윙"></option> -->
	<!-- 				<option value="펑크"></option><option value="모던"></option> -->
	<!-- 				<option value="보사노바"></option><option value="부기우기"></option> -->
	<!-- 			</select> -->
			</div>
			
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<b class="bandIntroHeader">주소</b>
			<table class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>지역</th>
					<th>상세주소</th>
				</tr>
				<tr>
					<td>${location.locationName }</td>
					<td>${bar.barAddress }</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div >
			<p class="adminDetailTitle">바 소개 </p>
			<table class="table table-hover table-striped table-condensed">
				<tr>
					<th>소개</th>
				</tr>
				<tr>
					<td>${bar.barInfo }</td>
				</tr>
			</table>
		</div>
	</div>
	
	<hr>
	<div class="resumesViewDiv">
<!-- 		<form action="/mypage/modifyIntro" method="get"> -->
			<button class="resumesBtn" onclick="modifyIntro()">수정</button>
<!-- 		</form> -->
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p class="selectMenu" onclick="viewMypageIntro() ">밴드 소개</p>
		<p onclick="viewMypageAppToBar() ">지원 현황</p>
		<p onclick="viewMypageRecommand() ">추천 Bar</p>
		<p onclick="viewMypageCalendar() ">일정표</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="barIntroInfo">
			<p class="adminDetailTitle">밴드 소개 </p>
			<hr>
			<ul class="introDetailInfo">
				<li>이력서는 최대 5개까지 작성 가능합니다.</li>
				<li>지원하고자 하는 Bar마다 내용을 다르게 할 수 있습니다.</li>
			</ul>
		</div>
		
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
	</div>
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
						"publicResumes" : publicResumes
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
		<hr>
		<div>
			<p class="bandIntroHeader">밴드소개 리스트</p>
			<button class="bandIntroInsert" onclick="viewModifyResumes() ">소개 등록</button>
			<table class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>공개</th>
					<th>밴드소개 제목</th>
					<th>첨부파일번호</th>
				</tr>
				<c:forEach items="${resumesList }" var="i" varStatus="status">
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
							<b class="mousePointer" onclick="viewResumes${status.count }()"> ${i.resumesTitle } </b>
								<input type="hidden" id="statusCount" value="${status.count }">${status.count }
								
<!-- 							<form class="bandModifyBtn" action="/mypage/deleteResumes" method="post"> -->
								<input type="hidden" name="resumesNo[]" value="${i.resumesNo }">
								<button class="searchBtn">삭제</button>
<!-- 							</form> -->
<!-- 							<form class="bandModifyBtn" action="/mypage/modifyResumes" method="get"> -->
								<input type="hidden" name="resumesNo" value="${i.resumesNo }">
								<button class="searchBtn">수정</button>
<!-- 							</form> -->
							<button id="commitPublicResumes" class="searchBtn">대표 이력서 설정</button>
						</td>
						<td>${i.musicNo }</td>
					</tr>
					
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<form action="/mypage/uploadSoundIntro" method="post" enctype="multipart/form-data">
				<b class="bandIntroHeader">첨부파일 리스트</b>
				<input type="hidden" name="bandNo" value="${band.bandNo }">
				<input class="bandIntroInsert" type="file" id="file" name="file"/><br>
				<button class="bandIntroInsert">파일 첨부</button>
			</form>
			<table class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>파일번호</th>
					<th>파일명</th>
					<th>등록/수정일</th>
				</tr>
			
				<c:forEach items="${musicList }" var="i">
		<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
						<tr>
			<!-- 			<tr id="memberView"> -->
			<%-- 				<td><input type="hidden" id="board_no${i.board_no }" name="board_no${i.board_no }" value="${i.board_no }">${i.board_no }</td> --%>
			<%-- 				<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td> --%>
							<td>${i.musicNo }</td>
							<td><a href="">${i.musicTitle }</a>
								<form class="bandModifyBtn" action="/mypage/deleteSound" method="post">
									<input type="hidden" name="musicNo" value="${i.musicNo }">
									<input type="hidden" name="bandNo" value="${i.musicNo }">
									<button class="searchBtn">삭제</button>
								</form>
							</td>
							<td>${i.writtenDate }</td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</c:if>