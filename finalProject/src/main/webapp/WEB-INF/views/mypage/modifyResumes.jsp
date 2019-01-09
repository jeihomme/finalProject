<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
	
	.searchBtn {
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
	
	.insertResumesInfo {
		color:#000;
		width:600px;
	}
	
	.insertResumesHistory {
		color:#000;
		width:300px;
	}
	
	.insertResumesBandInfo {
		resize: none; /* 사용자 임의 변경 불가 */
		color:#000;
		height:300px;
		width:100%;
		
/* 		스크롤 */
		overflow-x:hidden;
		overflow-y:auto;
	}
	
	.modifyBtn {
		color:#000;
	}
</style>

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

<div class="adminMenu">
	<p onclick=" location.href='/mypage/info' ">Mypage</p>
	<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
	<p class="selectMenu" onclick="location.href='/mypage/intro' ">밴드 소개</p>
	<p onclick="location.href='/mypage/applicationToBar' ">지원 현황</p>
	<p onclick="location.href='/mypage/recommand' ">추천 Bar</p>
	<p onclick="location.href='/mypage/calendar' ">일정표</p>
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
			<b class="adminDetailInfo">장르 </b><p class="adminDetailMust">(필수) </p>
			${bandGenre.genreTitle }<br>
			
			<form action="/mypage/modifyResumesProc" method="post">
				<select class="modifyBtn" name="genreNo" >
					<c:if test="${genre.genreNo eq 0}">
						<option value="0">선택</option>
					</c:if>
					
					<c:if test="${genre.genreNo ne 0}">
						<option value="${genre.genreNo }" selected="selected">${genre.genreName }</option>
					</c:if>
					
					<option value="1">비밥</option><option value="2">스윙</option>
					<option value="3">펑크</option><option value="4">모던</option>
					<option value="5">보사노바</option><option value="6">부기우기</option>
					
				</select>
					<input type="hidden" name="resumesNo" value="${resumes.resumesNo }"/>
					<button class="searchBtn">선택</button>
			</form>
		</div>
		
	</div>
</div>

<form class="modifyInfoDone" action="/mypage/addHistorylist" method="post">
	<input type="hidden" name="resumesNo" value="${resumes.resumesNo }"/>
	<button type="button" id="historyAdd" class="modifyBtn">+</button>
</form>

<c:if test="${history.historyNo > 0}">
	<form class="modifyInfoDone" action="/mypage/minHistorylist" method="post">
		<input type="hidden" name="resumesNo" value="${resumes.resumesNo }"/>
		<button type="button" id="historyDel" class="modifyBtn">-</button>
	</form>
</c:if>


<script type="text/javascript">
// $("input[name='list[${fn:length(historyList) }].historyNo']").val();

$(document).ready(function() {
	
	$("#historyAdd").click(function() {
		$('#table > tbody:last').append(
			"<tr>"+
				"<td>"+
// 					" <input type='hidden' class='insertResumesHistory' name='list[${fn:length(historyList) }].historyNo' value='"+ j +"'/>"+
					" <input type='hidden' class='insertResumesHistory' name='list[${fn:length(historyList) }].resumesNo' value='${resumes.resumesNo }'/>"+
					" <input type='month' class='insertResumesHistory' name='list[${fn:length(historyList) }].year' value='${i.year }'/>년, "+
					" <input type='text' class='insertResumesHistory' name='list[${fn:length(historyList) }].historyInfo' value='${i.historyInfo }'/>"+
				"</td>"+
			"</tr>"
		);
	});
	
	
// 	$(function(){ 
// 		  $('.bt_up').click(function(){ 
// 		    var n = $('.bt_up').index(this);
// 		    var num = $(".num:eq("+n+")").val();
// 		    num = $(".num:eq("+n+")").val(num*1+1); 
// 		  });
// 		  $('.bt_down').click(function(){ 
// 		    var n = $('.bt_down').index(this);
// 		    var num = $(".num:eq("+n+")").val();
// 		    num = $(".num:eq("+n+")").val(num*1-1); 
// 		  });
// 		});
});
</script>

<form action="/mypage/modifyResumesProc" method="post">
	<input type="hidden" name="genreNo"/>
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<p class="bandIntroHeader">History</p>
			<table id="table" class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>이력</th>
				</tr>
				<tbody>
					<c:forEach items="${historyList }" var="i" varStatus="status">
							<tr>
								<td>
<%-- 									<input type="hidden" class="insertResumesHistory" name="list[${status.count-1 }].historyNo" value="${i.historyNo }"/> --%>
									<input type="hidden" class="insertResumesHistory" name="list[${status.count-1 }].resumesNo" value="${resumes.resumesNo }"/>
									<input type="month" class="insertResumesHistory" name="list[${status.count-1 }].year" value="${i.year }"/>년, 
									<input type="text" class="insertResumesHistory" name="list[${status.count-1 }].historyInfo" value="${i.historyInfo }"/>
								</td>
							</tr>
							
					</c:forEach>
				</tbody>
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
				</tr>
				<tr>
					<td>
					<select class="insertResumesInfo" name="musicNo">
						<c:forEach items="${musicList }" var="i">
							<c:if test="${resumes.musicNo eq i.musicNo }">
								<option value=${i.musicNo } selected="selected">${i.musicTitle }</option>
							</c:if>
							<c:if test="${resumes.musicNo ne i.musicNo }">
								<option value=${i.musicNo } >${i.musicTitle }</option>
							</c:if>
						</c:forEach>
					</select>
					</td>
				</tr>
			</table>
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
					<td><input id="resumesTitle" type="text" class="insertResumesInfo" name="resumesTitle" value="${resumes.resumesTitle }"/></td>
				</tr>
				
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div >
			<p class="adminDetailTitle">밴드 소개 </p>
			<table class="table table-hover table-striped table-condensed">
				<tr>
					<th>소개</th>
				</tr>
				<tr>
					<td>
					<textArea class="insertResumesBandInfo" name="bandInfo" >${resumes.bandInfo }</textArea>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="resumesViewDiv">
		<hr>
<%-- 		<c:if test="${bandInfo eq null}"> --%>
			<button class="searchBtn" onclick="location.href='/mypage/intro' ">취소</button>
			<input type="hidden" name="resumesNo" value="${resumes.resumesNo }"/>
			<input type="hidden" name="bandNo" value="${resumes.bandNo }"/>
			<input type="hidden" name="musicNo" value="${resumes.musicNo }"/>
				<button class="searchBtn">완료</button>
			
			
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${bandInfo ne null}"> --%>
<!-- 			<button class="searchBtn" onclick="location.href='/mypage/intro' ">뒤로가기</button> -->
<!-- 			<button class="searchBtn" onclick="location.href='/mypage/modifyResumes' ">수정</button> -->
<%-- 		</c:if> --%>
	</div>
</form>