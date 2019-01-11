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
/* 		border: 2px solid #fff; */
		width:700px;
		height: 300px;
		margin: 10px auto;
	}
	
	.adminMypageSearchDiv {
/* 		border: 2px solid #fff; */
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
/* 		border: 1px solid #fff; */
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
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
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
	
	.addHistoryList {
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
		float:right;
	}
/* tr th:not(:nth-child(2)) { */
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
	
	.bandProfileImage {
		cursor:pointer;	
	}
	
	.profilePicSize {
		width: 220px;
		height: 200px;
	}
</style>

<div class="adminMenu">
	<p onclick="viewMypageInfo() ">Mypage</p>
	<p onclick="viewMypageModifyInfo() ">Modify</p>
	<p class="selectMenu" onclick="viewMypageIntro() ">Intro</p>
	<p onclick="viewMypageAppToBar() ">Application</p>
	<p onclick="viewMypageRecommand() ">Recommand Bar</p>
	<p onclick="viewMypageCalendar() ">Calendar</p>
</div><br><br>

<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">Intro </p>
		
		<div class="adminMypageMainInfo">
			<img src="../resources/${pPic.originName }" id="profileImage" class="profilePicSize img-rounded" />
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
			
				<select class="modifyBtn" id="genreNo" >
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
		</div>
		
	</div>
</div>
	
	<div class="adminMypageSearchRes">
		
		<div>
			<b class="bandIntroHeader">밴드소개 제목</b>
			<table class="type10">
				<thead>
				<tr>
					<th>제목</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><input id="resumesTitle" type="text" class="insertResumesInfo" id="resumesTitle" value="${resumes.resumesTitle }"/></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		
		<div>
			<b class="bandIntroHeader">첨부파일</b>
			
			<table class="type10">
				<thead>
				<tr>
					<th>파일명</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
					<select class="insertResumesInfo" id="musicNo">
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
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		
		<div>
			<b class="bandIntroHeader">History</b>
			<c:if test="${hList < 5}">
				<button class="addHistoryList" onclick="addHistorylist() ">+</button>
			</c:if>
			<table class="type10">
				<thead>
				<tr>
					<th>이력</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${historyList }" var="i" varStatus="status">
						<tr>
						<c:if test="${status.count %2 eq 1}">
							<td >
								<input type="hidden" id="rnum" value="${status.count }"/>
								<input type="hidden" class="insertResumesHistory" name="historyNo[]" value="${i.historyNo }"/>
								<input type="month" class="insertResumesHistory" name="year[]" value="${i.year }"/>년, 
								<input type="text" class="insertResumesHistory" name="historyInfo[]" value="${i.historyInfo }"/>
								<button class="addHistoryList" onclick="minHistorylist(${i.historyNo }) ">-</button>
							</td>
						</c:if>
						<c:if test="${status.count %2 eq 0}">
							<td class="even">
								<input type="hidden" id="rnum" value="${status.count }"/>
								<input type="hidden" class="insertResumesHistory" name="historyNo[]" value="${i.historyNo }"/>
								<input type="month" class="insertResumesHistory" name="year[]" value="${i.year }"/>년, 
								<input type="text" class="insertResumesHistory" name="historyInfo[]" value="${i.historyInfo }"/>
								<button class="addHistoryList" onclick="minHistorylist(${i.historyNo }) ">-</button>
							</td>
						</c:if>
							
						</tr>
							
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		
			<p class="adminDetailTitle">밴드 소개 </p>
			<table class="type10">
				<tr>
					<th>소개</th>
				</tr>
				<tr>
					<td>
						<textArea class="insertResumesBandInfo" id="bandInfo" >${resumes.bandInfo }</textArea>
					</td>
				</tr>
			</table>
	</div>
	
	<div class="resumesViewDiv">
		
			<button class="searchBtn" onclick="viewResumes() ">취소</button>
			<input type="hidden" id="resumesNo" value="${resumes.resumesNo }"/>
			<input type="hidden" id="bandNo" value="${resumes.bandNo }"/>
			<input type="hidden" id="musicNo" value="${resumes.musicNo }"/>
			<button class="searchBtn" onclick="modifyResumesProc() ">완료</button>
	</div>
	