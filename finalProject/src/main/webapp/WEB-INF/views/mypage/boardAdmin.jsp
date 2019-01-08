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

<script>
function viewMypageInfo(){
	//AJAX 처리하기
	$.ajax({ 	
		type: "get"
		, url: "/mypage/info"
		, data: {
			
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function viewMypageModifyInfo(){
	//AJAX 처리하기
	$.ajax({ 	
		type: "get"
		, url: "/mypage/modifyInfo"
		, data: {
			
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function viewMypageUserAdmin(){
	//AJAX 처리하기
	$.ajax({ 	
		type: "get"
		, url: "/mypage/userAdmin"
		, data: {
			
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function viewMypageBoardAdmin(){
	//AJAX 처리하기
	$.ajax({ 	
		type: "get"
		, url: "/mypage/boardAdmin"
		, data: {
			
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function searchBoardInfo(){
	var searchCategory = document.getElementById("searchCategory").value;
	var searchKeyowrd = document.getElementById("searchKeyowrd").value;
	
	//AJAX 처리하기
	$.ajax({ 	
		type: "post"
		, url: "/mypage/boardAdmin"
		, data: {
			"searchCategory": searchCategory
			, "searchKeyowrd": searchKeyowrd
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function deleteBoardInfo1(){
	var selectResumesNo = document.getElementById("selectResumesNo1").value;
	console.log(selectResumesNo);
	
	//AJAX 처리하기
	$.ajax({ 	
		type: "post"
		, url: "/mypage/deleteBoard"
		, data: {
			"resumesNo": selectResumesNo
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function deleteBoardInfo2(){
	var selectResumesNo = document.getElementById("selectResumesNo2").value;
	console.log(selectResumesNo);
	
	//AJAX 처리하기
	$.ajax({ 	
		type: "post"
		, url: "/mypage/deleteBoard"
		, data: {
			"resumesNo": selectResumesNo
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function deleteBoardInfo3(){
	var selectResumesNo = document.getElementById("selectResumesNo3").value;
	console.log(selectResumesNo);
	
	//AJAX 처리하기
	$.ajax({ 	
		type: "post"
		, url: "/mypage/deleteBoard"
		, data: {
			"resumesNo": selectResumesNo
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function deleteBoardInfo4(){
	var selectResumesNo = document.getElementById("selectResumesNo4").value;
	console.log(selectResumesNo);
	
	//AJAX 처리하기
	$.ajax({ 	
		type: "post"
		, url: "/mypage/deleteBoard"
		, data: {
			"resumesNo": selectResumesNo
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}

function deleteBoardInfo5(){
	var selectResumesNo = document.getElementById("selectResumesNo5").value;
	console.log(selectResumesNo);
	
	//AJAX 처리하기
	$.ajax({ 	
		type: "post"
		, url: "/mypage/deleteBoard"
		, data: {
			"resumesNo": selectResumesNo
		}
		, dataType: "html"
		, success: function( res ) {
			$("#body").html(res);
		}
		, error: function() {
			console.log("실패");
		}
	});
}
</script>

<div class="adminMenu">
	<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p onclick="viewMypageUserAdmin() ">회원 관리</p>
		<p class="selectMenu" onclick="viewMypageBoardAdmin() ">게시글 관리</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">관리자 게시글 관리 </p>
		<hr>
		<p class="adminDetailInfo">게시글을 검색하여 강제 삭제할 수 있는 공간입니다.</p>
	</div>
	<div class="adminMypageMainImage">
		<p >이미지 넣어주세요 </p>
	</div>
</div>
<div class="adminMypageSearchDiv">
	<div class="searchUserinfo">
			검색조건 <select class="searchBtn" id = "searchCategory" name="searchCategory">
				<option class="searchBtn" value="">카테고리</option>
			    <option class="searchBtn" value="1">밴드 이름</option>
			    <option class="searchBtn" value="2">제목</option>
			</select>
			
			검색어 입력 <input class="searchBtn" type="text" id="searchKeyowrd" name="searchKeyowrd" />
			<button class="searchBtn" onclick="searchBoardInfo()"> 검색 </button>
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
	${paging.startPage }
// 	console.log("curPage : " +curPage);
// 	console.log("selectPage : " +selectPage);
	
	$("#ajaxBtn1").click( function() {
		
		selectPage = $("button[name='ajaxBtn1']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/boardAdmin?curPage="+selectPage
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
			, url: "/mypage/boardAdmin?curPage="+selectPage
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
			, url: "/mypage/boardAdmin?curPage="+selectPage
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
			, url: "/mypage/boardAdmin?curPage="+selectPage
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
			, url: "/mypage/boardAdmin?curPage="+selectPage
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
			, url: "/mypage/boardAdmin?curPage="+nextStartPage
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
		
		var prevStartPage = "${paging.startPage }"-10;
			if( prevStartPage < 0 ) {
				prevStartPage = 1;
			}
			console.log("prevStartPage : " +prevStartPage)
			
		$.ajax({
			type: "get"
			, url: "/mypage/boardAdmin?curPage="+prevStartPage
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
		<th>이력서 번호</th>
		<th>밴드 이름</th>
		<th>제목</th>
		<th>사운드 번호</th>
		<th>정의구현</th>
	</tr>
	
		<c:forEach items="${rsList }" var="i" varStatus="status">
<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
				<tr>
	<!-- 			<tr id="memberView"> -->
	<%-- 				<td><input type="hidden" id="board_no${i.board_no }" name="board_no${i.board_no }" value="${i.board_no }">${i.board_no }</td> --%>
	<%-- 				<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td> --%>
					<td>${i.resumesNo }</td>
					<td>${i.bandName }</td>
					<td>${i.resumesTitle }</td>
					<td>${i.musicNo }</td>
					<td>
						<input type="hidden" name="resumesNo" id="selectResumesNo${status.count }" value="${i.resumesNo }">
						<button class="searchBtn" onclick="deleteBoardInfo${status.count }()">게시글삭제</button>
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
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
<%-- 			<c:if test="${paging.curPage eq i}">           --%>
	    	  
<%-- 	    	  	<a href="/board/list?curPage=${i }">${i }</a> --%>
	    	  	
<%-- 	    	</c:if> --%>
<%-- 			<c:if test="${paging.curPage ne i}">           --%>
<!-- 	    	  <li> -->
<%-- 	    	  <a href="/board/list?curPage=${i }">${i }</a> --%>
<!-- 	    	  </li> -->
<%-- 	    	</c:if> --%>
		<li class="active">
	    	<button id="ajaxBtn${i }" class="searchBtn" name="ajaxBtn${i }" value="${i }">${i }</button>
	    	</li>
	    </c:forEach>
		
		<button id="ajaxBtnNext" class="searchBtn" name="ajaxBtnNext">Next</button>
			
	    <!-- 다음 페이지 -->
	  	<c:if test="${paging.curPage eq paging.totalPage }">
	    <li class="disabled">
	    	
<!-- 	        <span aria-hidden="true">&raquo;</span> -->
	    </li>
		</c:if>
		
<%-- 	  	<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<!-- 	    <li> -->
<%-- 	      <a href="/board/list?curPage=${paging.curPage+1 }" aria-label="Next"> --%>
<!-- 	        <span aria-hidden="true">&raquo;</span> -->
<!-- 	      </a> -->
<!-- 	    </li> -->
<%-- 	    </c:if> --%>
	    </ul>
	</div>
	</div>
</div>
