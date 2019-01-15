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
    margin-top: 20%;



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

#btnWrite{
 	margin-left: 203px; 
	background-color: #848484;
	color:white;
	position: absolute;

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

<h4><a href="/advertise/list" id="memberCk" href="adsNo">리스트</a>  /  <a href="/advertise/adscate" id="memberCk" href="adsNo">맴버</a>   /   <a href="/advertise/adscateCol" id="collaboration" href="adsNo">콜라보</a></h4>

</form>
</div>
<table id="advertiseTable" class="table table-striped table-hover">
<tr>
	<th style="width: 14%">번호</th>
	<th style="width: 19%">분류</th>
	<th style="width: 24%">제목</th>
	<th style="width: 26%">작성자</th>
	<th >작성일</th>
</tr>
</table>
<table id="subTable" class="table table-striped table-hover">
<c:forEach items="${list }" var="advertise">
<tr>
		<td style="text-align: left;">${advertise.findNo }</td>
		<td style="text-align: center;">${advertise.ads }</td>
	<td style="text-align: center;"><a href="#" data-toggle="modal" class="view" id="${advertise.findNo }">${advertise.title }</a></td>
	<td style="text-align: center;">${advertise.bandName }</td>
	<td style="text-align: center;"><fmt:formatDate value="${advertise.writtenDate }" pattern="yyyy-MM-dd"/></td>

</tr>
</c:forEach>

</table>

<div id="searchBox" class="text-center" style="margin-right: 35%">
			<select id="searchVal" name="searchVal" style="color: black">
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
						<option value="userid">작성자</option>
				</select>
			<input style="color:black" type="search"  id="searchTxt" name="searchTxt" />
			<button id="btnSearch">검색</button>
			<c:if test="${member.roleId eq '2'}">
				<button id="btnWrite" onclick="location.href='/advertise/write'">글쓰기</button>
			</c:if>
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
	 			var band = data.map.band;
				var member = data.map.member;
				var part = data.map.part;
				var genre = data.map.genre;
				
				console.log(data.map);
				
				$("#advertiseView").empty();
				
				
				$newadvertiseView = $(
						     "<div class='modal-img' ><img src='../resources/" + proPic.originName + "' width='100%' height='100%'/></div><div class='modal-info'>"
						     +"<div style='margin-top: 10%'><p>· BandName<input style='margin-left: 5%; width: 240px;' type='text' value='"+band.bandName+"'/></p></div>"
						     +"<div style='margin-top: 10%'><p>· Genre<input style='margin-left: 5%; width: 240px;' type='text' value='"+genre.genreName+"'/></p></div>"
						     +"<div style='margin-top: 10%'><p>· Searching for<input style='margin-left: 5%; width: 195px;' value='"+part.pTitle+"' type='text''/></p></div>"
						     +"<div style='margin-top: 10%'><p>· Contact Number<input style='margin-left: 5%' type='text' value='"+member.contact+"' /></p></div>"
						     +"<div class='etc' style='margin-top: 8% '><p>· Etc.<input style='margin-left: 5%; height: 185px; width:88%;' maxlength='12' type='text' name='content' value='"+findM.content+"''/></p></div>"
						     +"</div></div>"
						     +"<audio controls class='modal-music'><source type='audio/ogg'><source type='audio/mpeg'></audio><button onclick='javascript:doUpdate("+findM.findNo+");' type='button' id='btnUpdate' class='btn btn-default'>Update</button>"
						     +"<button onclick='javascript:doClose();' type='button' id='close' class='btn btn-default'>Close</button><button type='button' id='Delete' onclick='javascript:doDelete("+findM.findNo+");' class='btn btn-default'>DELETE</button>"
						      );
				$("#advertiseView").append($newadvertiseView);
		
				
				
				
			}, error:function(){
				alert("ㅋㅋ 망함");
			}
			
		
			
		});
	});
	

	
	

	
	window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    } 
	
});

	
</script>
<script type="text/javascript">
	function doUpdate(findNo){
	
		location.href="/advertise/update?findNo="+findNo+"";
	}
	function doClose(){
	    $(".modal-ads").css("display", "none");
//	     alert('AAA');
	}
	function doDelete(findNo){
		location.href="/advertise/delete?findNo="+findNo+"";
	}
	// 음악파일 타이머
	
	

</script>
<jsp:include page="../util/pagingAds.jsp" />














