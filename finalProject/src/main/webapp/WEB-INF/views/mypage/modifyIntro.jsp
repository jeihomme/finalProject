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
		width:600px;
	}
</style>
						
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
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Intro </p>
			
			<div class="adminMypageMainInfo">
				<img src="../resources/${pPic.originName }" id="profileImage" class="profilePicSize img-rounded" />
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
				
					<select class="modifyBtn" id="genreNo" name="genreNo" >
						<c:if test="${genre.genreNo eq 0}">
							<option value="0">선택</option>
						</c:if>
						
						<c:if test="${genre.genreNo ne 0}">
							<option value="${genre.genreNo }" selected="selected">${genre.genreName }</option>
						</c:if>
						
						<option value="1">bebob</option><option value="2">swing</option>
						<option value="3">punk</option><option value="4">modern</option>
						<option value="5">bosa nova</option><option value="6">boogie woogie</option>
						
					</select>
						<input type="hidden" id="barNo" name="barNo" value="${bar.barNo }"/>
<!-- 				</form> -->
			</div>
			
		</div>
	</div>
	
<!-- 	<form action="/mypage/modifyIntro" method="post"> -->
	<div class="adminMypageSearchRes">
		<hr>
		<div>
			<b class="adminDetailTitle">Address</b>
			<table class="type10">
				<thead>
				<tr>
					<th>지역</th>
					<th>상세주소</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
<!-- 						<form action="/mypage/modifyIntro" method="post"> -->
							<select class="modifyBtn" id="locationNo" name="locationNo" >
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
						
						<input type="text" id="barAddress" class="barAddress" id="barAddress" name="barAddress" placeholder=" bar 주소" value="${bar.barAddress }" />
						<input type="button" onclick="execDaumPostcode()" value="주소 찾기" class="btn btn-xs"/>
						
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<hr>
		<div >
			<p class="adminDetailTitle">Intro </p>
			<table class="type10">
				<thead>
				<tr>
					<th>소개</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>
						<textArea class="insertBarInfo" id="modifyBarInfo" name="barInfo" >${bar.barInfo }</textArea>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="resumesViewDiv">
		<button class="searchBtn" onclick="viewMypageIntro() ">뒤로가기</button>
		<input type="hidden" name="barNo" value="${bar.barNo }"/>
		<button class="searchBtn" onclick="modifyIntroProc() ">완료</button>
	</div><br><br>
		
</c:if>