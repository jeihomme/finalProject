<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	display: table-cell;
}

.div-left{
	width: 49%;
    height: 100%;
    
    padding: 10px;
/*     margin-top: 26%; */
}

.div-right{
	width: 45%;
	height: 100%;
	padding: 10px;
/* 	vertical-align: middle; */
}

.photoIn{
    border-radius: 10px;
    width: 100%;
    height: 100%;
    
/*     margin-top: -22%; */
/*     margin-left: 5%; */
    
}

.div-common{
  	display: inline-block;
  	    position: inherit;
}

.div-photo{
/* 	border: 1px solid DarkGoldenRod; */
    height: 320px;
    text-align: center;
    position: inherit;
    
    
}

.div-music{
/* 	border: 1px solid Aqua; */
     margin-top: 20%;
   
}

.div-history{
/* 	border: 1px solid blue; */
}

.div-member{
    margin-top: 15%;
    position: inherit;
    padding-right: 50px;
}

.div-info{
/* 	border: 1px solid CornflowerBlue; */
    margin-top: 10%;
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
	padding-left: 20px;
    padding-right: 5px;
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
	var resumesNo = "${general.resumes.resumesNo}";
// 	var musicTitle = "${general.music.musicTitle}";
// 	console.log("${general}");
	
	// 음악파일 타이머
	var setTime = 0;      // 최초 설정 시간(기본 : 초)
	var song = new Audio('/resources/${general.music.musicTitle }');
	 
	// 음악파일 버튼
	window.stop();
	$("#preSound").click( function() {
// 	   timerStart();
	   song.play();
	});
	
	$("#stopSound").click( function(){
// 		timerStart();
		song.pause();
	});     
   
   // 달력 불러오기
   $("#calendarBtn").click(function(){
	   	
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
			
			$("#infoTb").find("tr:last").find("td:last").empty();
			$("#infoTb").find("tr:last").find("td:last").append("<textarea style='color:black;'>" + "${general.resumes.bandInfo}" + "</textarea>");
			
		} else {
						
			// 수정된거 저장하기
			////////////////////////////////////////////////////////////////////////////////////
			
			// history 값 가져오기
			// historyNo
			var $checkedHis = $("input:checkbox[name='hisChk']");
	   		var map = $checkedHis.map(function(){
		   		return $(this).val();
	   		});
	   		var hisNo = map.get().join(",");
	   		
// 	   		console.log(hisNo);
	   		
	   		// Year
	   		var $hisYear = $("input:text[name='hisYr']");
	   		var map2 = $hisYear.map(function(){
	   			return $(this).val();
	   		});
	   		var hisYr = map2.get().join(",");
			
// 	   		console.log(hisYr);
	   		
	   		// historyInfo
	   		var $hisIf = $("input:text[name='hisInfo']");
	   		var map3 = $hisIf.map(function(){
	   			return $(this).val();
	   		});
	   		var hisIf = map3.get().join(",");
	   		
// 	   		console.log(hisIf);
	   		
			// 멤버 값 가져오기
			var $checkedMem = $("input:checkbox[name='memChk']");
			var map4 = $checkedMem.map(function(){
				return $(this).val();
			});
			var mNo = map4.get().join(",");
// 			console.log(mNo);

			// mPosition
	   		var $mPosition = $("input:text[name='memPo']");
	   		var map5 = $mPosition.map(function(){
	   			return $(this).val();
	   		});
	   		var mPo = map5.get().join(",");
			
// 	   		console.log(mPo);
	   		
	   		// mName
	   		var $mNam = $("input:text[name='memName']");
	   		var map6 = $mNam.map(function(){
	   			return $(this).val();
	   		});
	   		var mName = map6.get().join(",");
	   		
// 	   		console.log(mName);

			// bandInfo
			var bandInfo = $("#infoTb").find("tr:last").find("td:last").find("textarea").val();

			/////////////////////////////////////////////////////////////////////////////////////////////
			
			$.ajax({
				type : "POST",
				url : "/band/updateBandInfo",
				data : { bandNo : bandNo,
					historyNo : hisNo,
					resumesNo : resumesNo,
					year : hisYr,
					historyInfo : hisIf,
					bandMemberNo : mNo,
					bandMemName : mName,
					mPosition : mPo,
					bandInfo : bandInfo
					},
				dataType : "json",
				success: function(data){
					
					bandInfo = data.bandInfo;
					
					$("#infoTb").find("tr:last").find("td:last").empty();
					$("#infoTb").find("tr:last").find("td:last").append(bandInfo);
					
					// 속성들 재조정
					
					$("#editBtn").html("수정");
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
					
// 					alert("밴드 수정이 완료되었습니다");
					
				}, error : function(){
					alert("개망했다");
				}
				
			});
			
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
   
   // 멤버 추가
   $("#addMember").click(function(){
	  var mP = $("#mP").val();
	  var mName = $("#mName").val();
	  
	  $.ajax({
			type: "post",
			url: "/band/addMember",
			data: { mPosition : mP,
					bandMemName : mName,
					bandNo : bandNo } ,
			dataType : "json",
			success: function(data) {
				
				var newMem = data.newMem;
				
				$newMem = $("<tr>" +
						"<td><input name='memChk' type='checkbox' value='"+ newMem.bandMemberNo +"' /></td>" +
						"<td><input name='memPo' class='mems' type='text' value='"+ newMem.mPosition +"' /></td>" +
						"<td><input name='memName' class='mems' type='text' value='"+ newMem.bandMemName +"' /></td>" +
					"</tr>");
				
				$locat = $("#memberTb").find("tr:last");
				
				$newMem.insertBefore($locat);
				
				$("input[type=text]").attr("disabled", false);
				$("input[type=text]").css({"background-color" : "white"});
				$("input[type=text]").css({"border" : "1px solid black"});
				$("input[type=checkbox]").css({"display" : "block"});
			
				$("#mP").val("");
				$("#mName").val("");
				
			}, error: function() {
				alert("망함");
			}
		});
	  
   });
   
   
   
   $("#addHistory").click(function(){
	   
	   var hY = $("#hY").val();
	   var hisInfo = $("#hisInfo").val();
	  
	   // history 비우기
	   var counts = $("#historyTb tr").length;
	   for(var i=1; i+1<counts; i++) {
		   $("#historyTb tr:nth-child("+(counts-i)+")").remove();
	   }
	   
	   $.ajax({
			type: "post",
			url: "/band/addHistory",
			data: { year : hY,
					historyInfo : hisInfo,
					resumesNo : resumesNo } ,
			dataType : "json",
			success: function(data) {
				
				var newHis = data.newHis;
				
				for(var i=0; i<newHis.length; i++) {
					
					$newHis = $("<tr>" +
							"<td><input name='hisChk' type='checkbox' value='"+ newHis[i].historyNo +"' /></td>" +
							"<td><input name='hisYr' class='hist' type='text' value='"+ newHis[i].year +"' /></td>" + 
							"<td><input name='hisInfo' class='hist' type='text' value='"+ newHis[i].historyInfo+"' /></td>" +
						"</tr>");
					
					$locat = $("#historyTb").find("tr:last");
					
					$newHis.insertBefore($locat);
					
				}
				
				$("input[type=text]").attr("disabled", false);
				$("input[type=text]").css({"background-color" : "white"});
				$("input[type=text]").css({"border" : "1px solid black"});
				$("input[type=checkbox]").css({"display" : "block"});
			
				$("#hY").val("");
				$("#hisInfo").val("");
				
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
		<c:choose>
			<c:when test="${sessionScope.bandInfo.bandNo eq general.band.bandNo }">
				<button id="editBtn" style="height:30px;" class="right" type="button">수정</button>
			</c:when>
			<c:otherwise>
				<button id="editBtn" style="height:30px; display:none;" class="right" type="button">수정</button>
			</c:otherwise>
		</c:choose>
		
		<button id="calendarBtn" style="height:30px;" class="right" type="button">달력</button>
	</div>
	
<div class="divA" style="display: flex;">
	<!-- 왼쪽 -->
	<div class="div-common div-left">
		<!-- 밴드 사진 -->
		<div class="div-photo div-common">
			<img class="photoIn" src="../resources/${proPic.originName }"/>
		</div>
	
		<!-- 음악 파일 -->
		<div class="div-music div-common">
			<h4>음악 샘플</h4><br>
			<button id="preSound" class="searchBtn" >재생</button>
			<button id="stopSound" class="searchBtn">정지</button>
		</div>
	</div>
	
	<!-- 오른쪽 -->
	<div class="div-common div-right">
		<div>
		
		<!-- 밴드 History -->
		<div class="div-history div-common">
			<table>
			<tr>
				<th style="width:80px;"><h4>History</h4></th>
				<th>
					<table id="historyTb">
						<tr>
							<th></th>
							<th>연도</th>
							<th>내용</th>
						</tr>
						<c:forEach var="hist" items="${history }">
						<tr>
							<td><input name="hisChk" type="checkbox" value="${hist.historyNo }" /></td>
							<td><input name="hisYr" class="hist" type="text" value="${hist.year }" disabled /></td> 
							<td><input name="hisInfo" class="hist" type="text" value="${hist.historyInfo }" disabled /></td>
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
			</tr>
			</table>
		</div>
		
		<!-- 밴드 멤버 -->
		<div class="div-member div-common">
			<table>
			<tr>
				<th style="width:80px;"><h4>Member</h4></th>
				<th>
					<table id="memberTb">
						<tr>
							<th></th>
							<th>포지션</th>
							<th>이름</th>
						</tr>
						
						<c:forEach var="mem" items="${member }">
						<tr>
							<td><input name="memChk" type="checkbox" value="${mem.bandMemberNo }" /></td>
							<td><input name="memPo" class="mems" type="text" value="${mem.mPosition }" disabled /></td>
							<td><input name="memName" class="mems" type="text" value="${mem.bandMemName }" disabled /></td>
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
			<table id="infoTb">
				<tr>
					<th><h4>소개</h4></th>
				</tr>
				<tr>
					<td style="padding-left: 70px;">${resumes.bandInfo }</td>
					
				</tr>
			</table>
		</div>
		</div>
	</div>
</div> 
