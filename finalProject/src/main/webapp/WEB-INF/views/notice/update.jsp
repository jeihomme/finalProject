<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="web.dto.Notice"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnList").click(function() {
		$(location).attr("href", "/notice/list");
	});
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
	

});


</script>


<style type="text/css">

.btn{
	margin-left: 69%;
}






</style>
	<div class="text-center">




		<h1>공지사항 수정</h1>
		<hr>


		<form action="/notice/update" method="post" >
			<table class="update">
				<tr>
					<td><input type="hidden" name="noticeNo" value="${notice.noticeNo }">
				
				</tr>
				
			
				<tr>
					<th>아이디</th>
					<td><input style="color: black" name="userId" value="${notice.userId }"
						readonly="readonly"  /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input style="color: black" type="text" name="title"
						value="${notice.title}" /></td>
				</tr>

				<tr><td class="info">내용</td></tr>
 				<tr><td colspan="2"><textarea  id="content" name="content" style="color: black"  >${notice.content}</textarea></td></tr>
 

			
			</table>
		
			<button id="btnList">목록</button>
			<button type="submit" id="btnUpdate" >수정하기</button>
			<button type="button" id="btnCancel" >취소</button>
	
		</form>
		
			
	</div>

	<div></div>