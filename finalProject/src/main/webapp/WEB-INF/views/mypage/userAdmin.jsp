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
		float:left;
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
	<p class="selectMenu" onclick="location.href='/mypage/userAdmin' ">회원 관리</p>
	<p onclick="location.href='/mypage/boardAdmin' ">게시글 관리</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">관리자 회원 관리 </p>
		<hr>
		<p class="adminDetailInfo">회원을 검색하여 강제 삭제할 수 있는 공간입니다.</p>
	</div>
	<div class="adminMypageMainImage">
		<p >이미지 넣어주세요 </p>
	</div>
</div>
<div class="adminMypageSearchDiv">
	<div class="searchUserinfo">
		<form action="/mypage/userAdmin" method="post">
			검색조건 <select class="searchBtn" name="searchCategory">
				<option class="searchBtn" value="">카테고리</option>
			    <option class="searchBtn" value="userId">아이디</option>
			    <option class="searchBtn" value="contact">연락처</option>
			    <option class="searchBtn" value="userName">이름</option>
			</select>
			
			검색어 입력 <input class="searchBtn" type="text" name="searchKeyowrd" />
			<button class="searchBtn"> 검색 </button>
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
	${paging.startPage }
// 	console.log("curPage : " +curPage);
// 	console.log("selectPage : " +selectPage);
	
	$("#ajaxBtn1").click( function() {
		
		selectPage = $("button[name='ajaxBtn1']").val();
		console.log("selectPage : " +selectPage);
		
		$.ajax({
			type: "get"
			, url: "/mypage/userAdmin?curPage="+selectPage
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
			, url: "/mypage/userAdmin?curPage="+selectPage
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
			, url: "/mypage/userAdmin?curPage="+selectPage
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
			, url: "/mypage/userAdmin?curPage="+selectPage
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
			, url: "/mypage/userAdmin?curPage="+selectPage
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
			, url: "/mypage/userAdmin?curPage="+nextStartPage
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
			, url: "/mypage/userAdmin?curPage="+prevStartPage
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
		<th>아이디</th>
		<th>유저타입</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>실명</th>
		<th>정의구현</th>
	</tr>
	
		<c:forEach items="${mbList }" var="i">
			<c:if test="${i.roleId eq 1 || i.roleId eq 2}">
<%-- 			<tr id="memberView" onclick="location.href='/board/view?board_no=${i.board_no }'"> --%>
				<tr>
	<!-- 			<tr id="memberView"> -->
	<%-- 				<td><input type="hidden" id="board_no${i.board_no }" name="board_no${i.board_no }" value="${i.board_no }">${i.board_no }</td> --%>
	<%-- 				<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td> --%>
					<td>${i.userId }</td>
					<c:choose>
						<c:when test="${i.roleId eq 1}">
							<td>바</td>
						</c:when>
						<c:when test="${i.roleId eq 2}">
							<td>밴드</td>
						</c:when>
					</c:choose>
					<td>${i.email }</td>
					<td>${i.contact }</td>
<%-- 					<c:if test="${i.userName}"> --%>
						<td>${i.userName }</td>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${not i.userName }"> --%>
<!-- 						<td>없음</td> -->
<%-- 					</c:if> --%>
					<td>
					<form action="/mypage/deleteUser" method="post">
						<input type="hidden" name="userId" value="${i.userId }">
						<button class="searchBtn">회원삭제</button>
					</form></td>
				</tr>
			</c:if>
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
