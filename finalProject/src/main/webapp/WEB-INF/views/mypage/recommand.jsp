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
		border: 2px solid #fff;
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
		width: 335px;
		height: 280px;
		float:right;
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
	<p onclick="location.href='/mypage/intro' ">밴드 소개</p>
	<p onclick="location.href='/mypage/volunteer' ">지원 현황</p>
	<p class="selectMenu" onclick="location.href='/mypage/recommand' ">추천 Bar</p>
	<p onclick="location.href='/mypage/calendar' ">일정표</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">추천 Bar</p>
		<hr>
		<p class="adminDetailInfo">회원님의 대표 장르와 맞는 Bar를 추천합니다.</p>
		<p class="adminDetailInfo">추천 Bar는 등록하신 음악 장르에 미리 분류됩니다.</p>
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

#pagingBox {
	position: relative;
}
#btnBox {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	height: 30px;
	margin: auto;
}
#btnWrite {
	height: 25px;
}

#memberView{
	cursor:pointer;
}

#memberView:hover {
	background: #dadada;
}

#listTitle {
	cursor:pointer;
}
</style>

<div class="adminMypageSearchRes">
	<div>
		<table class="table table-hover table-striped table-condensed">
			
			<c:forEach items="${barList }" var="i" varStatus="j">
<!-- 				<tr> -->
					<td>
					${i.barNo }, 
					</td>
<!-- 				</tr> -->
				<c:if test="${j.count eq 5}">
					<br>
				</c:if>
			</c:forEach>
			
	</table>
	</div>
</div>
