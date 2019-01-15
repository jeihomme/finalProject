<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">


$(document).ready(function(){
	$("#faq  p").hide();
	$("#faq table").click(function() {
		$(this).next("p").slideToggle("fast")
				.siblings("p:visible").slideUp("fast");
		$(this).toggleClass("active")
				.siblings("tr").removeClass("active");
		});
	
	$("#btnDelete").click(function(){
		$(location).attr("href" , "/faq/delete?faqNo=${faq.faqNo}");
	})
});


</script>
<script type="text/javascript">

$(document).ready(function(){
	var result = '${result}';
	var successMsg = '${successMsg}';
	var failMsg = '${failMsg}';

	if (result == 'success') {
		alert(successMsg);
	} else if (result == 'fali') {
		alert(failMsg);
	}

	$("#sumTable").on(
// 			"click",
// 			"tr",
			function() {
// 				//클릭이벤트가 발생한 <tr>의 첫번째 <td>자식의 텍스트
				var faqNo = $(this).children("td").eq(0).text();

				$(location).attr("href",
						"/faq/list?faqNo=" + faqNo);
			});

	$("#btnSearch").click(function() {

		var searchVal = $("#searchVal").val();
		var searchTxt = $("#searchTxt").val();
				
		$(location).attr("href","/faq/list?searchVal="
								+ searchVal+"&"+"searchTxt="
								+ searchTxt);
// 		$.ajax({
// 			type: "get",
// 			url : "/faq/list",
// 			data : { searchVal : searchVal,
// 					searchTxt : searchTxt },
// 			context: document.body,
// 			success: function(data){
				
// 				$("#body").html(data);
				
// 			}, error: function(){
// 				alert("안돼");
// 			}
			
// 		});
		

	});
});

</script>



<style type="text/css">
p{
background:#f0f0f0; 
border:1px solid #ccc;
max-width: 70%;

}

#faqTable{
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
#searchBox{
	margin-left: 227px;
	display: inline-block;
	color: black;
} 

#btnWrite{
 	margin-left: 200px; 
	background-color: #848484;
	color:white;

}
 


</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<div id="faq" class="container">
	<table id="faqTable" class="table table-striped table-hover">
	<tr class="pointer" style="color:black">
					<th style="width: 10%; text-align: center;">번호</th>
					<th style="width: 45%; text-align: center;">제목</th>
					<th style="width: 20%; text-align: center;">작성자</th>
					<th style="width: 20%; text-align: center;">작성일</th>
	</tr>
 	</table> 
	<c:forEach items="${list }" var="faq">
<%-- 	<h3 style="color: black; text-align:center; font-size:medium;margin-top: 0px; margin-bottom: 0px; ">${board.noticeNo } ,&emsp;&emsp;&emsp;&emsp; ${board.title },&emsp;&emsp;&emsp;&emsp; ${board.userId } &emsp;&emsp;&emsp;&emsp;<fmt:formatDate value="${board.writtenDate }" pattern="yyyy-MM-dd"/></h3> --%> 
	<table id="sumTable" class="table table-striped table-hover">
	<tr>
		<td style="	text-align: center; width: 10%;">${faq.faqNo }</td>
		<td style="	text-align: center; width: 45%;" >${faq.question }</td>
		<td style="	text-align: center; width: 20%;">${faq.userId }</td>
		<td style="	text-align: center; width: 20%;"><fmt:formatDate value="${faq.writtenDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	
	
	</table>

	<p style="color: black; margin-left: -15px;">${faq.answer }
	<c:if test="${member.roleId eq '0' }">
	<button onclick="location.href='/faq/update?faqNo=${faq.faqNo}';">수정</button>
	<button id="btnDelete">삭제</button></p>
	</c:if>
</c:forEach>
<hr>
	<div id="searchBox" class="text-center">
			<tr>
				<td><select id="searchVal" name="searchVal" style="color: black">
						<option value="question" selected="selected">제목</option>
						<option value="answer">내용</option>
						<option value="userid">작성자</option>
				</select></td>
			</tr>
			<input type="text" id="searchTxt" name="searchTxt" />
			<button id="btnSearch"  style="border-radius:10px 0 10px 0; color: blakc;">검색</button>
			<c:if test="${member.roleId eq '0' }">
			<button id="btnWrite" onclick="location.href='/notice/write';">글쓰기</button>
			</c:if>
		</div>


</div>
</div>
<jsp:include page="../util/pagingFaq.jsp" />















