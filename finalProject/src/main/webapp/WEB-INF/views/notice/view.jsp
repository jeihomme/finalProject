<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

