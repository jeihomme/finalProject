<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

.leftDiv{
/* border: 1px solid yellow; */
    width: 20%;
    height: 100%;
    display: inline-table;
    float: left;
    color: black;
}

.centerDiv{
/* border: 1px solid yellow; */
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

.divA{
	background-color: gray; 
	border-radius: 20px;
}

.photoIn{
    border-radius: 10px;
    width: 350px;
    height: 80%;
    margin-top: -22%;
    margin-left: 5%;
    position: fixed;
}

.div-common{
	display: inline-block;
	width: 100%;
}

.div-left{
    transform: translateY(-25%);
	width: 49%;
    margin: 10px;
}

.div-right{
	width: 45%;
}

.div-photo{
/* 	border: 1px solid DarkGoldenRod; */
    height: 320px;
    text-align: center;
    display: flex;
}

.div-music{
/* 	border: 1px solid Aqua; */
        margin-top: -18%;
    position: fixed;
}

.div-history{
/* 	border: 1px solid blue; */
}

.div-member{
/* 	border: 1px solid Chartreuse; */
}

.div-info{
/* 	border: 1px solid CornflowerBlue; */
}

.calendarDiv{
	display: none;
	width: 60%;
	height: 60%;
	background-color: gray;
    position: absolute; /* Stay in place */
    z-index: 1; /* Sit on top */
}

.calDiv{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

h3{
	color: black;
	font-weight: bold;
}

input[type=checkbox]{
	display:none;
}

input[type=text] {
	color: black;
	background-color: gray;
	border: none;
}

th{
	padding-left: 10px;
	padding-right: 10px;
}

.hist{
	width: 80px;
}

.mems{
	width: 80px;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	var bandNo = "${general.band.bandNo}"

	// 세션에서 barNo 가져오기
// 	var barNo = "@Request.RequestContext.HttpContext.Session['someKey']";
	
	var general = "${general}";
	var musicFile = "${general.music}";
// 	console.log(general);
	
// 	console.log("${general.music}");
	
	// 음악파일 처리
// 	window.stop();
// 	   $("#preSound").click( function() {
// 	      timerStart();
// 	      song.play();
// 	   });
	

// 	if(!musicFile){
// 		console.log("음악파일 없음");
	
// 	} else {
		
// 	var setTime = 15;      // 최초 설정 시간(기본 : 초)
// 	var song = new Audio('/resources/seong-youAreMySpring.mp3');

// 		function msg_time() {    1초씩 카운트
       
// 			m = Math.floor(setTime / 60) + "분 " + (setTime % 60) + "초";    남은 시간 계산
      
// 			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
      
// //       document.all.ViewTimer.innerHTML = msg;      // div 영역에 보여줌 
            
// 			setTime--;               // 1초씩 감소
      
// 			if (setTime < 0) {         // 시간이 종료 되었으면..
// 				song.pause();
// 				song.currentTime = 0;
// 				clearInterval(tid);
// 			}
// 		}
// 	}
   
//    function timerStart(){ 
//       tid=setInterval('msg_time()',1000);
//    }
   
  
   
   // 달력 불러오기
   $("#calendarBtn").click(function(){
	   
	    // 밴드 번호 가져오기
		var bandNo = ${general.band.bandNo };
	   
	   	var calendarDiv = document.getElementById("calendarDiv");
	   	var calDiv = document.getElementById("calDiv"); 
	    
		$.ajax({
			type: "post",
			url: "/calendar",
			data: { bandNo : bandNo } ,
			context: document.body,
			success: function(data) {
					
				// 모달 띄우기
				$("#body").html(data);

			}, error: function() {
				alert("망함");
			}
		});
		   
	   
   });
   
   // 수정버튼 조정
   
   // 수정 버튼
	$("#editBtn").click(function(){

		if($(this).html() == "수정") {
			
			$(this).html("저장");
			$("input[type=text]").attr("disabled", false);
			$("input[type=text]").css({"background-color" : "white"});
			$("input[type=text]").css({"border" : "1px solid black"});
			$("input[type=checkbox]").css({"display" : "block"});
			
			document.getElementById("rmMember").style.display="inline-block";
			document.getElementById("addMember").style.display="inline-block";
			document.getElementById("rmHistory").style.display="inline-block";
			document.getElementById("addHistory").style.display="inline-block";
			document.getElementById("addMForm").style.display="inline-block";
			document.getElementById("mP").style.display="inline-block";
			document.getElementById("mName").style.display="inline-block";
			document.getElementById("hY").style.display="inline-block";
			document.getElementById("hisInfo").style.display="inline-block";
			document.getElementById("addHForm").style.display="inline-block";
			
		} else {
			
			$(this).html("수정");
			$("input[type=text]").attr("disabled", true);
			$("input[type=text]").css({"background-color" : "gray"});
			$("input[type=text]").css({"border" : "none"});
			$("input[type=checkbox]").css({"display" : "none"});
			
			document.getElementById("rmMember").style.display="none";
			document.getElementById("addMember").style.display="none";
			document.getElementById("rmHistory").style.display="none";
			document.getElementById("addHistory").style.display="none";
			document.getElementById("addMForm").style.display="none";
			document.getElementById("mP").style.display="none";
			document.getElementById("mName").style.display="none";
			document.getElementById("hY").style.display="none";
			document.getElementById("hisInfo").style.display="none";
			document.getElementById("addHForm").style.display="none";
			
			// 수정된거 저장하기
			
// 			var year = 
			
			
// 			$.ajax({
// 				type: "get",
// 				url: "/calendar",
// 				data: { bandNo : bandNo } ,
// //		 		dataType: "html",
// 				context: document.body,
// 				success: function(data) {
						

// 				}, error: function() {
// 					alert("망함");
// 				}
// 			});
			
			
		}

	});
	   
   // History 삭제
   $("#rmHistory").click(function(){
	  
	   var $checkedHis = $("input:checkbox[name='hisChk']:checked");
	   
	   var map = $checkedHis.map(function(){
		   return $(this).val();
	   });
	   
	   var codes = map.get().join(",");
	   
	   var tr = $checkedHis.parent().parent();
	   tr.remove();
	   
	   $.ajax({
			type: "post",
			url: "/band/delHistory",
			data: { codes : codes } ,
			success: function(res) {
					
				console.log("성공");
				
			}, error: function() {
				alert("망함");
			}
		});
	   
   });
   
   // 멤버 삭제
   $("#rmMember").click(function(){
	   
	   var $checkedMem = $("input:checkbox[name='memChk']:checked");
	   
	   var map = $checkedMem.map(function(){
		   return $(this).val();
	   });
	   
	   var codes = map.get().join(",");
	   
	   var tr = $checkedMem.parent().parent();
	   tr.remove();
	   
	   $.ajax({
			type: "post",
			url: "/band/delBMember",
			data: { codes : codes } ,
			success: function(res) {
					
				console.log("성공");
				
			}, error: function() {
				alert("망함");
			}
		});
	   
   });
   
   $("#applyBtn").click(function(){

   });
   
   // 멤버 추가
   $("#addMember").click(function(){
	  var mP = $("#mP").val();
	  var mName = $("#mName").val();
	  
// 	  console.log(mP);
// 	  console.log(mName);
	  
	  $.ajax({
			type: "post",
			url: "/band/addMember",
			data: { mPosition : mP,
				bandMemName : mName,
					bandNo : bandNo } ,
			context: document.body,
			success: function(data) {
							
// 				$(first).insertBefore(second) // first 객체를 second 객체의 앞쪽에 붙인다.
				
// 				리스트에 새로 생성해서 붙이기
			
			}, error: function() {
				alert("망함");
			}
		});
   });
   
   var resumesNo = "${general.resumes.resumesNo}";
   
   $("#addHistory").click(function(){
	   
	   var hY = $("#hY").val();
	   var hisInfo = $("#hisInfo").val();
	   
	   console.log(hY);
	   console.log(hisInfo);
	   
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
	
<div class="divA">
	<!-- 왼쪽 -->
	
	<div class="div-common div-left">
		<!-- 밴드 사진 -->
		<div class="div-photo div-common">
			<img class="photoIn" src="http://${proPic.path }/${proPic.originName}" />
		</div>
	
		<!-- 음악 파일 -->
		<div class="div-music div-common">
			<h3>음악 파일</h3><br>
			<audio src="" autoplay controls>
			</audio>
		</div>
	</div>
	
	<!-- 오른쪽 -->
	<div class="div-common div-right">
		<div>
		<div class="div-history div-common">
			<table>
				<th><h3>History</h3></th>
				<th>
					<table id="div-history">
						<c:set var="histNo" value="0" />
						<c:forEach var="hist" items="${history }">
						<c:set var="histNo" value="${histNo + 1 }" />
							<tr>
								<td>
									<input type="checkbox" name="hisChk" value="${hist.historyNo }" />
								</td>
								<td> 
									<input id="${hist.historyNo }" class="hist" type="text" value="${hist.year }" disabled /> : 
									<input class="hist" type="text" value="${hist.historyInfo }" disabled />
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td id="addHForm" colspan="2" style="display:none;">
								년도 <input id="hY" class="hist" type="text" style="display:none;" disabled />
								내용 <input id="hisInfo" class="hist"  type="text" style="display:none;" disabled />
							</td>
							<td style="text-align: right;">
								<button id="addHistory" type="button" style="display:none;">추가</button>
								<button id="rmHistory" type="button" style="display:none;">삭제</button>
							</td>
						</tr>
					</table>
				</th>
			</table>
		</div>
		
		<!-- 밴드 멤버 -->
		<div class="div-member div-common">
			<table>
			<tr>
				<th><h3>Member</h3></th>
				<th>
					<table>
						<tr>
							<th></th>
							<th>포지션</th>
							<th>이름</th>
						</tr>
						
						<c:forEach var="mem" items="${member }">
						<tr>
							<td><input type="checkbox" name="memChk" value="${mem.bandMemberNo }" /></td>
							<td><input class="mems" type="text" value="${mem.mPosition }" disabled /></td>
							<td><input class="mems" type="text" value="${mem.bandMemName }" disabled /></td>
						</tr>
						</c:forEach>
						<tr>
							<td id="addMForm" colspan="2" style="display:none;">
								포지션 <input id="mP" class="mems" type="text" style="display:none;" disabled />
								이름 <input id="mName" class="mems"  type="text" style="display:none;" disabled />
							</td>
							<td style="width:100px">
								
								<button id="addMember" type="button" style="display:none;">추가</button>
								<button id="rmMember" type="button" style="display:none;">삭제</button>								
							</td>
						</tr>
					</table>
				</th>
			</tr>
			</table>
		</div>
		
		<!-- 밴드 소개 -->
		<div class="div-info div-common">
			<table>
				<tr>
					<th><h3>소개</h3></th>
				</tr>
				<tr>
<%-- 				<td><input type="text" name="bInfo" value="${resumes.bandInfo }"/></td> --%>
					<td>${resumes.bandInfo }</td>
					
				</tr>
			</table>
		</div>
		</div>
	</div>
	
</div>
<button type="button" id="applyBtn">초청하기</button>
