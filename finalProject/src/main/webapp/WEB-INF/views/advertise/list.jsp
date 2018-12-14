<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">

<h1>구인구직 - LIST</h1>
<hr>
<table class="table table-striped table-hover">
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



</body>
</html>













