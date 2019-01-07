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
	
	.applicationImage {
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
	
	.applicationTab {
	text-align:right;
 	margin:0px 5px 3px 5px;
	box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	-webkit-border-radius: 3px;
 	border-radius: 3px;
}
	.applicationTab p{
		float:left;
		cursor:pointer;
		padding:10px;
		margin: 0 auto;
	}
	.applicationTab ul li{
		float:left;
		cursor:pointer;
		padding:10px;
		margin: 0 auto;
		list-style-type:none;
	}
	
	.applicationTab a {
		height:16px;
		color:#f1f1f1;
		font-family:arial;
		font-size:20px;
		padding:0 10px 0 10px;
		text-decoration:none;
	}
	
	.applicationTab a:hover {
	/* 	color:#D4F4FA; */
		color: gold;
	/* 	메뉴 밑줄 색상 */
		border-bottom:3px solid #ffffff;
	}
	
	.applicationTab ul ul {
		display:none;
		position:absolute;
		background-color:#000000;
	}
	
	.applicationTab ul li:hover ul {
		display: block;
	}
	
	.applicationTab ul ul li {
		float:none;
		text-align:right; /* 글 왼쪽 정렬 */
	}
</style>

<div class="adminMenu">
	<p onclick=" location.href='/mypage/info' ">Mypage</p>
	<p onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
	<p onclick="location.href='/mypage/intro' ">밴드 소개</p>
	<p class="selectMenu" onclick="location.href='/mypage/applicationToBar' ">지원 현황</p>
<!-- </div> -->

<!-- <div class="applicationTab"> -->
<!-- 	<ul > -->
<!-- 		<li class="selectMenu">지원 현황 -->
<!-- 			<ul > -->
<!-- 				<li><a href="/mypage/applicationToBar">Band to Bar</a></li> -->
<!-- 				<li><a href="/mypage/applicationToBand">Bar to Band</a></li> -->
<!-- 			</ul> -->
<!-- 		</li> -->
<!-- 	</ul> -->
<!-- </div> -->

<!-- <div class="adminMenu"> -->
	<p onclick="location.href='/mypage/recommand' ">추천 Bar</p>
	<p onclick="location.href='/mypage/calendar' ">일정표</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">Band to Bar 지원현황</p>
		<hr>
		<ul class="adminDetailInfo">
			<li>지원 현황 검색 페이지입니다.</li>
			<li>최근 6개월 간 지원내역에 대해 확인합니다.</li>
			<li>지원 확정, 취소 등  최근 1년 이내 입니다.</li>
		</ul>
	</div>
	<div class="applicationImage">
		<p >이미지 넣어주세요 </p>
	</div>
</div>

<div class="adminMypageSearchDiv">
	<div class="searchUserinfo">
		<form action="/mypage/applicationToBar" method="post">
			
			<input type="date" class="insertResumesHistory" name="appStartDate" value=""/> ~ 
			<input type="date" class="insertResumesHistory" name="appEndDate" value=""/>
			<button id="searchBtn" class="searchBtn"> 검색 </button>
		</form>
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

<script type="text/javascript">
$(document).ready(function() {
	
	var selectPage = 0;
	
// 	var curPage = "${paging.curPage }";
// 	console.log(${paging.startPage });
// 	console.log("curPage : " +curPage);
// 	console.log("selectPage : " +selectPage);
	
	$("#ajaxBtn1").click( function() {
		
		selectPage = $("button[name='ajaxBtn1']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+selectPage
				, data: {
					curPage : selectPage
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
	
	$("#ajaxBtn2").click( function() {
				
		selectPage = $("button[name='ajaxBtn2']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+selectPage
				, data: {
					curPage : selectPage
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
			
	$("#ajaxBtn3").click( function() {
		
		selectPage = $("button[name='ajaxBtn3']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+selectPage
				, data: {
					curPage : selectPage
					}
			, dataType: "html"
			, success: function(res) {
				console.log("성공");
	//				console.log(res);
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
	
	$("#ajaxBtn4").click( function() {
		
		selectPage = $("button[name='ajaxBtn4']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+selectPage
				, data: {
					curPage : selectPage
					}
			, dataType: "html"
			, success: function(res) {
				console.log("성공");
	//				console.log(res);
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
	
	$("#ajaxBtn5").click( function() {
		
		selectPage = $("button[name='ajaxBtn5']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+selectPage
				, data: {
					curPage : selectPage
					}
			, dataType: "html"
			, success: function(res) {
				console.log("성공");
	//				console.log(res);
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
	
	$("#ajaxBtnNext").click( function() {
		
		console.log(${paging.curPage });
		var nextStartPage = "${paging.startPage }"+1;
			
			
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+nextStartPage
				, data: {
					curPage : nextStartPage
					}
			, dataType: "html"
			, success: function(res) {
				console.log("성공");
	//				console.log(res);
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	});
	
	$("#ajaxBtnPrev").click( function() {
		
		var prevStartPage = "${paging.startPage }"-5;
			if( prevStartPage < 0 ) {
				prevStartPage = 1;
			}
			console.log("prevStartPage : " +prevStartPage)
			
		$.ajax({
			type: "get"
			, url: "/mypage/applicationToBar?curPage="+prevStartPage
				, data: {
					curPage : prevStartPage
					}
			, dataType: "html"
			, success: function(res) {
				console.log("성공");
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}); 
	
	$("#memberView").click( function() {
		
		selectBoard_no = $("input[name='board_no']").val();
		console.log(selectBoard_no);
		$.ajax({
			type: "get"
			, url: "/board/view?board_no=" + selectBoard_no
				, data: {
					}
			, dataType: "html"
			, success: function(res) {
				console.log("성공");
	//				console.log(res);
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
	<div>
		<table class="table table-hover table-striped table-condensed">
		
	<tr>
		<th>이력서</th>
		<th>지원일</th>
		<th>Bar</th>
		<th>공연 지원 날짜 / 시간</th>
		<th>열람여부</th>
		<th>수락 여부</th>
		<th>지원취소</th>
	</tr>
	
		<c:forEach items="${aList }" var="i">
		<%-- 			<c:if test="${i.roleId eq 1 || i.roleId eq 2}"> --%>
		<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
			<tr>
	<!-- 			<tr id="memberView"> -->
	<%-- 					<td><input type="hidden" id="board_no${i.board_no }" name="board_no${i.board_no }" value="${i.board_no }">${i.board_no }</td> --%>
	<%-- 					<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td> --%>
	<%-- 					<td>${i.userId }</td> --%>
	<%-- 					<c:choose> --%>
	<%-- 						<c:when test="${i.roleId eq 1}"> --%>
	<!-- 							<td>바</td> -->
	<%-- 						</c:when> --%>
	<%-- 						<c:when test="${i.roleId eq 2}"> --%>
	<!-- 							<td>밴드</td> -->
	<%-- 						</c:when> --%>
	<%-- 					</c:choose> --%>
				<td><a href="/mypage/resumes?resumesNo=${i.resumesNo }">이력서 보기</a></td>
				<td>${i.appDate }</td>
				<td>${i.barName }</td>
				<td>지원날짜 / 시간</td>
				<td>
					<c:if test="${i.read eq 0}">
						미열람
					</c:if>
					<c:if test="${i.read eq 0}">
						열람
					</c:if>
				</td>
				<td>
					<c:if test="${i.accept eq 0}">
						대기
					</c:if>
					<c:if test="${i.accept eq 1}">
						수락
					</c:if>
					<c:if test="${i.accept eq 2}">
						거절
					</c:if>
				</td>
				<td>
					<form action="/mypage/applicationToBarCancel" method="post">
						<input type="hidden" name="appNo" value="${i.appNo }">
							<button class="searchBtn">지원취소</button>
					</form>
				</td>
			</tr>
		</c:forEach>
			
	</table>
		
	<div id="pagingBox" class="text-center">
	  <ul class="pagination pagination-sm">
	  
<%-- 		<c:if test="${paging.curPage ne 1 }"> --%>
<!-- 	    <li> -->
<!-- 	      <a href="/board/list" aria-label="First"> -->
<!-- 	        <span aria-hidden="true">&larr;처음</span> -->
<!-- 	      </a> -->
<!-- 	    </li> -->
<%-- 		</c:if> --%>
	  
	  	<!-- 이전 페이지 -->
	  	<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
<%-- 	  	<c:if test="${paging.curPage eq 1 }"> --%>
<!-- 	    <li class="disabled"> -->
<!-- 	        <span aria-hidden="true">&laquo;</span> -->
<!-- 	    </li> -->
<%-- 	    </c:if> --%>
	    
<%-- 	  	<c:if test="${paging.curPage ne 1 }"> --%>
<!-- 	    <li> -->
<%-- 	      <a href="/board/list?curPage=${paging.curPage-1 }" aria-label="Previous"> --%>
<!-- 	        <span aria-hidden="true">&laquo;</span> -->
<!-- 	      </a> -->
<!-- 	    </li> -->
<%-- 	    </c:if> --%>
	    
	    	<!-- 이전 페이지 -->
	    <c:if test="${paging.curPage ne 1}">
    		<button id="ajaxBtnPrev" class="searchBtn" name="ajaxBtnPrev">Prev</button>
    	</c:if>
    	
	    <!-- 페이징 리스트 -->
	   
	    <c:forEach
 	     begin="${paging.startPage }"
 	     end="${paging.endPage }"
 	     var="i">
<!-- 			현재 보고 있는 페이지번호만 강조해주기 -->
<%-- 			<c:if test="${paging.curPage eq i}">           --%>
<!-- 	    	  <li class="active"> -->
<%-- 	    	  	<a href="/board/list?curPage=${i }">${i }</a> --%>
<!-- 	    	  	</li> -->
<%-- 	    	</c:if> --%>
<%-- 			<c:if test="${paging.curPage ne i}">           --%>
<!-- 	    	  <li> -->
<%-- 	    	  <a href="/board/list?curPage=${i }">${i }</a> --%>
<!-- 	    	  </li> -->
<%-- 	    	</c:if> --%>
			<button id="ajaxBtn${paging.startPage+i-1 }" class="searchBtn" name="ajaxBtn${paging.startPage+i-1 }" value="${paging.startPage+i-1 }">${paging.startPage+i-1 }</button>
	    </c:forEach>
		
		<button id="ajaxBtnNext" class="searchBtn" name="ajaxBtnNext">Next</button>
		
	    </ul>
	</div>
	</div>
</div>
