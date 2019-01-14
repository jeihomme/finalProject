<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnList").click(function() {
		$(location).attr("href", "/notice/list");
	});
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/notice/update?noticeNo=${notice.noticeNo }");
	});
	$("#btnDelete").click(function() {
		
// 		var userid = '${notice.userId}'; // 글을 작성한 사용자 
// 		var loginId = '${loginId}'; // 실제로 로그인 한 사용자 
		
// 		if(userid == loginId){
			$(location).attr("href", "/notice/delete?noticeNo=${notice.noticeNo}");
// 		}
// 		else{
// 			alert("글을 삭제할수 없습니다.");
// 			return false;
// 		}
		
	});
	
})
</script>
<style>
td {
 color:black;
}

tr{
 color:black;
}


</style>


<h1>상세보기</h1>
<hr>
<div class="row">
<div class ="col-xs-2 col-md-2" style="width: 100%">
<div class="table table-responsive">
<table class = "table">
	<tr>
		<th class="success">번호</th>
		<td colspan="2">${notice.noticeNo }</td>
		<th class="success">작성자</th>
		<td>${notice.userId }</td>
	</tr>

	<tr>
		<th class="success">제목</th>
		<td colspan="2">${notice.title }</td>
		<th class="success">작성일</th>
		<td><fmt:formatDate value="${notice.writtenDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<th class="success">내용</th>
		<td colspan="3">${notice.content }</td>
	</tr>	
</table>

	<div class="text-center">
			<button id="btnList" class="btn btn-primary">목록</button>
			<c:if test="${member.roleId eq '0'}"> 
			<button id="btnUpdate" class="btn btn-info">수정</button>
			<button id="btnDelete" class="btn btn-danger">삭제</button>
			</c:if>
			</div>
		</div>
	</div>
	</div>