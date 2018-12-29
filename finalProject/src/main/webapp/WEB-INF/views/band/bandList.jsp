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
	color: red;
}
a:hover{
	color: blue;
}
a:active{
	color: green;
}

</style>

<script type="text/javascript">

var genreN = 0;
var clicked = 0;

console.log(genreN);

$(document).ready(function(){
	
	$(".cGenre").click(function(){
		var genreN = $(this).attr("id");
		
		$.recall(genreN);
	});
	
	$.recall = function(genreN){
		
// 		console.log(genreN);
		
		// 리스트 비우기
		$("#lists").empty();
		
		$.ajax({
			type: "get",
			url: "/band/bandByGenre",
			data: { genre : genreN } ,
			dataType: "json",
			success: function(data) {
				
				var all = data.hashMap;
				var band = all.band;
				var profile = all.profile;

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
}); // end of document.ready
</script>

<h1>Band</h1>
<!-- 밴드 장르 -->
<div style="background-color:gray; border-radius:20px;">
	<table id="genre">
		<tr>
			<c:forEach items="${genre }" var="g">
				<th style="border: 1px solid red;"><a class="cGenre" id="${g.genreNo }" style="font-size:25px;">${g.genreName }</a></th>
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
<div>
<button id="plus" style="background-color:black; border:0px; float:right;">+ 더보기</button>
</div>
