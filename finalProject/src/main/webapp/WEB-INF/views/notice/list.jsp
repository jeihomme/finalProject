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
#btnWrite{
	margin-left: 64%;
	background-color: #848484;
	color:white;
}

 

th {

	text-align: center;
}

td {
    
    background-color: black;
    
    
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
	<td><a href="/notice/view?noticeNo=${board.noticeNo}">${board.title }</a></td>
	<td>${board.userId }</td>
	<td><fmt:formatDate value="${board.writtenDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table>
<hr>
<button id="btnWrite" onclick="location.href='/notice/write';" >글쓰기</button>

</div>
<jsp:include page="../util/paging.jsp" />















