<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>Band</h1>
<div style="background-color:gray; border-radius:20px;">
	<table>
		<tr>
			<c:forEach items="${genre }" var="g">
				<th><a>${g.genreTitle }</a></th>
			</c:forEach>
		</tr>
	</table>
</div>

<br><br>

<div style="background-color:gray; border-radius:20px;">
	여기에 목록 뿌리기
</div>
<button style="background-color:black; border:0px; align:right;">+ 더보기</button>
