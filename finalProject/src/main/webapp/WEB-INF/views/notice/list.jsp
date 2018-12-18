<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

#noticeTable{
	max-width: 70%;
	margin-left: -15px;

}

.container hr {
	max-width: 70%;
	margin-left: -15px;


}

#dtnWrite {

	height:50px;

    width:70px;

    background-color: #ECE8E8;

    border: none;
    
    border-radius:10px;

    color:black;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
	
	float: right;
	
	margin-right: 350px;
}




</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<div class="container">

<h1>공지사항 - LIST</h1>
<hr>
<table id="noticeTable" class="table table-striped table-hover">
<tr style="color:black">
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="board">
<tr >
	<td>${board.noticeNo }</td>
	<td>${board.title }</td>
	<td>${board.userId }</td>
	<td><fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>
<hr>
<button id="dtnWrite" onclick="location.href='/notice/write';" style="color:black" >글쓰기</button>

</div>

<jsp:include page="../util/paging.jsp" />















