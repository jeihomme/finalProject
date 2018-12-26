<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function noticeNo(notice) {

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
$(document).ready(function(){
	$("#notice  p").hide();
	$("#notice table").click(function() {
		$(this).next("p").slideToggle("fast")
				.siblings("p:visible").slideUp("fast");
		$(this).toggleClass("active")
				.siblings("tr").removeClass("active");
		});
	
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
				var boardno = $(this).children("td").eq(0).text();

				$(location).attr("href",
						"/notice/list?noticeNo=" + noticeNo);
			});

	$("#btnSearch").click(
			function() {

				var searchVal = $("#searchVal").val();
				var searchTxt = $("searchTxt").val();

				$(location).attr(
						"href",
						"/notice/list?searchVal="
								+ searchVal + "searchTxt="
								+ searchTxt);

			});

});
</script>



<style type="text/css">
p{
background:#f0f0f0; 
border:1px solid #ccc;
max-width: 70%;

}

#noticeTable{
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
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<div id="notice" class="container">
	<table id="noticeTable" class="table table-striped table-hover">
	<tr class="pointer" style="color:black">
					<th style="width: 10%; text-align: center;">번호</th>
					<th style="width: 45%; text-align: center;">제목</th>
					<th style="width: 20%; text-align: center;">작성자</th>
					<th style="width: 20%; text-align: center;">작성일</th>
	</tr>
 	</table> 
	<c:forEach items="${list }" var="board">
<%-- 	<h3 style="color: black; text-align:center; font-size:medium;margin-top: 0px; margin-bottom: 0px; ">${board.noticeNo } ,&emsp;&emsp;&emsp;&emsp; ${board.title },&emsp;&emsp;&emsp;&emsp; ${board.userId } &emsp;&emsp;&emsp;&emsp;<fmt:formatDate value="${board.writtenDate }" pattern="yyyy-MM-dd"/></h3> --%> 
	<table id="sumTable" class="table table-striped table-hover">
	<tr>
		<td style="	text-align: center; width: 10%;">${board.noticeNo }</td>
		<td style="	text-align: center; width: 45%;" >${board.title }</td>
		<td style="	text-align: center; width: 20%;">${board.userId }</td>
		<td style="	text-align: center; width: 20%;"><fmt:formatDate value="${board.writtenDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	
	
	</table>

	<p style="color: black; margin-left: -15px;">${board.content }
	<button name="updateBtn" onclick="location.href='/notice/update?noticeNo=${board.noticeNo}';">수정</button></p>
	
</c:forEach>
	<button type = "button" onclick="location.href='/notice/write';" style="color: black">글쓰기</button>
</div>
<div id="searchBox" class="text-center">
	
			<tr style="color: black;">
				<td><select id="searchVal" name="searchVal">
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
						<option value="userid">작성자</option>
				</select></td>
				</tr>
			<input type="text" id="searchTxt" name="searchTxt" />
			<button id="btnSearch">검색</button>
		
		</div>



<jsp:include page="../util/paging.jsp" />















