<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
	function noticeBoardno(notice) {

		location.href = "/notice/list?noticeNo=" + noticeNo;
	}

	function search(frm) {
		if (frm.keyWord.value == "") {
			alert("검색 단어를 입력하세요");
			frm.keyWord.focus();
			return;
		}
		frm.sumbit();
	}
</script>

<script type="text/javascript">
	$(document).ready(
			function() { 

				var result = '${result}';
				var successMsg = '${successMsg}';
				var failMsg = '${failMsg}';

				if (result == 'success') {
					alert(successMsg);
				} else if (result == 'fali') {
					alert(failMsg);
				}

				$("table").on(
						"click",
						"tr",
						function() {
							//클릭이벤트가 발생한 <tr>의 첫번째 <td>자식의 텍스트
							var noticeNo = $(this).children("td").eq(0).text();

							$(location).attr("href",
									"/notice/view?noticeNo=" + noticeNo);
						});

				$("#btnSearch").click(
						function() {

							var searchVal = $("#searchVal").val();
							var searchTxt = $("#searchTxt").val();
							
							$(location).attr(
									"href",
									"/notice/list?searchVal="
											+ searchVal+"&"+"searchTxt="
											+ searchTxt);

						});

			});
</script>


<style type="text/css">



#notice{
	max-width: 70%;
	margin-left: -15px;
	border-bottom: 1px solid white;
	color:black;
	text-align: center;

}

.pointer{ 

cursor:pointer; 

}

.container hr {
	max-width: 70%;
	margin-left: -15px;


}
#btnWrite{
 	margin-left: 200px; 
	background-color: #848484;
	color:white;

}

 

 th {

	text-align: center;
}

 td {
    text-align: center;
    background-color: black;
    color: white;
    
  }
#searchBox{
	margin-left: 227px;
	display: inline-block;
	color: black;
} 


</style>
<div class="container">

<h1>게시판 - LIST</h1>
<hr>
<table id="notice" class="table table-striped table-hover">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="board">

<tr>
		<td>${board.noticeNo }</td>
		<td><a href="/notice/view?noticeNo=${board.noticeNo}">${board.title }</a></td>
		<td>${board.userId }</td>
		<td><fmt:formatDate value="${board.writtenDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table>
<hr>
<div id="searchBox" class="text-center">
			<tr>
				<td><select id="searchVal" name="searchVal" style="color: black">
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
						<option value="userid">작성자</option>
				</select></td>
			</tr>
			<input type="text" id="searchTxt" name="searchTxt" />
			<button id="btnSearch">검색</button>
			<button id="btnWrite" onclick="location.href='/notice/write';">글쓰기</button>
		</div>


</div>


<jsp:include page="../util/paging.jsp" />














