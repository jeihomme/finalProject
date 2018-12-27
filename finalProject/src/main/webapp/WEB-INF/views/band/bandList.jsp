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
		
		$.recalll(genreN);
	});
	
	$.recalll = function(genreN){
		
		console.log(genreN);
		
		// 리스트 비우기
		$("#lists").find("table").each(function(){
			$(this).remove();
		});
		
		$.ajax({
			type: "get",
			url: "/band/bandByGenre",
			data: { genre : genreN } ,
			dataType: "json",
			success: function(data) {
				
				var all = $(data.hashMap);
				var band = $(all.band[0]);
				var profile = $(all.profile);
				
				console.log(band);
				console.log(band.bandName);
				
				$.each(band,function(key,value){
					
				});
				
				// 주희센세 힌트
// 				var div1 = $('<div class="" style="height: 100%;" id ="position_'+selectedId+'">');
// 				var div2 = $('<div class="thumbnail">');
// 				var div3 = $('<div class="caption">');
// 				var div4 = $('<div class="pfmIdx" id='+selectedId+'>');
				
				// 성공 여부 확인
// 				console.log("성공");
				
				// ---- 테스트용 ----
// 				var parent = document.getElementById("Context");
// 				var newNode = document.createElement("p");
								
// 				var testBand = JSON.stringify(data.hashMap.band);
// 				var band = JSON.stringify(data.hashMap.band);
// 				parent.innerHTML = band;
// 				parent.appendChild(newNode);
// 				parent.appendChild(mav);
				
				
				// ---- 테스트 기반으로 실험 ----
// 				var band = JSON.stringify(data.hashMap.band); // json 데이터 받아옴
// 				band = $("band");
// 				console.log(band); // json 데이터 찍기
// 				document.innerHTML = band; // json 데이터 적용
				
// 				var apply = document.getElementById("lists");
// 				parent.innerHTML = data.hashMap;
				
				
				// ---- 또 다른 실험 ----
// 				console.log("");
				
// 				var test = data.hashMap;
// 				console.log(test);
// 				document.ge3tElementById("lists").innerHTML = test[0];
// 				console.log("");
				
// 				var band = test.band[0];
// 				console.log(band);
// 				document.getElementById("lists").innerHTML = band;
// 				console.log("");
				
// 				var profile = test.profile[0];
// 				console.log(profile);
// 				document.getElementById("lists").innerHTML = profile;
// 				console.log("");
				
// 				document.innerHTML = test.band;
// 				console.log(test.band);
				
// 				var test1 = data.hashMap.band;
// 				console.log(test1);
				
				document.getElementById("lists").innerHTML = data.hashMap.band;
				
				// -- 실험 노트 --
				// data - 전체를 출력
				// data.HashMap - json에 저장된 HashMap을 출력
				// data.HashMap.band - json의 HashMap의 Band 리스트를 가져옴
				// data.HashMap.profile - json의 HashMap의 profile 리스트를 가져옴
				

				
			}
			, error: function() {
				alert("망함");
			}
		});
	};
});

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
<div id="lists" style="background-color:gray; border-radius:20px;">
	
	<table>
		<c:forEach items="${band }" var="b">
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
								<td><a href="/band/bandView?bandNo=${b.bandNo }">${b.bandNo}, ${b.bandName}</a></td>
							</tr>
						</table>
					</td>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
</div>
<button style="background-color:black; border:0px; align:right;">+ 더보기</button>

