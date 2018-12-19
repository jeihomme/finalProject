<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="web.dto.Notice"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src = "http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">

.btn{
	margin-left: 69%;
}

</style>
<div>
<h2 style="margin-right: 290px"> ------글작성------ </h2>

<form action ="/notice/update" method ="post" enctype="multipart/form-data">

	<label style="margin-right: 265px"> 작성자 : <%=request.getSession().getAttribute("userId")%></label><br>
	<label style="margin-right: 265px">제목 : <input type ="text" name ="title" value="${notice.title }"/></label><br>
	<p style="margin-right: 454px"> 글 내용 </p>
	<textarea  id="content" name = "content" rows="20" cols="60" style="resize:none; ">
		${notice.content }
	</textarea><br><br>
	
	<div class="btn">
		<button id="btnUpdate" class="btn btn-warning">수정하기</button>
	
		<a href ="/notice/list"><button  type="button" class="btn btn-warning" style="margin-left: 0px" >취소</button></a>
	</div>
</form>

</div>

<script>
$(document).ready(function() {
	$("#btnUpdate").click(function(){
		submitContents($(this));
	});
});

</script>