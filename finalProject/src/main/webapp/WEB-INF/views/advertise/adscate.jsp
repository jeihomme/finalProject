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

#subtalbe tr {
 text-align: center;
}

th, td:not(:nth-child(2)) {
	text-align: center;
}
td {

	background-color: black;
   	color: white;
}

.modal-ads {
   display: none; /* Hidden by default */
    position: absolute; /* Stay in place */
    z-index: 6; /* Sit on top */
    left: 0;
    top: 0;
    width: 60%; /* Full width */
    height: 70%; /* Full height */
    margin: auto;
    overflow: auto; /* Enable scroll if needed */
   background-color:gray;
    border-radius:20px;
/*     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ 
	margin-left: 20%;
    margin-top: 9%;



}

.modal-img{
/* 	border: 1px solid white; */
	width: 60%;
	height: 70%;
	text-align: center;
	display: inline-block;
/* 	margin-left: auto; */
/* 	margin-right: auto; */
}

.modal-music{
/* 	border: 1px solid white; */
	width: 60%;
    height: 10%;
    margin-top: 5%;

}

.modal-close{
	margin-left: 90%;

}
.modal-info{
/* 	border: 1px solid white;   */
	float: right;
    width: 40%;
    height: 100%;
}

.member-div {
 margin-left: 25%;
}

.modal-info input {

	color: black;
}


.close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

.close:hover,
.close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
input[type=text]{
	border: none;
	background-color: gray;
	color:black;
	
}


</style>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>




<div class="container">

<h1>구인구직 - LIST</h1>
<hr>


<div id="list" style="margin-left: 30%; margin-bottom: 5%;">
<form style="margin-left: -5%">

<h4><a href="/advertise/list" id="memberCk" href="adsNo">리스트</a>  /  <a href="/advertise/adscate" id="memberCk" href="adsNo"><input type="hidden" value="1"/>맴버</a>   /   <a href="/advertise/adscateCol" id="ads" href="adsNo"><input type="hidden" value="2"/>콜라보</a></h4>

</form>
</div>
<table id="advertiseTable" class="table table-striped table-hover">
<tr>
	<th style="width: 11%">번호</th>
	<th style="width: 22%">분류</th>
	<th style="width: 28%">제목</th>
	<th style="width: 24%">작성자</th>
	<th >작성일</th>
</tr>
</table>
<table id="subTable" class="table table-striped table-hover">
<c:forEach items="${list }" var="advertise">
<tr>
	<c:if test="${advertise.adsNo == 1}">
		<td style="text-align: left;">${advertise.findNo }</td>
		<td>${advertise.ads }</td>
	<td><a href="#" data-toggle="modal" class="view" id="${advertise.findNo }">${advertise.title }</a></td>
	<td>${advertise.bandName }</td>
	<td><fmt:formatDate value="${advertise.writtenDate }" pattern="yyyy-MM-dd"/></td>
	</c:if>
</tr>
</c:forEach>
</table>
<div id="searchBox" class="text-center">
	
			
				<select id="searchVal" name="searchVal" style="color: black">
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
						<option value="userid">작성자</option>
				</select>
			<input style="color:black" type="search"  id="searchTxt" name="searchTxt" />
			<button id="btnSearch">검색</button>
		</div>
</div>

<div class="modal-ads" id="advertiseView"> 
</div>
<script type="text/javascript">
function noticeBoardno(notice) {

	location.href = "/advertise/list?findNo=" + findNo;
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


			$("#btnSearch").click(
					function() {

						var searchVal = $("#searchVal").val();
						var searchTxt = $("#searchTxt").val();
						
						$(location).attr(
								"href",
								"/advertise/list?searchVal="
										+ searchVal+"&"+"searchTxt="
										+ searchTxt);

					});

		});

</script>

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
			 
				var findM = data.map.findM;
				var proPic = data.map.proPic;
				var bandMember = data.map.bandMember;
//	 			var bandgenre = data.map.bandGenre;
				var member = data.map.member;
//	 			var mem = data.map.list;
				
				console.log(data.map);
				
				$("#advertiseView").empty();
			

				$newadvertiseView = $(
						     "<div class='modal-img' ><img src='http://" + proPic.path + "/" + proPic.originName + "' width='100%' height='100%'/></div><div class='modal-info'>"
						     +"<div style='margin-left:10%; margin-top:1%;'><p>· Member</p><div class='member-div'><input type='text'style='width: 220px' value='"+bandMember.bandMemName+"'/></div>"
						     +"<div style='margin-top: 10%'><p>· Genre<input style='margin-left: 5%; width: 240px;' type='text' value='"+findM.genre+"'/></p></div>"
						     +"<div style='margin-top: 10%'><p>· Searching for<input style='margin-left: 5%; width: 195px;' value='"+findM.position+"' type='text''/></p></div>"
						     +"<div style='margin-top: 10%'><p>· Contact Number<input style='margin-left: 5%' type='text' value='"+member.contact+"' /></p></div>"
						     +"<div class='etc' style='margin-top: 10% ,'><p>· Etc.<input style='margin-left: 5%; height: 185px; width:88%;' maxlength='12' type='text' name='content' value='"+findM.content+"''/></p></div>"
						     +"</div></div>"
						     +"<audio controls class='modal-music'><source type='audio/ogg'><source type='audio/mpeg'></audio><button type='button' id='close' class='btn btn-default'>Close</button>"
						      );
				$("#advertiseView").append($newadvertiseView);
		
				
				
				
			}, error:function(){
				alert("ㅋㅋ 망함");
			}
			
		
			
		});
	});
	

	
	
// 	 $("#memberCk").click(function(){
		

		
// 		 var adsNo = $("#member").val();
			
// 			$("#subTable").empty();
// 			$.ajax({ 
// 				type: 'POST' 
// 				, url: '/advertise/adscate'
// 				, dataType : "json" 
// 				, data : {adsNo : adsNo}
// 				, success: function(data){
					
// 						var ads = data.list;
					
// 						console.log(data);
						
						
// 						$("#advertiseView").empty();
// // 						$newlist = $("<tr><th>번호</th>"+"<th>분류</th><th>제목</th><th>"
// // 								+"작성자</th><th>작성일</th>");
// // 						$("#advertiseTable").append($newlist);
				
// 						$.each(ads , function(index , advertise){
// 							$newAdvertiseTable = $("<tr><td style='width:7%'>"+advertise.findNo+"</td><td style='width:14%'>"+advertise.ads+"</td><td>"+"</td><td style='width:28%'><a href='#advertiseView' ' data-toggle='modal' class='view' id='"+advertise.findNo+"'>"+advertise.title+"</a></td><td>"
// 									+"</td><td>"+advertise.bandName+"</td><td>"+advertise.writtenDate+"</td></tr>");
							 
// 									$("#subTable").append($newAdvertiseTable);
									
// 						})

// 									$newadvertiseView = $(
// 											     "<div class='modal-img' ></div><div class='modal-info'>"
// 											     +"<div style='margin-left:10%; margin-top:1%;'><p>· Member</p><div class='member-div'><input type='text'style='width: 220px'/></div>"
// 											     +"<div style='margin-top: 10%'><p>· Genre<input style='margin-left: 5%; width: 240px;' type='text' /></p></div>"
// 											     +"<div style='margin-top: 10%'><p>· Searching for<input style='margin-left: 5%; width: 195px;' ' type='text''/></p></div>"
// 											     +"<div style='margin-top: 10%'><p>· Contact Number<input style='margin-left: 5%' type='text' ' /></p></div>"
// 											     +"<div style='margin-top: 10%'><p>· Etc.<input style='margin-left: 5%; height: 185px; width:88%;'  type='text' name='content'/></p></div>"
// 											     +"</div></div>"
// 											     +"<audio controls class='modal-music'><source type='audio/ogg'><source type='audio/mpeg'></audio><button type='button' id='close' class='btn btn-default'>Close</button>"
// 											      );
// 									$("#advertiseView").append($newadvertiseView);
							
									
					
							 
// 				}
				
// 			});	
			
		
			
		
			
// 		})	


// $("#collaboration").click(function() {
// 	var adsNo = $("#collabo").val();
	
// 	$("#subTable").empty();
// 	$.ajax({ 
// 		type: 'POST' 
// 		, url: '/advertise/adscate'
// 		, dataType : "json" 
// 		, data : {adsNo : adsNo}
// 		, success: function(data){

// 			var ads = data.list;

// // 			$newlist = $("<tr><th>번호</th>"+"<th>분류</th><th>제목</th><th>"
// // 					+"작성자</th><th>작성일</th>");
// // 			$("#advertiseTable").append($newlist);
	
// 			$.each(ads , function(index , advertise){
// 				$newAdvertiseTable = $("<tr><td style='width:7%'>"+advertise.findNo+"</td><td style='width:14%'>"+advertise.ads+"</td><td>"+"</td><td style='width:28%'>"+advertise.title+"</td><td>"
// 						+"</td><td>"+advertise.bandName+"</td><td>"+advertise.writtenDate+"</td></tr>");
			
// 						$("#subTable").append($newAdvertiseTable);
			
					
// 				})
		
// 		}
				
// })


	
// });
	 
	
	window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    } 
	
});

</script>



<jsp:include page="../util/pagingAds.jsp" />














