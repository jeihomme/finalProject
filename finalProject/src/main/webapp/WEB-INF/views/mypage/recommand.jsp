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
	
	.barRandomListRes {
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
/* 		border: 1px solid #fff; */
		margin: 10px;
		width: 335px;
		height: 280px;
		float:right;
	}
	
	.bandRecomm {
		width: 340px;
		height: 275px;
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
	
	.profilePicSize {
		width: 120px;
		height: 100px;
	}
	
	.backgroundColor {
		background-color:#000;
		cursor:pointer;
		text-align:center;
	}
</style>
<div class="adminMenu">
	<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p class="selectMenu" onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">Recommand Bar</p>
		<hr>
		<p class="adminDetailInfo">회원님의 대표 장르와 맞는 Bar를 추천합니다.</p>
		<p class="adminDetailInfo">등록하신 음악 장르에 미리 분류됩니다.</p>
	</div>
	<div class="adminMypageMainImage">
		<img src="../resources/bandRecomm.gif" class="bandRecomm">
	</div>
</div>

<div class="barRandomListRes">
	<table class="table table-hover table-striped table-condensed">
		<c:set var="doneLoop" value="false"/>
		<c:forEach items="${barList }" var="i" varStatus="status">
			<c:if test="${not doneLoop}">
				<td class="backgroundColor">
					<input type="hidden" name="barNo" value="${i.barNo }"/>
					<p onclick="viewRecommandBar() ">
						<img class="profilePicSize" src="http://${i.path }/${i.originName }">
					</p>
					<p onclick="viewRecommandBar() ">
						${i.barName }
					</p>
					
					<c:if test="${status.count % 5 eq 0 }">
						<tr></tr>
					</c:if>
				</td>
				<c:if test="${status.count == 10}">
					<c:set var="doneLoop" value="true"/>
				</c:if>
			</c:if>
		</c:forEach>
	</table>
</div>
