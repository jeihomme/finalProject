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
		text-align:right;
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
/* 		border: 1px solid #fff; */
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
	
	.appImage {
		width: 340px;
		height: 275px;
	}
	
	.selectMenuli:hover {
		color: white;
	}
</style>
<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
	<!-- 	<p class="selectMenu" onclick="viewMypageAppToBar() ">Application</p> -->
	</div>
	
	<div class="applicationTab">
		<ul >
			<li class="selectMenu">Application
				<ul >
					<li><p class="selectMenuli" onclick="viewMypageAppToBand() ">Bar to Band</p></li>
					<li><p class="selectMenuli" onclick="viewMypageAppToBar() ">Band to Bar</p></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div class="adminMenu">
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Band to Bar</p>
			<hr>
			<ul class="adminDetailInfo">
				<li>Application 검색 페이지입니다.</li>
				<li>최근 6개월 간 지원내역에 대해 확인합니다.</li>
				<li>지원 확정, 취소 등  최근 1년 이내 입니다.</li>
			</ul>
		</div>
		<div class="applicationImage">
			<img src="../resources/bandAppImage.gif" class="appImage">
		</div>
	</div>
	
	<div class="adminMypageSearchDiv">
		<div class="searchUserinfo">
	<!-- 		<form action="/mypage/applicationToBar" method="post"> -->
				
				<input type="date" class="insertResumesHistory" id="appStartDate" value=""/> ~ 
				<input type="date" class="insertResumesHistory" id="appEndDate" value=""/>
				<button id="searchBtn" class="searchBtn" onclick="searchAppFromBar() "> 검색 </button>
	<!-- 		</form> -->
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
		
			<c:forEach items="${aList }" var="i" varStatus="status">
				<tr>
					<td>
						<input type="hidden" name="resumesNo[]" value="${i.resumesNo }"/>
						<button class="searchBtn" onclick="viewResumes${status.count }() ">이력서 보기</button>
					</td>
					<td>${i.appDate }</td>
					<td>${i.barName }</td>
					<td>지원날짜 / 시간</td>
					<td>
						<c:if test="${i.read eq 0}">미열람</c:if>
						<c:if test="${i.read eq 1}">열람</c:if>
					</td>
					<td>
						<c:if test="${i.accept eq 0}">대기</c:if>
						<c:if test="${i.accept eq 1}">수락</c:if>
						<c:if test="${i.accept eq 2}">거절</c:if>
					</td>
					<td>
						<input type="hidden" name="appNo" value="${i.appNo }">
						<button class="searchBtn" onclick="applicationToBarCancel${status.count }() ">지원취소</button>
					</td>
				</tr>
			</c:forEach>
				
		</table>
			
		<div id="pagingBox" class="text-center">
		  <ul class="pagination pagination-sm">
		    	<!-- 이전 페이지 -->
		    <c:if test="${paging.curPage ne 1}">
	    		<button id="ajaxBtnPrev" class="searchBtn" name="ajaxBtnPrev">Prev</button>
	    	</c:if>
	    	
		    <!-- 페이징 리스트 -->
		    <c:forEach
	 	     begin="${paging.startPage }"
	 	     end="${paging.endPage }"
	 	     var="i">
				<button id="ajaxBtn${i }" class="searchBtn" name="ajaxBtn${i }" value="${i }">${i }</button>
		    </c:forEach>
			
			<c:if test="${paging.curPage % 5 ne 1}">
				<button id="ajaxBtnNext" class="searchBtn" name="ajaxBtnNext">Next</button>
			</c:if>
			
		    </ul>
		</div>
		</div>
	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
	<!-- 	<p class="selectMenu" onclick="viewMypageAppToBar() ">Application</p> -->
	</div>
	
	<div class="applicationTab">
		<ul >
			<li class="selectMenu">Application
				<ul >
					<li><p class="selectMenuli" onclick="viewMypageAppToBand() ">Bar to Band</p></li>
					<li><p class="selectMenuli" onclick="viewMypageAppToBar() ">Band to Bar</p></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div class="adminMenu">
		<p onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Band to Bar</p>
			<hr>
			<ul class="adminDetailInfo">
				<li>Application 검색 페이지입니다.</li>
				<li>최근 6개월 간 지원내역에 대해 확인합니다.</li>
				<li>지원 확정, 취소 등  최근 1년 이내 입니다.</li>
			</ul>
		</div>
		<div class="applicationImage">
			<img src="../resources/bandAppImage.gif" class="appImage">
		</div>
	</div>
	
	<div class="adminMypageSearchDiv">
		<div class="searchUserinfo">
	<!-- 		<form action="/mypage/applicationToBar" method="post"> -->
				
				<input type="date" class="insertResumesHistory" id="appStartDate" value=""/> ~ 
				<input type="date" class="insertResumesHistory" id="appEndDate" value=""/>
				<button id="searchBtn" class="searchBtn" onclick="searchAppFromBar() "> 검색 </button>
	<!-- 		</form> -->
		</div>
	</div>
	<style type="text/css">
	/* tr th:not(:nth-child(2)) { */
	tr th {
		text-align: center;
		color:#000;
		background-color: gold;
	}
	tr td {
		text-align: center;
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
		
			<c:forEach items="${aList }" var="i" varStatus="status">
				<tr>
					<td>
						<input type="hidden" name="resumesNo[]" value="${i.resumesNo }"/>
						<button class="searchBtn" onclick="viewResumes${status.count }() ">이력서 보기</button>
					</td>
					<td>${i.appDate }</td>
					<td>${i.barName }</td>
					<td>지원날짜 / 시간</td>
					<td>
						<c:if test="${i.read eq 0}">미열람</c:if>
						<c:if test="${i.read eq 1}">열람</c:if>
					</td>
					<td>
						<c:if test="${i.accept eq 0}">대기</c:if>
						<c:if test="${i.accept eq 1}">수락</c:if>
						<c:if test="${i.accept eq 2}">거절</c:if>
					</td>
					<td>
						<input type="hidden" name="appNo" value="${i.appNo }">
						<button class="searchBtn" onclick="applicationToBarCancel${status.count }() ">지원취소</button>
					</td>
				</tr>
			</c:forEach>
				
		</table>
			
		<div id="pagingBox" class="text-center">
		  <ul class="pagination pagination-sm">
		    	<!-- 이전 페이지 -->
		    <c:if test="${paging.curPage ne 1}">
	    		<button id="ajaxBtnPrev" class="searchBtn" name="ajaxBtnPrev">Prev</button>
	    	</c:if>
	    	
		    <!-- 페이징 리스트 -->
		    <c:forEach
	 	     begin="${paging.startPage }"
	 	     end="${paging.endPage }"
	 	     var="i">
				<button id="ajaxBtn${i }" class="searchBtn" name="ajaxBtn${i }" value="${i }">${i }</button>
		    </c:forEach>
			
<%-- 			<c:if test="${paging.curPage % 5 ne 1}"> --%>
				<button id="ajaxBtnNext" class="searchBtn" name="ajaxBtnNext">Next</button>
<%-- 			</c:if> --%>
			
		    </ul>
		</div>
		</div>
	</div>
</c:if>