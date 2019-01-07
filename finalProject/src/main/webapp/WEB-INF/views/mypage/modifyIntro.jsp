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
	
	.insertBarInfo {
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
	
	.barAddress {
		width:300px;
	}
</style>

<script type="text/javascript">
function execDaumPostcode() { // (post)
	new daum.Postcode({
		oncomplete: function(data) {
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수
			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}
			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				if(data.bname !== ''){//법정동명이 있을 경우 추가한다.
					extraAddr += data.bname;
				}
				if(data.buildingName !== ''){ // 건물명이 있을 경우 추가한다.
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
//  			document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('barAddress').value = fullAddr;
			// 커서를 상세주소 필드로 이동한다.
//  			document.getElementById('addr2').focus();
//  			$("input[name=addr2]").val("");
		}
	}).open();
}
</script>
						
<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick=" location.href='/mypage/info' ">Mypage</p>
		<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p class="selectMenu" onclick="location.href='/mypage/intro' ">바 소개</p>
		<p onclick="location.href='/mypage/applicationToBand' ">지원 현황</p>
		<p onclick="location.href='/mypage/calendar' ">일정표</p>
	</div><br><br>
	<hr>
	<form action="/mypage/modifyIntro" method="post">
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">기본정보 </p>
			
			<div class="adminMypageMainInfo">
				<img class="profilePicSize" src="http://${pPic.path }/${pPic.originName }">
				<input type="hidden" name="profileNo" value="${pPic.profileNo }"/>
				<input type="hidden" name="path" value="${pPic.path }"/>
				<input type="hidden" name="originName" value="${pPic.originName }"/>
<!-- 				<input type="file" name="profileNo"/> -->
<!-- 				<form action="/user/file" method="post" enctype="multipart/form-data" class="uploadForm"> -->
<!-- 					<input type="file" name="uploadFile" class="fileBtn" style="display: none;"/> -->
<!-- 					<input type="submit" value="업로드" class="submitBtn" style="display: none;"/> -->
<!-- 				</form>			 -->

<!-- 				<input id="fileBtn" type="file" name="uploadFile" style="display:none"/> -->
<!-- 				<span id="fileModify" class = "glyphicon glyphicon-picture" ></span> -->
			</div>
	
			<div class="adminMypageMainInfo">
				<b class="adminDetailInfo">바명</b><p class="adminDetailMust">(필수) </p><br>
				${bar.barName }<br><br>
	<!-- 			<input type="text" name="bandName"/><br> -->
				<b class="adminDetailInfo">담당자 </b><p class="adminDetailMust">(필수) </p><br>
				${bar.manager }<br><br>
				<b class="adminDetailInfo">연락처 </b><p class="adminDetailMust">(필수) </p><br>
				${member.contact }<br><br>
	<!-- 			<input type="text" name="contact"/><br> -->
			</div>
	
			<div class="adminMypageMainInfo">
				<b class="adminDetailInfo">이메일 </b><p class="adminDetailMust">(필수) </p><br>
	<!-- 			<input type="text" name="email"/><br> -->
				${member.email }<br><br>
				<b class="adminDetailInfo">장르 </b><p class="adminDetailMust">(필수) </p><br>
<%-- 				${genre.genreName }<br><br> --%>
				
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
						<input type="hidden" name="barNo" value="${bar.barNo }"/>
<!-- 				</form> -->
			</div>
			
		</div>
	</div>
	
<!-- 	<form action="/mypage/modifyIntro" method="post"> -->
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
					<td>
<!-- 						<form action="/mypage/modifyIntro" method="post"> -->
							<select class="modifyBtn" name="locationNo" >
								<c:if test="${location.locationNo eq 0}">
									<option value="0">선택</option>
								</c:if>
								
								<c:if test="${location.locationNo ne 0}">
									<option value="${location.locationNo }" selected="selected">${location.locationName }</option>
								</c:if>
								
								<option value="1">서울</option><option value="2">경기</option>
								<option value="3">인천</option><option value="4">대전</option>
								<option value="5">세종</option><option value="6">강원</option>
								
								<option value="7">충북</option><option value="8">충남</option>
								<option value="9">부산</option><option value="10">대구</option>
								<option value="11">울산</option><option value="12">경북</option>
								
								<option value="13">경남</option><option value="14">전북</option>
								<option value="15">전남</option><option value="16">제주</option>
								
							</select>
<%-- 							<input type="hidden" name="barNo" value="${bar.barNo }"/> --%>
<!-- 							<button class="searchBtn">선택</button> -->
<!-- 						</form> -->
					</td>
					<td>
						
						<input type="text" id="barAddress" class="barAddress" name="barAddress" placeholder=" bar 주소" value="${bar.barAddress }" />
						<input type="button" onclick="execDaumPostcode()" value="주소 찾기" class="btn btn-xs"/>
						
					</td>
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
					<td><textArea class="insertBarInfo" name="barInfo" >${bar.barInfo }</textArea>
				</tr>
			</table>
		</div>
	</div>
	
	<hr>
<!-- 	<form action="/mypage/modifyIntro" method="post"> -->
		<div class="resumesViewDiv">
			<button class="resumesBtn" onclick=" location.href='/mypage/intro' ">뒤로가기</button>
			<input type="hidden" name="barNo" value="${bar.barNo }"/>
			<button class="resumesBtn" >완료</button>
		</div>
	</form>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
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
			<p class="adminDetailTitle">밴드 소개 </p>
			<hr>
			<ul class="adminDetailInfo">
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
		<hr>
		<div>
			<p class="bandIntroHeader">밴드소개 리스트</p>
			<button class="bandIntroInsert" onclick="location.href='/mypage/modifyResumes' ">소개 등록</button>
			<table class="table table-hover table-striped table-condensed">
				
				<tr>
					<th>공개</th>
					<th>밴드소개 제목</th>
					<th>첨부파일번호</th>
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
							<form class="bandModifyBtn" action="/mypage/modifyResumes" method="get">
								<input type="hidden" name="resumesNo" value="${i.resumesNo }">
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