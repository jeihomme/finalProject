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
	
	.adminUserManage {
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
	
	.modifySelectBtn {
		color: black;
		font-weight: bold;
		border-radius:10px;
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
	<p class="selectMenu" onclick="viewMypageUserAdmin() ">Users</p>
	<p onclick="viewMypageBoardAdmin() ">Boards</p>
</div><br><br>
<hr>
<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">Users </p>
		<hr>
		<p class="adminDetailInfo">회원을 검색하여 강제 삭제할 수 있는 공간입니다.</p>
	</div>
	<div class="adminMypageMainImage">
		<img src="../resources/adminUserManage.png" class="adminUserManage">
	</div>
</div>
<div class="adminMypageSearchDiv">
	<div class="searchUserinfo">
		검색조건 <select class="modifySelectBtn" id="searchCategory" name="searchCategory">
			<option value="">카테고리</option>
		    <option value="1">아이디</option>
		    <option value="2">연락처</option>
		    <option value="3">이름</option>
		</select>
		
		검색어 입력 <input id="searchKeyowrd" type="text" name="searchKeyowrd" value="${search }"/>
		<button class="searchBtn" onclick="searchUserInfo()"> 검색 </button>
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
		
		var prevStartPage = "${paging.startPage }"-1;
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
});

</script>

<div class="adminMypageSearchRes">
	<div>
		<table class="type10">
		<thead>
	<tr>
		<th>아이디</th>
		<th>유저</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>이름</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${mbList }" var="i" varStatus="status">
			<c:if test="${i.roleId eq 1 || i.roleId eq 2}">
				<tr>
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.userId }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.userId }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<c:choose>
						<c:when test="${i.roleId eq 1}">
							<td>바</td>
						</c:when>
						<c:when test="${i.roleId eq 2}">
							<td>밴드</td>
						</c:when>
					</c:choose>
					</c:if>
					
					<c:if test="${status.count %2 eq 0 }">
					<c:choose>
						<c:when test="${i.roleId eq 1}">
							<td class="even">바</td>
						</c:when>
						<c:when test="${i.roleId eq 2}">
							<td class="even">밴드</td>
						</c:when>
					</c:choose>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.email }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.email }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.contact }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.contact }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>${i.userName }</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">${i.userName }</td>
					</c:if>
					
					<c:if test="${status.count %2 eq 1 }">
					<td>
						<input type="hidden" name="userId" id="selectUserId${status.count }" value="${i.userId }">
						<button class="searchBtn" onclick="deleteUserInfo${status.count }()">회원삭제</button>
					</td>
					</c:if>
					<c:if test="${status.count %2 eq 0 }">
					<td class="even">
						<input type="hidden" name="userId" id="selectUserId${status.count }" value="${i.userId }">
						<button class="searchBtn" onclick="deleteUserInfo${status.count }()">회원삭제</button>
					</td>
					</c:if>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
	</table>
		
	<div id="pagingBox" class="text-center">
	  <ul class="pagination pagination-sm">
	    
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
