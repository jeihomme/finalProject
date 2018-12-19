<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		var userid = '${notice.userId}'; // 글을 작성한 사용자 
		var loginId = '${loginId}'; // 실제로 로그인 한 사용자 
		
		if(userid == loginId){
			$(location).attr("href", "/notice/delete?boardno=${qnaView.boardno}&userid=${qnaView.userid}");
		}
		else{
			alert("글을 삭제할수 없습니다.");
			return false;
		}
		
	});
	
})
</script>


<h1>상세보기</h1>
<hr>

<table>
	<tr>
		<th>번호</th>
		<td>${notice.noticeNo }</td>
	</tr>

	<tr>
		<th>제목</th>
		<td>${notice.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${notice.content }</td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td>${notice.userId }</td>
	</tr>

	
	<tr>
		<th>작성일</th>
		<td>${notice.writtenDate }</td>
	</tr>

	
	
</table>

<div class="text-center">
		<button id="btnList" class="btn btn-primary">목록</button>
<%-- 		<c:if test="${userId eq notice.userId}"> --%>
		<button id="btnUpdate" class="btn btn-info">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
<%-- 		</c:if> --%>
</div>

