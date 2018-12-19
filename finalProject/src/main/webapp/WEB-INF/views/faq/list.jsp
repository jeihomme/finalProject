<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

#noticeTable{
	max-width: 70%;
	margin-left: -15px;
	border-bottom: 1px solid white;

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

<h1>FAQ - LIST</h1>
<hr>
<table id="noticeTable" class="table table-striped table-hover">
<tr style="color:black">
	<th style="	text-align: center;" >번호</th>
	<th style="	text-align: center;">제목</th>
	<th style="	text-align: center;">작성자</th>
	<th style="	text-align: center;">작성일</th>
</tr>


<c:forEach items="${list }" var="faq">
<tr >
	<td>${faq.faqNo }</td>
	<td><a href="/notice/view?noticeNo=${faq.faqNo}">${board.question }</a></td>
	<td>${faq.userId }</td>
	<td><fmt:formatDate value="${faq.writtenDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table>
<button id="btnWrite" onclick="location.href='/faq/write';" >글쓰기</button>
<hr>
</div>
<jsp:include page="../util/paging.jsp" />















