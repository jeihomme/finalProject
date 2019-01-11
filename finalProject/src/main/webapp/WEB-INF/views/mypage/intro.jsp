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
/* 		border: 1px solid #fff; */
/* 		margin: 10px; */
		width: 290px;
		height: 280px;
		float:right;
	}
	
	.selectMenu {
		color: gold;
	}
	
	.searchBtn {
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
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
		color: gold;
	}
	
	.adminDetailMust {
		font-size:8px;
		color:gold;
		float:left;
	}
	
	.resumesBtn {
		margin: 0 auto;
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
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
	
	.bandProfileImage {
		width: 290px;
		height: 280px;
		margin: 7px 0px 0px -8px;
		border-radius: 15px;
		cursor:pointer;
	}
	
	.barProfileImage {
		width: 210px;
		height: 200px;
		margin: 7px 0px 0px -8px;
		border-radius: 15px;
		cursor:pointer;
	}
	
	.modifyProfilePic {
		float:left;
		text-decoration:none;
		color: #ffffff;
		font-size:35px;
		cursor:pointer;
	    position: relative;
	    right: 135px;
	    top: -10px;
	}
	
	.barIntroInfo1 {
		margin: 10px;
		width:400;
		float:left;
	}
	
	.barIntroInfo2 {
		margin: 10px;
		width:400;
		float:left;
	}
	
	.bandIntroHeader {
		font-size:20px;
	}
	
	.bandIntroInsert {
		color: black;
		background-color:gold;
		float:right;
	}
	
	.bandIntroPublic {
		color: black;
		background-color:gold;
		float:left;
	}
	
	.addResumesList {
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
		float:right;
	}
	
	.selectPublicResumes {
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
		float:left;
	}
	
	table.type10 td.tdSize100 {
		width:100px;
	}
	
	table.type10 td.tdSize500 {
		width:500px;
	}
</style>

<script>
$(document).ready(function(){
	$('#profileImage').click(function(){
		$('#profileFile').click();
	});
	
	$('#profileFile').change(function(){
		uploadProfilePicIntro();
// 		$('#profileFileForm').submit();
	});
});
</script>
 			
<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p class="selectMenu" onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBand() ">Application</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class=bandIntroInfo>
			<b class="adminDetailTitle">Intro </b><br>
			<input type="hidden" id="barNo" value="${bar.barNo }"/>
			<div class="bandIntroInfo">
				<b>사진을 누르면 사진이 변경됩니다.</b>
				<form id="profileFileForm" action="" enctype="multipart/form-data" class="uploadForm">
					<input id="profileFile" type="file" name="uploadFile" style="display:none;"/>
				</form>
<%-- 				<img class="profilePicSize" src="http://${pPic.path }/${pPic.originName }"> --%>
				<img src="../resources/${pPic.originName }" id="profileImage" class="barProfileImage img-rounded"/>
				
			</div>
			<div class="barIntroInfo1">
				<b class="introDetailInfo">바명</b>
				${bar.barName }<br><br>
	<!-- 			<input type="text" name="bandName"/><br> -->
				<b class="introDetailInfo">담당자 </b>
				${bar.manager }<br><br>
				<b class="introDetailInfo">연락처 </b>
				${member.contact }<br><br>
	<!-- 			<input type="text" name="contact"/><br> -->
			</div>
			<div class="barIntroInfo1">
				<b class="introDetailInfo">이메일 </b>
	<!-- 			<input type="text" name="email"/><br> -->
				${member.email }<br><br>
				<b class="introDetailInfo">장르 </b>
				${genre.genreName }<br><br>
			</div>
			
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<b class="adminDetailTitle">Address</b>
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
			<p class="adminDetailTitle">Intro </p>
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
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p class="selectMenu" onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="barIntroInfo">
			<p class="adminDetailTitle">Intro </p>
			<hr>
			<ul class="introDetailInfo">
				<li>이력서는 최대 5개까지 작성 가능합니다.</li>
				<li>지원하고자 하는 Bar마다 내용을 다르게 할 수 있습니다.</li>
				<li>사진을 눌러 수정이 가능합니다.</li>
			</ul>
		</div>
		
		<form id="profileFileForm" action="" enctype="multipart/form-data" class="uploadForm">
			<input id="profileFile" type="file" name="uploadFile" style="display:none;"/>
		</form>
		<div class="adminMypageMainImage">
			<img src="../resources/${pPic.originName }" id="profileImage" class="bandProfileImage img-rounded"/>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<p class="bandIntroHeader">밴드소개 리스트</p>
			<c:if test="${rListRnum > 0 }">
				<button class="selectPublicResumes" onclick="modifyPublicResumes() ">공개 선택</button>
			</c:if>
			<c:if test="${rListRnum < 5 }">
				<button class="addResumesList" onclick="viewNewResumes() ">+</button>
			</c:if><br>
			<table class="type10">
				<thead>
				<tr>
					<th>공개</th>
					<th>밴드소개 제목</th>
					<th>첨부파일번호</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${resumesList }" var="i" varStatus="status">
					<tr>
						<c:if test="${status.count % 2 eq 1 }">
							<td class="tdSize100">
								<c:if test="${i.publicResumes eq 1}"> 
									<input type="checkbox" name="publicResumes" value="${status.count }" checked="checked" onclick="oneCheckbox(this)">
								</c:if>
								<c:if test="${i.publicResumes eq 0}"> 
									<input type="checkbox" name="publicResumes" value="${status.count }" onclick="oneCheckbox(this)">
								</c:if>
							</td>
						</c:if>
						<c:if test="${status.count % 2 eq 0 }">
							<td class="even tdSize100">
								<c:if test="${i.publicResumes eq 1}"> 
									<input type="checkbox" name="publicResumes" value="${status.count }" checked="checked" onclick="oneCheckbox(this)">
								</c:if>
								<c:if test="${i.publicResumes eq 0}"> 
									<input type="checkbox" name="publicResumes" value="${status.count }" onclick="oneCheckbox(this)">
								</c:if>
							</td>
						</c:if>
						
						<c:if test="${status.count % 2 eq 1 }">
							<td class="tdSize500">
								<b class="mousePointer" onclick="viewResumesAppNo(${i.resumesNo })"> ${i.resumesTitle } </b>
									<input type="hidden" name="resumesNo[]" value="${i.resumesNo }">
									<button class="searchBtn" onclick="deleteResumes(${i.resumesNo })">삭제</button>
							</td>
						</c:if>
						<c:if test="${status.count % 2 eq 0 }">
							<td class="even tdSize500">
								<b class="mousePointer" onclick="viewResumesAppNo(${i.resumesNo })"> ${i.resumesTitle } </b>
									<input type="hidden" name="resumesNo[]" value="${i.resumesNo }">
									<button class="searchBtn" onclick="deleteResumes(${i.resumesNo })">삭제</button>
							</td>
						</c:if>
						
						<c:if test="${status.count % 2 eq 1 }">
							<td class="tdSize100">${i.musicNo }</td>
						</c:if>
						<c:if test="${status.count % 2 eq 0 }">
							<td class="even tdSize100">${i.musicNo }</td>
						</c:if>
					</tr>
					
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<form id="soundFileForm" action="" method="post" enctype="multipart/form-data">
				<b class="bandIntroHeader">첨부파일 리스트</b>
				<input class="bandIntroInsert" type="file" name="file" id="soundFile"/>
				<c:if test="${mListRnum < 5 }">
					<button type="button" class="searchBtn" onclick="uploadSoundIntro() ">파일 첨부</button>
				</c:if>
			</form>
			
<!-- 			</form> -->
			<table class="type10">
				<thead>
				<tr>
					<th>번호</th>
					<th>파일명</th>
					<th>등록/수정일</th>
				</tr>
				</thead>
				<c:forEach items="${musicList }" var="i" varStatus="status">
						<tr>
							<c:if test="${status.count % 2 eq 1 }">
							<td class="tdSize100">${i.musicNo }</td>
							</c:if>
							<c:if test="${status.count % 2 eq 0 }">
							<td  class="even tdSize100">${i.musicNo }</td>
							</c:if>
							
							<c:if test="${status.count % 2 eq 1 }">
							<td class="tdSize500 "><a href="">${i.musicTitle }</a>
								<input type="hidden" name="musicNo" value="${i.musicNo }">
								<input type="hidden" name="bandNo" value="${i.musicNo }">
								<button class="searchBtn" onclick="deleteSound${status.count}() ">삭제</button>
							</td>
							</c:if>
							<c:if test="${status.count % 2 eq 0 }">
							<td class="even"><a href="">${i.musicTitle }</a>
								<input type="hidden" name="musicNo" value="${i.musicNo }">
								<input type="hidden" name="bandNo" value="${i.musicNo }">
								<button class="searchBtn" onclick="deleteSound${status.count}() ">삭제</button>
							</td>
							</c:if>
							
							<c:if test="${status.count % 2 eq 1 }">
							<td class="tdSize100">${i.writtenDate }</td>
							</c:if>
							<c:if test="${status.count % 2 eq 0 }">
							<td class="even">${i.writtenDate }</td>
							</c:if>
							
							
							
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</c:if>