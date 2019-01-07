<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

.img-view{
	border-radius:10px;
}
.img-thumb{
	border-radius:10px;
	width:110px;
	height:110px;
}

th, td{
	padding:5px;
	text-align:center;
}
a{
	cursor: pointer;
}
a:hover{ 
	color: black; 
} 

/* view 모달 */
.modal {
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 40%; /* Full width */
    height: 40%; /* Full height */
    margin: auto;
    overflow: auto; /* Enable scroll if needed */
	background-color:gray;
    border-radius:20px;
/*     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
    
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on screen size */                          
}

</style>

<script type="text/javascript">
$(document).ready(function(){

	// 장르 번호
	var genreN = 0;
	// 페이징 처리
	var pageCount = 1;
	
	// 각 밴드 출력 카운터
	var counter = 0;
	
	// 로딩 시 더보기 버튼 유무 확인
	var viewPlus = 1;

// 	console.log("genreNo : " + genreN);
	
	// get List By Genre
	$(".cGenre").click(function(){
		var genreN = $(this).attr("id");
		counter = 0;
		pageCount = 1;
		
		$.recall(genreN);
	});
	
	$.recall = function(genreN){
		
// 		console.log("genre");
// 		console.log("genreN = " + genreN);
		
		$.ajax({
			type: "get",
			url: "/band/bandByGenre",
			data: { genre : genreN } ,
			dataType: "json",
			success: function(data) {
				
				// 리스트 비우기
				$("#lists").empty();
				
				var band = data.band;
				var profile = data.profile;
				
				// 장르 선택시 초기화
				counter = 0;
				viewPlus = 1;
				
				$.each(band, function(index1, bands){
										
					counter = counter + 1;
					
					// 더보기 버튼 체크
					viewPlus = viewPlus + 1;
					
					console.log("viewPlus: " + viewPlus);
					
					
					$.each(profile, function(index2, profiles){
						if(bands.profileNo == profiles.profileNo){
														
							$newList = $("<td><table><tr><td>" +
											"<img class='img-thumb' src='http://" + profiles.path + "/" + profiles.originName + "' />" +
										"</td></tr>" +
										"<tr><td>" +
// 											"<a href='/band/bandView?bandNo=" + bands.bandNo + "'>" + bands.bandName + "</a>" +
										"<a class='bandView' id='" + bands.bandNo + "'>" + bands.bandName + "</a>" +
										"</td></tr></table></td>");
							
							$("#lists").append($newList);
							
							if(counter == 8){
								$newLine = $("</tr><tr>");
								$("#lists").append($newLine);
							}
							
						} // end of if
					}); // end of $.each
				}); // end of $.each

				if(viewPlus < 17) {
					$("#plus").hide();
				} else {
					$("#plus").show();
				}
				
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
		
		pageCount++; // 되나?
		
		$.ajax({
			type: "get",
			url: "/band/addBand",
			data: { curPage : pageCount,
					genre : genreN} ,
			dataType: "json",
			success: function(data) {
				
				var band = data.band;
				var profile = data.profile;
			
				viewPlus = 1;
				counter = 0;
				
				$.each(band, function(index1, bands){
										
					counter = counter + 1;
					
					// 더보기 버튼 체크
					viewPlus = viewPlus + 1;
					
					$.each(profile, function(index2, profiles){
						if(bands.profileNo == profiles.profileNo){
										
							$newTR = document.createElement("TR");
							
							$newList = $("<td>" + "<table>" + "<tr>" + "<td>" +
												"<img class='img-thumb' src='http://" + profiles.path + "/" + profiles.originName + "' />" +
										"</td>" + "</tr>" +
										"<tr>" + "<td>" +
// 												"<a href='/band/bandView?bandNo=" + bands.bandNo + "'>" + bands.bandName + "</a>" +
										"<a class='bandView' id='" + bands.bandNo + "'>" + bands.bandName + "</a>" +
										"</td>" + "</tr>" + "</table>" + "</td>");
							
							if(counter == 1) {
								$("#lists").append($newTR);
								$("#lists").append($newList);
								
							} else {
								$("#lists").append($newList);
							}
							
							if(counter == 8) {
								// new tr every 8 items
								$tr.appendChild($newList);
								document.getElementById("lists").appendChild($tr);
								counter = 0;
							}
							
							
						} // end of if
					}); // end of $.each(profile)
				}); // end of $.each(band)
				
				if(viewPlus < 17) {
					$("#plus").hide();
				} else {
					$("#plus").show();
				}
				
			}, error: function() {
				alert("Add Items Fail");
			}
		});
		
	});
	
	
	// 모달 띄우기
	var modal = document.getElementById("viewModal");
	
	$(".bandView").click(function(){
		
		// bandNo 가져오기
		var bandNo = $(this).attr("id");
		console.log("bandNO = " + bandNo);
		
		$.ajax({
			type: "get",
			url: "/band/bandView",
			data: { bandNo : bandNo },
			dataType: "json",
			success: function(data) {
				
				// 숨겨진 모달 보여주기
				modal.style.display = "block";
				
				// 참조
				// http://carami.tistory.com/61
				
				// 데이터 받아오기
				var band = data.general.band;
				var music = data.general.music;
				var proPic = data.general.proPic;
				var resumes = data.general.resumes;
				var member = data.general.member;
				
				if(member != undefined){
					console.log(member);
				}
				
				$("#viewModal").empty();
				
				// 사진
				$proPics = $("<div style='float: left; margin: 15px;'>" +
						"<img class='img-view' src='http://" + proPic.path + "/" + proPic.originName + "' />" +
						"</div>");
				
				$("#viewModal").append($proPics);

				// 음악파일
				
				
			}, error: function() {
				alert("band View Failed");
			}
		});
		
	});
	
	window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

}); // end of document.ready
</script>

<div id="backgroundss">
<h1 style="text-align:center;">Band</h1>
<!-- 밴드 장르 -->
<div style="background-color:gray; border-radius:20px;">
	<table id="genre">
		<tr>
			<th style="font-size:25px; color:black;">Genre</th>
			<c:forEach items="${genre }" var="g">
				<th style="border: 1px solid black;"><a class="cGenre" id="${g.genreNo }" style="font-size:25px;">${g.genreName }</a></th>
			</c:forEach>
		</tr>
	</table>
</div>

<br><br>
<c:set var="itemCounts" value="0" />
<!-- 밴드 갤러리형식의 리스트 -->
<div style="background-color:gray; border-radius:20px; align:left;">
	<table id="lists">
	<tr>
	<c:set var="counter" value="0" />
		<c:forEach items="${band }" var="b">
		<c:set var="counter" value="${counter + 1 }" />
		<c:set var="plus" value="${itemCounts + 1 }" />
			<c:forEach items="${profile }" var="p">
				<c:if test="${b.profileNo eq p.profileNo }">
					<td>
						<table>
							<tr>
								<td>
									<img class="img-thumb" src="http://${p.path }/${p.originName}" />
								</td>
							</tr>
							<tr>
								<td><a class="bandView" id="${b.bandNo }">${b.bandName}</a></td>
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
<c:choose>
	<c:when test="${itemCounts lt 16 }">
		<button id="plus" style=" visibility:hidden; display:block; background-color:black; border:0px;">+ 더보기</button>
	</c:when>
	<c:otherwise>
		<button id="plus" style="visibility:visible; display:none; background-color:black; border:0px;">+ 더보기</button>
	</c:otherwise>
</c:choose>

 
<!-- 밴드 상세보기 -->
<!-- 모달 띄우기 -->
<div id="viewModal" class="modal"></div>

</div>
