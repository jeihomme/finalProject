<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">

#advertiseTable{
	max-width: 70%;
	margin-left: -15px;
	border-bottom: 1px solid white;
	color: black;
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
	margin-left: 64%;
	background-color: #848484;
	color:white;
}


 

 th {

	text-align: left;
}

 td {
    text-align: left;
    background-color: black;
    color: white;
    
    
  }
 


</style>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>




<div class="container">

<h1>구인구직 - LIST</h1>
<hr>


<div id="list" style="margin-left: 30%; margin-bottom: 5%;">
<form>
<h4><a href="#" id="memberCk" href="adsNo"><input type="hidden" id="member" value="1">맴버</a>   /   <a href="#" id="collaboration" href="adsNo"> <input type="hidden" id="collabo" value="2"/>콜라보</a></h4>

</form>
</div>
<table id="advertiseTable" class="table table-striped table-hover">
<tr>
	<th>번호</th>
	<th>분류</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
<c:forEach items="${list }" var="advertise">
<tr>
	<c:if test="${advertise.findNo != null}">
		<td>${advertise.findNo }</td>
	</c:if>
	<c:if test="${advertise.ads != null}">
		<td>${advertise.ads }</td>
	
	<td>${advertise.title }</td>
	<td>${advertise.bandName }</td>
	<td><fmt:formatDate value="${advertise.writtenDate }" pattern="yyyy-MM-dd"/></td>
	</c:if>
</tr>
</c:forEach>
</table>

</div>
<script type="text/javascript">
$(document).ready(function(){
// $("#member").click(function() {
	
	
	 $("#memberCk").click(function(){
		
		 var date = "<fmt:formatDate value="${advertise.writtenDate }" pattern="yyyy-MM-dd"/>";
			
		 var adsNo = $("#member").val();
			
			$("#advertiseTable").empty();
			$.ajax({ 
				type: 'GET' 
				, url: '/advertise/view'
				, dataType : "json" 
				, data : {adsNo : adsNo}
				, success: function(data){
						
						
						var ads = data.list;
					
						
	
						$newlist = $("<tr><th>번호</th>"+"<th>분류</th><th>제목</th><th>"
								+"작성자</th><th>작성일</th>");
						$("#advertiseTable").append($newlist);
				
						$.each(ads , function(index , advertise){
							$newAdvertiseTable = $("<tr><td>"+advertise.findNo+"</td><td>"+advertise.ads+"</td><td>"+"</td><td>"+advertise.title+"</td><td>"
									+"</td><td>"+advertise.bandName+"</td><td>"+advertise.ads+"</td>"
									+"<td>"+date+advertise.writtenDate+"</td></tr>");
						
									$("#advertiseTable").append($newAdvertiseTable);
							})
					
					}
			
				
			});	
		
		
			
		})	


$("#collaboration").click(function() {
	var adsNo = $("#collabo").val();
	
	$("#advertiseTable").empty();
	$.ajax({ 
		type: 'GET' 
		, url: '/advertise/view'
		, dataType : "json" 
		, data : {adsNo : adsNo}
		, success: function(data){

			var ads = data.list;

			$newlist = $("<tr><th>번호</th>"+"<th>분류</th><th>제목</th><th>"
					+"작성자</th><th>작성일</th>");
			$("#advertiseTable").append($newlist);
	
			$.each(ads , function(index , collabo){
				$newAdvertiseTable = $("<tr><td>"+collabo.findNo+"</td><td>"+collabo.ads+"</td><td>"+"</td><td>"+advertise.title+"</td><td>"
						+"</td><td>"+collabo.bandName+"</td><td>"+collabo.ads+"</td>"
						+"<td>"+date+collabo.writtenDate+"</td></tr>");
			
						$("#advertiseTable").append($newAdvertiseTable);
				})
		
		}
				
})

});
	
});

</script>

<jsp:include page="../util/paging.jsp" />














