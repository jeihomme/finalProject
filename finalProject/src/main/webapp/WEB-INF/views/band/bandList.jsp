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

$(document).ready(function(){
	$(".cGenre").click(function(){
		
		// 넘겨줄 값
		var genreN = {
		    	genreN: $(this).attr("id")
		    };
		
		console.log(genreN);
		
		$.ajax({
			type: "get",
			url: "/band/bandByGenre",
			data: genreN ,
			dataType: "json",
			success: function(jsonView) {
				
				var genre = $('jsonView');
				
				console.log("성공");
				
				console.log(genre);
				
			}
			, error: function() {
				alert("망함");
			}
		});
	});
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
<div style="background-color:gray; border-radius:20px;">
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

<div id="Context"></div>
