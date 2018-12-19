<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">


	 function FaqToggleDetail ( id ){
			var latestToggleObj = null;
			var oObj = document.getElementById( id );	

			if( this.latestToggleObj != null ){
				this.latestToggleObj.className = (this.latestToggleObj.className + " none");
			}
			if( this.latestToggleObj == oObj ){
				this.latestToggleObj = null;
				return;
			}
			this.latestToggleObj = null;

			if( oObj.className.indexOf( "none" ) != -1 ){
				oObj.className = oObj.className.replace( "none", "" );			
			}else{
				oObj.className = (oObj.className + " none");
			}
			this.latestToggleObj = oObj;
		 }
	 



</script>



<style type="text/css">

#noticeTable{
	max-width: 70%;
	margin-left: -15px;
/* 	border-bottom: 1px solid white; */


}
.none{ 
display:none; 
border-bottom: 1px solid white;

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
	<th style="	text-align: center;" >번호</th>
	<th style="	text-align: center;">제목</th>
	<th style="	text-align: center;">작성자</th>
	<th style="	text-align: center;">작성일</th>
</tr>

<c:forEach items="${list }" var="board">
<tr  class="pointer" onclick="onclick=FaqToggleDetail( '${board.noticeNo}' )" >
	<td>${board.noticeNo }</td>
	<td><span>${board.title }</span></td>
	<td>${board.userId }</td>
	<td><fmt:formatDate value="${board.writtenDate }" pattern="yyyy-MM-dd"/></td>
	
</tr>
<tr>
<td class="none" id="${board.noticeNo}" >
	${board.content }
	<td>
</tr>

	

</c:forEach>

</table>

<button id="btnWrite" onclick="location.href='/notice/write';" >글쓰기</button>

</div>
<jsp:include page="../util/paging.jsp" />















