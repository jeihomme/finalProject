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
				<li>받은 지원서의 수락 및 거절할 수 있습니다.</li>
				<li>받은 지원서의 열람이 기록됩니다.</li>
				<li>보낸 지원서를 취소할 수 있습니다.</li>
				<li>수락되거나 거절되면 지원취소할 수 없습니다.</li>
			</ul>
		</div>
		<div class="applicationImage">
			<img src="../resources/bandAppImage.gif" class="appImage">
		</div>
	</div>
	
	<div class="adminMypageSearchDiv">
		<div class="searchUserinfo">
	<!-- 		<form action="/mypage/applicationToBar" method="post"> -->
				
				<input type="date" class="insertResumesHistory" id="appStartDate" value="${startDate }"/> ~ 
				<input type="date" class="insertResumesHistory" id="appEndDate" value="${endDate }"/>
				<button id="searchBtn" class="searchBtn" onclick="searchAppFromBar() "> 검색 </button>
	<!-- 		</form> -->
		</div>
	</div>	
	
	<div class="adminMypageSearchRes">
		<div>
<!-- 			<table class="table table-hover table-striped table-condensed"> -->
	<table class="type10">
		<thead>
		<tr>
			<th scope="col">밴드이력서</th>
			<th scope="col">지원일</th>
			<th scope="col">신청한 공연일</th>
			<th scope="col">수락 여부</th>
		</tr>
		</thead>
			<c:forEach items="${aList }" var="i" varStatus="status">
				<tbody>
				<tr>
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
						<input type="hidden" name="resumesNo" value="${i.resumesNo }"/>
						<input type="hidden" name="appNo" value="${i.appNo }"/>
						<input type="hidden" id="test" value="viewResumesAppNo(${i.resumesNo }, ${i.appNo })"/>
						<button class="searchBtn" onclick="viewResumesAppNo(${i.resumesNo }, ${i.appNo }) ">${bandNoList[status.index].bandName }</button>
					</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td >
						<input type="hidden" name="resumesNo[]" value="${i.resumesNo }"/>
						<input type="hidden" name="appNo" value="${i.appNo }"/>
						<button class="searchBtn" onclick="viewResumesAppNo(${i.resumesNo }, ${i.appNo }) ">${bandNoList[status.index].bandName }</button>
					</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">${i.appDate }</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>${i.appDate }</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
					${calList[status.count-1].calendarDate },<br>
					${stList[status.count-1].hourM } ~ ${enList[status.count-1].hourM }</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>${calList[status.count-1].calendarDate },<br>
					${stList[status.count-1].hourM } ~ ${enList[status.count-1].hourM }</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
						<c:if test="${i.accept eq 0}">
	<!-- 						<form action="/mypage/applicationToBandAccept" method="post"> -->
									<input type="hidden" id="acceptAppNo" name="appNo" value="${i.appNo }">
									<input type="hidden" id="acceptAcc" name="accept" value="1">
									<button class="acceptBtnBlue" onclick="appToBandAccept(${i.appNo }) ">수락</button>
	<!-- 						</form> -->
	<!-- 						<form action="/mypage/applicationToBandAccept" method="post"> -->
									<input type="hidden" id="rejectAppNo" name="appNo" value="${i.appNo }">
									<input type="hidden" id="rejectAcc" name="accept" value="2">
									<button class="acceptBtnRed" onclick="appToBandReject(${i.appNo }) ">거절</button>
	<!-- 						</form> -->
						</c:if>
						<c:if test="${i.accept eq 1}">수락</c:if>
						<c:if test="${i.accept eq 2}">거절</c:if>
					</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>
						<c:if test="${i.accept eq 0}">
	<!-- 						<form action="/mypage/applicationToBandAccept" method="post"> -->
									<input type="hidden" id="acceptAppNo" name="appNo" value="${i.appNo }">
									<input type="hidden" id="acceptAcc" name="accept" value="1">
									<button class="acceptBtnBlue" onclick="appToBandAccept(${i.appNo }) ">수락</button>
	<!-- 						</form> -->
	<!-- 						<form action="/mypage/applicationToBandAccept" method="post"> -->
									<input type="hidden" id="rejectAppNo" name="appNo" value="${i.appNo }">
									<input type="hidden" id="rejectAcc" name="accept" value="2">
									<button class="acceptBtnRed" onclick="appToBandReject(${i.appNo }) ">거절</button>
	<!-- 						</form> -->
						</c:if>
						<c:if test="${i.accept eq 1}">수락</c:if>
						<c:if test="${i.accept eq 2}">거절</c:if>
					</td>
					</c:if>
					
<%-- 					<input type="hidden" id="acceptAppNo" name="appNo" value="${i.appNo }"> --%>
<%-- 					<c:if test="${status.count % 2 eq 0 }"> --%>
<!-- 					<td class="even"> -->
<%-- 						<button class="acceptBtnRed" onclick="applicationToBarCancel${status.count }() ">지원취소</button> --%>
<!-- 					</td> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${status.count % 2 eq 1 }"> --%>
<!-- 					<td> -->
<%-- 						<button class="acceptBtnRed" onclick="applicationToBarCancel${status.count }() ">지원취소</button> --%>
<!-- 					</td> -->
<%-- 					</c:if> --%>
					
				</tr>
				</tbody>
			</c:forEach>
				
		</table>
			
		<div id="pagingBox" class="text-center">
		  <ul class="pagination pagination-sm">
		    	<!-- 이전 페이지 -->
		    <c:if test="${paging.curPage > 1}">
	    		<button id="ajaxBtnPrev" class="searchBtn" name="ajaxBtnPrev">&laquo;</button>
	    	</c:if>
	    	
		    <!-- 페이징 리스트 -->
		    <c:forEach
	 	     begin="${paging.startPage }"
	 	     end="${paging.endPage }"
	 	     var="i">
				<c:if test="${paging.endPage > 1}">
					<c:if test="${paging.curPage eq i}">
			    		<button id="ajaxBtn${i }" class="acceptBtnBlue" name="ajaxBtn${i }" value="${i }">${i }</button>
			    	</c:if>
			    	<c:if test="${paging.curPage ne i}">
			    		<button id="ajaxBtn${i }" class="searchBtn" name="ajaxBtn${i }" value="${i }">${i }</button>
			    	</c:if>
				</c:if>
		    </c:forEach>
			
			<c:if test="${paging.endPage > 1}">
				<button id="ajaxBtnNext" class="searchBtn" name="ajaxBtnNext">&raquo;</button>
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
				<li>받은 지원서의 수락 및 거절할 수 있습니다.</li>
				<li>받은 지원서의 열람이 기록됩니다.</li>
				<li>보낸 지원서를 취소할 수 있습니다.</li>
				<li>수락되거나 거절되면 지원취소할 수 없습니다.</li>
			</ul>
		</div>
		<div class="applicationImage">
			<img src="../resources/bandAppImage.gif" class="appImage">
		</div>
	</div>
	
	<div class="adminMypageSearchDiv">
		<div class="searchUserinfo">
			<input type="date" class="insertResumesHistory" id="appStartDate" value="${startDate }"/> ~ 
			<input type="date" class="insertResumesHistory" id="appEndDate" value="${endDate }"/>
			<button id="searchBtn" class="searchBtn" onclick="searchAppFromBar() "> 검색 </button>
		</div>
	</div>
	
	<div class="adminMypageSearchRes">
		<div>
			<table class="type10">
		<thead>
		<tr>
			<th scope="col">이력서</th>
			<th scope="col">지원일</th>
			<th scope="col">Bar</th>
			<th scope="col">공연</th>
			<th scope="col">열람</th>
			<th scope="col">수락</th>
			<th scope="col">지원취소</th>
		</tr>
		</thead>
			<c:forEach items="${aList }" var="i" varStatus="status">
				<tbody>
				<tr>
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
						<input type="hidden" name="resumesNo" value="${i.resumesNo }"/>
						<input type="hidden" name="appNo" value="${i.appNo }"/>
						<input type="hidden" id="test" value="viewResumesAppNo(${i.resumesNo }, ${i.appNo })"/>
						<button class="searchBtn" onclick="viewResumesAppNo(${i.resumesNo }, ${i.appNo }) ">${bandNoList[status.index].bandName }</button>
					</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td >
						<input type="hidden" name="resumesNo[]" value="${i.resumesNo }"/>
						<input type="hidden" name="appNo" value="${i.appNo }"/>
						<button class="searchBtn" onclick="viewResumesAppNo(${i.resumesNo }, ${i.appNo }) ">${bandNoList[status.index].bandName }</button>
					</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">${i.appDate }</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>${i.appDate }</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">${i.barName }</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>${i.barName }</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
					${calList[status.count-1].calendarDate },<br>
					${stList[status.count-1].hourM } ~ ${enList[status.count-1].hourM }</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>${calList[status.count-1].calendarDate },<br>
					${stList[status.count-1].hourM } ~ ${enList[status.count-1].hourM }</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
						<c:if test="${i.read eq 0}">미열람</c:if>
						<c:if test="${i.read eq 1}">열람</c:if>
					</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>
						<c:if test="${i.read eq 0}">미열람</c:if>
						<c:if test="${i.read eq 1}">열람</c:if>
					</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
						<c:if test="${i.accept eq 0}">대기</c:if>
						<c:if test="${i.accept eq 1}">수락</c:if>
						<c:if test="${i.accept eq 2}">거절</c:if>
					</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>
						<c:if test="${i.accept eq 0}">대기</c:if>
						<c:if test="${i.accept eq 1}">수락</c:if>
						<c:if test="${i.accept eq 2}">거절</c:if>
					</td>
					</c:if>
					
					<c:if test="${status.count % 2 eq 0 }">
					<td class="even">
						<c:if test="${i.accept eq 0}">
						<button class="acceptBtnRed" onclick="applicationToBarCancel(${i.appNo }) ">지원취소</button>
						</c:if>
					</td>
					</c:if>
					<c:if test="${status.count % 2 eq 1 }">
					<td>
						<c:if test="${i.accept eq 0}">
							<button class="acceptBtnRed" onclick="applicationToBarCancel(${i.appNo }) ">지원취소</button>
						</c:if>
					</td>
					</c:if>
				</tr>
				</tbody>
			</c:forEach>
				
		</table>
			
		<div id="pagingBox" class="text-center">
		  <ul class="pagination pagination-sm">
		    	<!-- 이전 페이지 -->
			<c:if test="${paging.curPage > 1}">
	    		<button id="ajaxBtnPrev" class="searchBtn" name="ajaxBtnPrev">Prev</button>
	    	</c:if>
	    	
		    <!-- 페이징 리스트 -->
		    <c:forEach
	 	     begin="${paging.startPage }"
	 	     end="${paging.endPage }"
	 	     var="i">
				<c:if test="${paging.endPage > 1}">
					<c:if test="${paging.curPage eq i}">
			    		<button id="ajaxBtn${i }" class="acceptBtnBlue" name="ajaxBtn${i }" value="${i }">${i }</button>
			    	</c:if>
			    	<c:if test="${paging.curPage ne i}">
			    		<button id="ajaxBtn${i }" class="searchBtn" name="ajaxBtn${i }" value="${i }">${i }</button>
			    	</c:if>
				</c:if>
		    </c:forEach>
			
			<c:if test="${paging.endPage > 1}">
				<button id="ajaxBtnNext" class="searchBtn" name="ajaxBtnNext">Next</button>
			</c:if>
			
		    </ul>
		</div>
		</div>
	</div>
</c:if>