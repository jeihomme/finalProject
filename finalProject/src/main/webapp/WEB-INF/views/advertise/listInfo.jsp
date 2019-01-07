<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table id="advertiseTable" class="table table-striped table-hover">
<tr>
	<th>번호</th>
	<th>분류</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>

<tr>
		<td>${list.findNo }</td>
		<td>${lis.tads }</td>
		<td>${list.title }</td>
		<td>${list.bandName }</td>
		<td><fmt:formatDate value="${list.writtenDate }" pattern="yyyy-MM-dd"/></td>

</tr>

</table>