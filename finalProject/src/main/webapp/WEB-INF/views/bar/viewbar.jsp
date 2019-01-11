<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<style type="text/css">
	
	.back{
/* 		width: 20%; */
	    height: 100%;
	    display: inline-table;
	    float: left;
	    color: black;
	    margin-top: 15px;
	}
	.barName{
		width: 75%;
	    height: 100%;
	    display: inline-table;
	    position: relative;
	    float: left;
/* 	    margin-left: 10%; */
	    text-align: center;
	    font-size: 38px;
	}
	.modify{
/* 		width: 20%; */
	    height: 100%;
/* 	    display: inline-table; */
	    position: relative;
	    float: left;
/* 	    margin-left: 10%; */
/* 	    text-align: right; */
	    color: black;
	    margin-top: 15px;
	}
	
	.calendar{
		position: relative;
  		float: left;
  	 	margin-top: 15px;
	}
	
	.barImg{
		width: 400px;
		position: relative;
		float: left;
		margin-right: 25px;
	}
	
	.barInfo{
		position: relative;
		float: left;
	}
	
	.barGenre{
		position: relative;
		float: left;
		margin-right: 100px;
	}
	#map{
		width: 500px; 
		height: 400px; 
		float: left; 
		width: 50%; 
		position: relative;
	}
	.mapAddress{
		float: left; 
		width: 50%; 
		position: relative; 
		padding: 0 25px;
	}

</style>


<div class="back"><input type="button" onclick="location.href= '/bar/barlist'" value="<Prep"></div>

<div class="barName"> ${view.barName }</div>

<form action="/bar/updatebarinfo" method="get">
	<div class="modify"><input type="button" onclick="location.href='/bar/updatebarinfo?barNo=${view.barNo}'" value="Modify"></div>
</form>

<div class="calendar"><input type="button" onclick="location.href='/bar/calendar'" value="Calendar"></div><br><br><br><hr>

<div class="barImg"><img class="barImg" src="http://${view.path }/${view.originName }"></div>

<div id="barInformation">
<form name="view" method="get">
<!-- 	<div id="barInfo"> -->
			
			<div id="barInfo">
				<h3>Information</h3>
				${view.barInfo }<br>
			</div>
			
			<div id="barInfo">
				<h3>Manager</h3>
				${view.manager }<br>
			</div>
			
			<div class="barGenre">
				<h3>Genre</h3>
				${view.genreName }<br>
			</div>
			
			<div class="barContact">
				<h3>Bar Contact</h3>
				${contact }<br>
			</div>
		
<!-- 	</div> -->
</form>

</div><br><br>
<hr><br>

<div style="position: relative; height: 410px">
	<div id="map"></div>
	<div class="mapAddress">
		<h3>Bar Address</h3><br>
		${view.barAddress }
	</div>
	
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
	<p onclick="location.href= '/bar/barlist' "> Bar List </p>
</div>    