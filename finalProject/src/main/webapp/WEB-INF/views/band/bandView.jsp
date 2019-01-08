<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

.leftDiv{
border: 1px solid yellow;
    width: 20%;
    height: 100%;
    display: inline-table;
    float: left;
    color: black;
}

.centerDiv{
border: 1px solid yellow;
    width: 40%;
    height: 100%;
    display: inline-table;
    float: center;
    margin-left: 10%;
    text-align: center;
}

.rightDiv{
/* border: 1px solid yellow; */
    width: 20%;
    height: 100%;
    display: inline-table;
    float: right;
    margin-left: 10%;
    text-align: right;
    color: black;
}

/* div Content/Box */
.div-Vcontent {
border: 1px solid blue;
	background-color: gray;
    padding: 10px;
    width: 50%;
}

.photoIn{
	border-radius: 10px;
	width: 350px;
	height: 320px;
}

.div-common{
	display: inline-block;
}

.div-photo{
	border: 1px solid DarkGoldenRod;
	width: 350px;
	height: 320px;
}

.div-music{
	border: 1px solid Aqua;
}

.div-history{
	border: 1px solid blue;
}

.div-member{
	border: 1px solid Chartreuse;
}

.div-info{
	border: 1px solid CornflowerBlue;
}

.calendarDiv{
	display: none;
	width: 60%;
	height: 60%;
	background-color: gray;
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
}

.calDiv{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	var general = "${general}";
	var musicFile = "${general.music}";
// 	console.log(general);
	
	console.log("${general.music}");
	
	// 음악파일
	window.stop();
	   $("#preSound").click( function() {
	      timerStart();
	      song.play();
	   });
	

	if(!musicFile){
		console.log("음악파일 없음");
	
	} else {
		
	var setTime = 15;      // 최초 설정 시간(기본 : 초)
	var song = new Audio('/resources/seong-youAreMySpring.mp3');

		function msg_time() {   // 1초씩 카운트
       
			m = Math.floor(setTime / 60) + "분 " + (setTime % 60) + "초";   // 남은 시간 계산
      
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
      
//       document.all.ViewTimer.innerHTML = msg;      // div 영역에 보여줌 
            
			setTime--;               // 1초씩 감소
      
			if (setTime < 0) {         // 시간이 종료 되었으면..
				song.pause();
				song.currentTime = 0;
				clearInterval(tid);
			}
		}
	}
   
   function timerStart(){ 
      tid=setInterval('msg_time()',1000);
   }
   
   var count = 0;
   
   // 달력 불러오기
   $("#calendarBtn").click(function(){
	   
	   // 밴드 번호 가져오기
	   var bandNo = ${general.band.bandNo };
	   
	   var calendarDiv = document.getElementById("calendarDiv");
	   var calDiv = document.getElementById("calDiv"); 
	   // 모달 보이기
	   
	   calendarDiv.style.display = "block";
	   
	   if(count==0) {
		   console.log("ㅅㅂ");
		   count += 1;
	   } else if(count == 1) {
		   console.log("ㅡ   ㅓ");
		   count += 1;
	   } else if(count == 2) {
		   console.log("ㅇㅁ");
		   count = 0;
	   }
	   
	   $.ajax({
		   type: "get",
			url: "/calendar",
			data: { bandNo : bandNo } ,
// 			dataType: "html",
			context: document.body,
			success: function(data) {
				
				document.getElementById("calendarDiv").style.display = "block";

				console.log(data);
// 				$("#calDiv").html(data);
				
			}, error: function() {
				alert("망함");
			}
	   });
	   
   });
});
</script>


<c:set var="proPic" value="${general.proPic }" />
<c:set var="resumes" value="${general.resumes }" />
<c:set var="music" value="${general.music }" />
<c:set var="member" value="${general.member }" />
<c:set var="history" value="${general.history }" />

<!-- 뷰의 헤더부분 -->
	<div class="leftDiv"><input type="button" value="<Prev" onclick="history.back(-1);" /></div>
	<div class="centerDiv"><font style="font-size:25px;">${general.band.bandName }</font></div>
	<div class="rightDiv">
		<button id="editBtn" style="height:30px;" class="right" type="button">수정</button>
		<button id="calendarBtn" style="height:30px;" class="right" type="button">달력</button>
	</div>
	
<div style="background-color:gray; border-radius:20px;">
	<!-- 밴드 사진 -->
	<div class="div-photo">
		<img class="photoIn" src="http://${proPic.path }/${proPic.originName}" />
	</div>
	
	<!-- 음악 파일 -->
	<div class="div-music">
		<h3>음악 파일</h3>
		<audio src="C:\Users\trtl4\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\finalProject\resources\Front_Porch_Blues.mp3" autoplay controls>
		</audio><br>
		music Info<br>
		musicNo: ${music.musicNo }<br>
		musicTitle: ${music.musicTitle }<br>
		Path: ${music.path }<br>
	</div>
	
	<!-- 밴드 History -->
	<div class="div-history">
		<table>
			<th>History</th>
			<th>
				<table>
					<tr>
						<th>년도</th>
						<th>내용</th>
					</tr>
					
					<c:forEach var="hist" items="${history }">
						<tr>
							<td>${hist.year }</td>
							<td>${hist.historyInfo }</td>
						</tr>
					</c:forEach>
					
				</table>
			</th>
		</table>
	</div>
	
	<!-- 밴드 멤버 -->
	<div class="div-member">
		<table>
			<th>Member</th>
			<th>
				<table>
					<tr>
						<th>이름</th>
						<th>포지션</th>
					</tr>
					
					<c:forEach var="mem" items="${member }">
						<tr>
							<td>${mem.bandMemName }</td>
							<td>${mem.mPosition }</td>
						</tr>
					</c:forEach>
					
				</table>
			</th>
		</table>
	</div>
	
	<!-- 밴드 소개 -->
	<div class="div-info">
		<table>
			<tr>
				<th><h3>소개</h3></th>
				<td>${resumes.bandInfo }</td>
			</tr>
		</table>
	</div>
</div>
<div id="calendarDiv" class="calendarDiv">
	<div id="calDiv" class="calDiv"></div>
</div>
