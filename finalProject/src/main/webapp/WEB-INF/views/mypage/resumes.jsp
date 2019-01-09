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
	
	.adminMypageMainInfo {
/* 		border: 1px solid #fff; */
		margin: 10px;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminDetailInfo {
		width:144px;
		font-size:13px;
		float:right;
	}
	
	.adminDetailMust {
		font-size:8px;
		color:gold;
		float:left;
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
	
	.resumesBtn {
		margin: 0 auto;
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
	
	.resumesViewDiv {
		text-align:center;
	}
	/* tr th:not(:nth-child(2)) { */
	.bandIntroHeader {
		font-size:20px;
	}
	
	.bandIntroInsert {
		color: black;
		background-color:gold;
		float:center;
	}
	
	.bandModifyBtn {
		float:right;
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
</style>

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
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">기본정보 </p>
		
		<div class="adminMypageMainInfo">
			<input type="file" name="profileNo"/>
		</div>
		<div class="adminMypageMainInfo">
			<b class="adminDetailInfo">밴드명</b><p class="adminDetailMust">(필수) </p><br>
			${band.bandName }<br><br>
<!-- 			<input type="text" name="bandName"/><br> -->
			<b class="adminDetailInfo">연락처 </b><p class="adminDetailMust">(필수) </p><br>
			${member.contact }<br>
<!-- 			<input type="text" name="contact"/><br> -->
		</div>
		<div class="adminMypageMainInfo">
			<b class="adminDetailInfo">이메일 </b><p class="adminDetailMust">(필수) </p><br>
<!-- 			<input type="text" name="email"/><br> -->
			${member.email }<br><br>
			<b class="adminDetailInfo">장르 </b><p class="adminDetailMust">(필수) </p><br>
			${genre.genreName }<br>
		</div>
		
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
	<div>
		<b class="bandIntroHeader">밴드소개 제목</b>
		<table class="table table-hover table-striped table-condensed">
			
			<tr>
				<th>제목</th>
			</tr>
		
			<tr>
				<td>${resumes.resumesTitle }</td>
			</tr>
			
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
	<div>
		<b class="bandIntroHeader">첨부파일</b>
		<table class="table table-hover table-striped table-condensed">
			<tr>
				<th>파일명</th>
				<th>등록/수정일</th>
			</tr>
			<tr>
				<td>${music.musicTitle }</td>
				<td>
				${music.writtenDate }
				</td>
			</tr>
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
	<div>
		<b class="bandIntroHeader">History</b>
		<table class="table table-hover table-striped table-condensed">
			
			<tr>
				<th>이력</th>
			</tr>
		
			<c:forEach items="${historyList }" var="i">
	<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
					<tr>
						<td>${i.year }년, ${i.historyInfo }</td>
					</tr>
			</c:forEach>
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
		<p class="adminDetailTitle">밴드 소개 </p>
		<table class="table table-hover table-striped table-condensed fixedTableSize">
			<tr class="fixedTableSize">
				<th class="fixedTableSize">소개</th>
			</tr>
			<tr class="fixedTableSize">
				<td class="fixedTableSize">${resumes.bandInfo }</td>
			</tr>
		</table>
</div>

<hr>
<div class="resumesViewDiv">
	<button class="resumesBtn" onclick="viewMypageIntro() ">뒤로가기</button>
	<input type="hidden" id="resumesNo" value="${resumes.resumesNo }"/>
	<button class="resumesBtn" onclick="viewModifyResumes() ">수정</button>
</div>
