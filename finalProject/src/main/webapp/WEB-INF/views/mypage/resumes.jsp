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
/* 		border: 2px solid #fff; */
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
	
	.profilePicSize {
		width: 220px;
		height: 200px;
	}
	
	tr th {
	text-align: center;
	color:#000;
	background-color: gold;
	}
	
	td {
/* 		border-left: 1px solid white; */
/* 		border-right: 1px solid white; */
		color:#fff;
		background-color: black;
	}
	
</style>
<script type="text/javascript">

   var setTime = 0;      // 최초 설정 시간(기본 : 초)
   var song = new Audio('/resources/${music.musicTitle }');
</script>

<script type="text/javascript">

   function msg_time() {   // 1초씩 카운트
       
      m = Math.floor(setTime / 60) + "분 " + (setTime % 60) + "초";   // 남은 시간 계산
      
      var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
      
//       document.all.ViewTimer.innerHTML = msg;      // div 영역에 보여줌 
            
//       setTime--;               // 1초씩 감소
      
//       if (setTime < 0) {         // 시간이 종료 되었으면..
//          song.pause();
//          song.currentTime = 0;
//          clearInterval(tid);
//       }
   }
   
   function timerStart(){ 
      tid=setInterval('msg_time()',1000);
   }
   
</script>

<script type="text/javascript">
$(document).ready(function() {
   window.stop();
   $("#preSound").click( function() {
//       timerStart();
      song.play();
   });
   
   $("#stopSound").click( function() {
// 	      timerStart();
	      song.pause();
	   });
});
</script>

<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p class="selectMenu" onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
</c:if>
<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p class="selectMenu" onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
</c:if>

<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">기본정보 </p>
		
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
			<b class="adminDetailInfo">장르 </b><p class="adminDetailMust">(필수) </p><br>
			${genre.genreName }<br>
		</div>
		
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
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
				<td>${resumes.resumesTitle }</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
	<div>
		<b class="bandIntroHeader">첨부파일</b>
		<table class="type10">
			<thead>
			<tr>
				<th>파일명</th>
				<th>등록/수정일</th>
			</tr>
			</thead>
			<tbody>
			
			
			<tr>
				<td>
					
					${music.musicTitle }<br>
						<button id="preSound" class="searchBtn">재생</button><button id="stopSound" class="searchBtn">정지</button>
				</td>
				<td>
				${music.writtenDate }
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
	<div>
		<b class="bandIntroHeader">History</b>
		<table class="type10">
			<thead>
			<tr>
				<th>이력</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${historyList }" var="i" varStatus="status">
	<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
					<tr>
					<c:if test="${status.count %2 eq 1 }">
					<td>
						${i.year }년, ${i.historyInfo }
					</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">
						${i.year }년, ${i.historyInfo }
					</td>
					</c:if>
					</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="adminMypageSearchRes">
	<hr>
		<p class="adminDetailTitle">밴드 소개 </p>
		<table class="type10">
			<thead>
			<tr class="fixedTableSize">
				<th class="fixedTableSize">소개</th>
			</tr>
			</thead>
			<tbody>
			<tr class="fixedTableSize">
				<td class="fixedTableSize">${resumes.bandInfo }</td>
			</tr>
			</tbody>
		</table>
</div>

<hr>
<div class="resumesViewDiv">
	<c:if test="${loginInfo.roleId eq 1 }">
		<button class="searchBtn" onclick="viewMypageAppToBar() ">확인</button>
	</c:if>
	<c:if test="${loginInfo.roleId eq 2 }">
		<button class="acceptBtnRed" onclick="viewMypageIntro() ">뒤로가기</button>
		<button class="acceptBtnBlue" onclick="viewModifyResumes(${resumes.resumesNo }) ">수정</button>
	</c:if>
</div>
