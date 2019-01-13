<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="web.dto.Notice"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnList").click(function() {
		$(location).attr("href", "/faq/list");
	});
	
	$("#btnCancel").click(function() {
		history.go(-1);
	})
	
	
	

});


</script>


<style type="text/css">

button{
	color:black;
}

.update{
    border-collapse: separate;
    border-spacing: 20px;
    margin-top: -5%;
}

.btn{
	margin-left: 69%;
}
#question{
	border: 1;
	overflow: visible;
/* 	text-overflow: ellipsis; */
 	color: black;
 	resize: none;
	
}


#answer{
	border: 1;
	overflow: visible;
	text-overflow: ellipsis;
 	color: black;
    resize: none;
}


</style>
	<div class="text-center">




		<h1 style="margin-left: -70%">공지사항 수정</h1>
		<hr>


		<form action="/faq/update" method="POST" >
			<table class="update" >
				<tr>
					<td><input type="hidden" name="faqNo" value="${faq.faqNo }">
				
				</tr>
				
			
				<tr>
					<td>아이디 : </td>
					<td><input style="color: black" name="userId" value="${faq.userId }"
						readonly="readonly"  /></td>
				</tr>
				<tr>
					
					<td>제목 : <td colspan="2"><textarea id="question" name="question" cols="85" rows="1">${faq.question}</textarea></td>
				</tr>

				<tr><td class="info">내용</td></tr>
 				<tr><td colspan="2"><textarea  id="answer" name="answer" cols="100" rows="10" >${faq.answer}</textarea></td></tr>
 

			
			</table>
		
			<button id="btnList">목록</button>
			<button type="submit" id="btnUpdate" >수정하기</button>
			<button type="button" id="btnCancel" >취소</button>
	
		</form>
		
			
	</div>

	<div></div>
	
	