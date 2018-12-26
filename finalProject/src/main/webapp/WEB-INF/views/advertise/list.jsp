<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
p{
background:#f0f0f0; 
border:1px solid #ccc;
max-width: 70%;

}

#advertiseTable{
	max-width: 70%;
	margin-left: -15px;
/*  	border-bottom: 1px solid white;  */


}

.pointer{ 

cursor:pointer; 

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

#sumTable{
	max-width: 70%;
	margin-left: -15px;

}
 

#sumTable th {

	text-align: left;
}

#sumTable td {
    text-align: left;
    background-color: black;
    
    
  }
 


</style>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>




<div class="container">

<h1>구인구직 - LIST</h1>
<hr>


<div style="margin-left: 30%; margin-bottom: 5%;">
<a>맴버</a>   /   <a>콜라보</a>

</div>
<table id="advertiseTable" class="table table-striped table-hover">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="board">
<tr>
	<td>${board.boardNo }</td>
	<td>${board.title }</td>
	<td>${board.writerNick }</td>
	<td>${board.hit }</td>
	<td><fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>
<hr>
</div>
















