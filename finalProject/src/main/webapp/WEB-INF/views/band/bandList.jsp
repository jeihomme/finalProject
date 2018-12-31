<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

.img-rounded{
	border-radius:10px;
	width:76px;
	height:76px;
}

th, td{
	padding:5px;
	text-align:center;
}

a:link{
	color: blue;
}
a:hover{ 
	color: blue; 
} 
/* a:active{ */
/* 	color: green; */
/* } */

</style>

<script type="text/javascript">
$(document).ready(function(){

	var genreN = 0;
	var clicked = 0;
	var pageCount = 1;
	var counter = 0;

// 	console.log("genreNo : " + genreN);
	
	// get List By Genre
	$(".cGenre").click(function(){
		var genreN = $(this).attr("id");
		counter = 0;
		
		$.recall(genreN);
	});
	
	$.recall = function(genreN){
		
// 		console.log("genre");
// 		console.log("genreN = " + genreN);
		
		// 리스트 비우기
		$("#lists").empty();
		
		$.ajax({
			type: "get",
			url: "/band/bandByGenre",
			data: { genre : genreN } ,
			dataType: "json",
			success: function(data) {
				
				var band = data.band;
				var profile = data.profile;
// 				var genreN = data.genre;
				
// 				console.log("ajax 통신 후");
// 				console.log(genreN);
				
				$counter = 0;
				
				$.each(band, function(index1, bands){
										
					$counter = $counter + 1;
					
					$.each(profile, function(index2, profiles){
						if(bands.profileNo == profiles.profileNo){
														
							$newList = $("<td>" + "<table>" + "<tr>" + "<td>" +
												"<img class='img-rounded' src='http://" + profiles.path + "/" + profiles.originName + "' />" +
										"</td>" + "</tr>" +
										"<tr>" + "<td>" +
												"<a href='/band/bandView?bandNo=" + bands.bandNo + "'>" + bands.bandName + "</a>" +
										"</td>" + "</tr>" + "</table>" + "</td>");
							
							$("#lists").append($newList);
							
							if($counter == 8){
								$newLine = $("</tr><tr>");
								$("#lists").append($newLine);
							}
							
							
						} // end of if
					}); // end of $.each
				}); // end of $.each

				// 주희센세 힌트
// 				var div1 = $('<div class="" style="height: 100%;" id ="position_'+selectedId+'">');
// 				var div2 = $('<div class="thumbnail">');
// 				var div3 = $('<div class="caption">');
// 				var div4 = $('<div class="pfmIdx"

				// -- 실험 노트 --
				// data - 전체를 출력
				// data.HashMap - json에 저장된 HashMap을 출력
				// data.HashMap.band - json의 HashMap의 Band 리스트를 가져옴
				// data.HashMap.profile - json의 HashMap의 profile 리스트를 가져옴
				
			} // end of success
			, error: function() {
				alert("망함");
			}
		}); // end of $.ajax
	}; // end of $.recall;
	
	
	// ---------------------------------
	// 더보기 버튼 (add items)
		
	$("#plus").click(function(){
		
// 		console.log("plus");
// 		console.log("genreN = " + genreN);
		
		pageCount++;
		
// 		console.log(pageCount);
		
		$.ajax({
			type: "get",
			url: "/band/addBand",
			data: { curPage : pageCount,
					genre : genreN} ,
			dataType: "json",
			success: function(data) {
				
// 				console.log("plus Button 성공");
				
				var band = data.band;
				var profile = data.profile;
			
				$.each(band, function(index1, bands){
										
					counter = counter + 1;
// 					console.log("counter = " + counter);
					
					$.each(profile, function(index2, profiles){
						if(bands.profileNo == profiles.profileNo){
									
							$tr = document.createElement("TR");
							
							$newList = $("<td>" + "<table>" + "<tr>" + "<td>" +
												"<img class='img-rounded' src='http://" + profiles.path + "/" + profiles.originName + "' />" +
										"</td>" + "</tr>" +
										"<tr>" + "<td>" +
												"<a href='/band/bandView?bandNo=" + bands.bandNo + "'>" + bands.bandName + "</a>" +
										"</td>" + "</tr>" + "</table>" + "</td>");
							
						
							$("#lists").append($newList);
							
							if(counter == 8) {
								// new tr every 8 items
								document.getElementById("lists").appendChild($tr);
								counter = 0;
							}
							
							
						} // end of if
					}); // end of $.each(profile)
				}); // end of $.each(band)
				
			}, error: function() {
				alert("Add Items Fail");
			}
		});
		
	});
	
}); // end of document.ready
</script>

<h1>Band</h1>
<!-- 밴드 장르 -->
<div style="background-color:gray; border-radius:20px;">
	<table id="genre">
		<tr>
			<c:forEach items="${genre }" var="g">
				<th style="border: 1px solid black;"><a class="cGenre" id="${g.genreNo }" style="font-size:25px;">${g.genreName }</a></th>
			</c:forEach>
		</tr>
	</table>
</div>

<br><br>

<!-- 밴드 갤러리형식의 리스트 -->
<div style="background-color:gray; border-radius:20px; align:left;">
	<table id="lists">
	<tr>
	<c:set var="counter" value="0" />
		<c:forEach items="${band }" var="b">
		<c:set var="counter" value="${counter + 1 }" />
			<c:forEach items="${profile }" var="p">
				<c:if test="${b.profileNo eq p.profileNo }">
					<td>
						<table>
							<tr>
								<td>
									<img class="img-rounded" src="http://${p.path }/${p.originName}" />
								</td>
							</tr>
							<tr>
								<td><a href="/band/bandView?bandNo=${b.bandNo }">${b.bandName}</a></td>
							</tr>
						</table>
					</td>
				</c:if>
			</c:forEach>
		<c:if test="${counter == 8 }">
			</tr>
			<tr>
		<c:set var="counter" value="0" />
		</c:if>	
		</c:forEach>
	</tr>
	</table>
</div>
<button id="plus" style="background-color:black; border:0px;">+ 더보기</button>
