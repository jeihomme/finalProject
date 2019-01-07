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

#subTable{
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
th, td:not(:nth-child(2)) {
	text-align: center;
}
td {

	background-color: black;
   	color: white;
}

.modal {
   display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 60%; /* Full width */
    height: 60%; /* Full height */
    margin: auto;
    overflow: auto; /* Enable scroll if needed */
   background-color:gray;
    border-radius:20px;
/*     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ 

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
	<th style="width: 11%">번호</th>
	<th style="width: 24%">분류</th>
	<th style="width: 26%">제목</th>
	<th style="width: 23%">작성자</th>
	<th >작성일</th>
</tr>
</table>
<table id="subTable" class="table table-striped table-hover">
<c:forEach items="${list }" var="advertise">
<tr>
	<c:if test="${advertise.findNo != null}">
		<td>${advertise.findNo }</td>
	</c:if>
	<c:if test="${advertise.ads != null}">
		<td>${advertise.ads }</td>
	
	<td><a href="#" data-toggle="modal" class="view" id="${advertise.findNo }">${advertise.title }</a></td>
	<td>${advertise.bandName }</td>
	<td><fmt:formatDate value="${advertise.writtenDate }" pattern="yyyy-MM-dd"/></td>
	</c:if>
</tr>
</c:forEach>
</table>


</div>

<div class="modal" id="advertiseView"> 
</div>


<script type="text/javascript">
$(document).ready(function(){
// $("#member").click(function() {
	var modal = document.getElementById("advertiseView");
	

	$(".view").click(function() {
	var findNo = $(this).attr("id");
	
	
	
	console.log("findNo =" + findNo);
	
	$.ajax({ 
		type: 'GET' 
		, url: '/advertise/view'
		, dataType : "json" 
		, data : {findNo : findNo}
		, success: function(data){

			
			   modal.style.display = "block";
				
// // 			var bandName = data.general.bandName;
// 			var position = data.general.position;
// 			var title = data.general.title;
// 			var content = data.general.content;
// 			var genre = data.general.genre;
// 			var ads = data.general.ads;
			
			$("#advertiseView").empty();
			
			$newadvertiseView = $('<div></div>');
			
			
			$("#advertiseView").append($newadvertiseView);
			
		}
				})
	})

	

	
	
	 $("#memberCk").click(function(){
		
		 var date = "<fmt:formatDate value="${advertise.writtenDate }" pattern="yyyy-MM-dd"/>";
		
		 var adsNo = $("#member").val();
			
			$("#subTable").empty();
			$.ajax({ 
				type: 'POST' 
				, url: '/advertise/list'
				, dataType : "json" 
				, data : {adsNo : adsNo}
				, success: function(data){
						
						
						var ads = data.list;
					
						console.log(data.list);
						
					
// 						$newlist = $("<tr><th>번호</th>"+"<th>분류</th><th>제목</th><th>"
// 								+"작성자</th><th>작성일</th>");
// 						$("#advertiseTable").append($newlist);
				
						$.each(ads , function(index , advertise){
							$newAdvertiseTable = $("<tr><td style='width:7%'>"+advertise.findNo+"</td><td style='width:14%'>"+advertise.ads+"</td><td>"+"</td><td style='width:28%'><a href='#' data-toggle='modal' class='view' id='"+advertise.findNo+"'>"+advertise.title+"</a></td><td>"
									+"</td><td>"+advertise.bandName+"</td><td>"+advertise.writtenDate+"</td></tr>");
							 
									$("#subTable").append($newAdvertiseTable);
									
									
							})
							 
					}
			
				
			});	
			
		
			
		
			
		})	


$("#collaboration").click(function() {
	var adsNo = $("#collabo").val();
	
	$("#subTable").empty();
	$.ajax({ 
		type: 'POST' 
		, url: '/advertise/list'
		, dataType : "json" 
		, data : {adsNo : adsNo}
		, success: function(data){

			var ads = data.list;

// 			$newlist = $("<tr><th>번호</th>"+"<th>분류</th><th>제목</th><th>"
// 					+"작성자</th><th>작성일</th>");
// 			$("#advertiseTable").append($newlist);
	
			$.each(ads , function(index , advertise){
				$newAdvertiseTable = $("<tr><td style='width:7%'>"+advertise.findNo+"</td><td style='width:14%'>"+advertise.ads+"</td><td>"+"</td><td style='width:28%'>"+advertise.title+"</td><td>"
						+"</td><td>"+advertise.bandName+"</td><td>"+advertise.writtenDate+"</td></tr>");
			
						$("#subTable").append($newAdvertiseTable);
			
					
				})
		
		}
				
})


	
});
	
	window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    } 
	
});

</script>



<jsp:include page="../util/paging.jsp" />














