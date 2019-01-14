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
	
	.adminBoardManage{ 
		width: 340px;
		height: 275px;
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

<div class="adminMenu">
	<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageUserAdmin() ">Users</p>
		<p class="selectMenu" onclick="viewMypageBoardAdmin() ">Boards</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">Boards </p>
		<hr>
		<p class="adminDetailInfo">게시글을 검색하여 강제 삭제할 수 있는 공간입니다.</p>
	</div>
	<div class="adminMypageMainImage">
		<img src="../resources/adminBoardManage.gif" class="adminBoardManage">
	</div>
</div>
<div class="adminMypageSearchDiv">
	<div class="searchUserinfo">
			검색조건 <select class="searchBtn" id = "searchCategory" name="searchCategory">
				<option value="">카테고리</option>
			    <option value="1">밴드 이름</option>
			    <option value="2">제목</option>
			</select>
			
			검색어 입력 <input type="text" id="searchKeyowrd" name="searchKeyowrd" value="${search }"/>
			<button class="searchBtn" onclick="searchBoardInfo()"> 검색 </button>
	</div>
</div>

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
		<table class="type10">
		<thead>
	<tr>
		<th>이력서 번호</th>
		<th>밴드 이름</th>
		<th>제목</th>
		<th>사운드 번호</th>
		<th>정의구현</th>
	</tr>
	</thead>
	
	<c:if test="${status.count %2 eq 1 }">
	<td>${i.userId }</td>
	</c:if>
	<c:if test="${status.count %2 eq 0 }">
	<td class="even">${i.userId }</td>
	</c:if>
					
			<tbody>		
		<c:forEach items="${rsList }" var="i" varStatus="status">
				<tr>
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.resumesNo }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.resumesNo }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.bandName }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.bandName }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.resumesTitle }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.resumesTitle }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.musicNo }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.musicNo }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>
						<input type="hidden" name="resumesNo" id="selectResumesNo${status.count }" value="${i.resumesNo }">
						<button class="searchBtn" onclick="deleteBoardInfo${status.count }()">게시글삭제</button>
					</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">
						<input type="hidden" name="resumesNo" id="selectResumesNo${status.count }" value="${i.resumesNo }">
						<button class="searchBtn" onclick="deleteBoardInfo${status.count }()">게시글삭제</button>
					</td>
					</c:if>
				</tr>
		</c:forEach>
			</tbody>
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
