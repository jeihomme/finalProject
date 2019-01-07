<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style type="text/css">
	
	.container2{
		display:inline;
		background-color:gray;
	}
	.topleft{
		display:inline;
		width:100px;
		height:100px;
/* 		border:1px solid white; */
	}
	.back{
		padding-right:150px
	}
	.barName{
		padding-left:150px;
		text-align:center;
		font-size:38px;
	}

</style>


<div class="container1">
	<div class="back topleft" onclick="location.href= '/bar/barlist' ">뒤로가기</div>
	<div class="barName topleft"> ${view.barName }</div>
</div>

<form action="/bar/updatebarinfo" method="get">
	<div class="update">
		<p onclick="location.href='/bar/updatebarinfo?barNo=${view.barNo}'">수정하기</p>
	</div>
</form>
<div>
	<div class="calendar">
		<p onclick="location.href='/bar/calendar'">스케줄보기</p>
	</div>
	<div class="map">
		<p onclick="location.href='/bar/map'">위치보기</p>
	</div>
</div> <br><br><br><br><br>

<div id="body">
<form name="view" method="get">
<!-- 	<div id="barInfo"> -->
			
			<div id="barInfo">
				${view.barInfo }<br>
			</div>
			
			<div id="barInfo">
				${view.manager }<br>
			</div>
			
			<div id="barInfo">
				${view.barAddress}<br>
			</div>
			
			<div id="barInfo">
				${view.genreName }<br>
			</div>
		
<!-- 	</div> -->
</form>

</div><br>
<hr><br>

<div style="position: relative; height: 410px">
	<div id="map" style="width: 500px; height: 400px; float: left; width: 50%; position: relative;"></div>
	<div class="mapAddress" style="float: left; width: 50%; position: relative; padding: 0 50px;">${view.barAddress }</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f280a5fb1b3f5e14d36f3a3fe71e97eb&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript">
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
		
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);
		
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
		
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${view.barAddress}', function(result, status) {
		
				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {
		
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords
					});
		
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
</script>
</div>
<hr>
<div class="test">
	<p onclick="location.href= '/bar/barlist' "> 바 리스트로 </p>
</div>    