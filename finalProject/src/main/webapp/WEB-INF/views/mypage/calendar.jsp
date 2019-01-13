<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="ajax.jsp" />

<style type="text/css">
	.adminMenu p{
		float:left;
		cursor:pointer;
		padding:10px;
		margin: 0 auto;
	}
	
	.adminMenu p:hover{
		color: gold;
		cursor:pointer;
	}
	
	.adminMypageMain {
/* 		border: 2px solid #fff; */
		width:700px;
		height: 300px;
		margin: 10px auto;
	}
	
	.barRandomListRes {
/* 		border: 2px solid #fff; */
		width:700px;
		height: auto;
		margin: 10px auto;
	}
	
	.adminMypageMainInfo {
		margin: 10px;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminDetailInfo {
		font-size:13px;
	}
	
	.adminMypageMainImage {
/* 		border: 1px solid #fff; */
		margin: 10px;
		width: 335px;
		height: 280px;
		float:right;
	}
	
	.selectMenu {
		color: gold;
	}
	
	.searchBtn {
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
	}
	
	.searchUserinfo {
/* 	 	float:right;  */
/* 		text-align:right; */
		margin:0px 5px 3px 5px;
/* 		padding:0 100px 3px 10px; */
		box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
		-moz-border-radius: 3px;
		-khtml-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 3px;
	/* 	background-color:#5c5c5c; */
	}
	
	.profilePicSize {
		width: 120px;
		height: 100px;
	}
	
	.backgroundColor {
		background-color:#000;
		cursor:pointer;
		text-align:center;
	}
	
	.calendarImage {
		-webkit-filter: grayscale(100%);
		filter: gray;
		width: 340px;
		height: 275px;
	}
	
	.anchorSize {
		width:100px;
	}

TABLE {
	FONT-SIZE: 9pt; 
	COLOR: black; 
	FONT-FAMILY: tahoma;
	width:100px;
}

a {
	COLOR: #999999;
	TEXT-DECORATION: none;
	cursor: pointer;
}

A:hover {
	COLOR: red; 
	TEXT-DECORATION: none;
}

TD.main {
	FONT-WEIGHT: bold; 
	TEXT-ALIGN: right;
	margin: 2px;
	
}

TD.uline {
    FONT-SIZE: 7pt;
    font-weight:bold;
    COLOR: black;
    BACKGROUND-COLOR: #ffffff;
   	width:100px;
}

TD.r_uline {
	FONT-SIZE: 7pt; 
	COLOR: #999999; 
	BACKGROUND-COLOR: #f4f4f4;
	
}

td.leftB{
	border-left: 1px solid black;
}

INPUT {
	MARGIN: -5px;
}
.modal-dateView {
	border: 3px solid cyan;
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 470px; /* Full width */
    height: 320px; /* Full height */
    margin:auto;
    overflow: auto; /* Enable scroll if needed */
	background-color:gray;
    border-radius:20px;
/*     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.text_gray{
	background-color: white;
	border: none;
	text-align: right;
	height: 15px;
	width: 30px;
	margin-left: 2px;
}

.bbName{
	border: none;
	height: 15px;
	margin-left: 2px;
	width: auto;
	background-color: white;
}

</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	// 밴드넘버, 바넘버 넘겨줄 값 설정 필요
	var bandNo = ${number};
// 	var barNo = ${param.barNo};

// 	console.log(map);
	
	$(".getDay").click(function(){
		
		var tDate = $(this).attr("id");
// 		console.log(tDate);
		
		// 선택 날짜
		var selDay = tDate.split('.');
		
		$.ajax({
			type: "get",
			url: "/calendar/info",
			data: { tDate : tDate ,
				bandNo : bandNo} ,
			dataType: "json",
			success: function(data) {

				document.getElementById("wow").style.display="block";
				
				// 선택 날짜 표시
				$("#date_D").val(selDay[2]);
				
				// 해당 날짜 정보 리스트
				var lists = data.datedInfo;
				// 시간 리스트
				var setTime = data.pTime;
				
				$("#ddInfo").empty();
				
				// 시간 설정
				$("#selSt").empty();
				$("#selEd").empty();
				$(".bbName").remove();
				
				var checking = 0;
				
				
				
				// 공연 시간 옆의 td에 시간, 바 이름 넣어야함
				// ddInfo
				
				// 새 줄 만듦
// 				$newLine = "" +
// 					"<tr><td>"
// 					"<select id='selSt'>" +
// 					"</select> ~ " +
// 					"<select id='selSt'>" +
// 					"</select>" +
// 					"<input type='text' class='bbName' id='" + lists[0].barNo + "' value='" + lists[0].barName +"' disabled />" +
// 					"</td></tr>";				
					
				// 새 줄 적용
// 				$("#ddInfo:last").append($newLine);
				
// 				$("#ddInfo > tr:last > td:last").append($("#selSt"));
			
// 				$("#ddInfo > tbody").append($newTr);
				
				
				
				//////////////////////////////////////
// 				for(var i=0; i < lists.length; i++) {
					
// 					var curItem = lists[i];
					
// 					for(var j=0; j < setTime.length; j++) {
						
// 						// 시간 설정
// 						if(curItem.startTime == setTime[j].timeId) {
							
// 							// 시간이 같으면  option selected 생성
// 							$("#selSt").append("<option class='stTime' id='" + curItem.timeId + "'' selected >" + setTime[j].hourM + "</option>");
							
// 						} else{
							
// 							$("#selSt").append("<option class='stTime' id='" + curItem.timeId + "''>" + setTime[j].hourM + "</option>");
// 						}
						
// 						if(curItem.startTime == setTime[j].timeId) {
							
// 							// 시간이 같으면  option selected 생성
// 							$("#selEd").append("<option class='edTime' id='" + curItem.timeId + "'' selected >" + setTime[j].hourM + "</option>");
							
// 						} else{
							
// 							$("#selEd").append("<option class='edTime' id='" + curItem.timeId + "''>" + setTime[j].hourM + "</option>");
// 						}
// 					}
					
// 					$("#selSt").attr("disabled", true);
// 					$("#selEd").attr("disabled", true);
					
// 					// 밴드 이름
// 					$("#ddInfo").append("<input type='text' class='bbName' id='" + curItem.barNo + "' value='" + curItem.barName +"' disabled />");
						
// 				}
				//////////////////////////////////////
				
			}, error: function() {
				alert("하 ㅅㅂ");
			}
			
		});
		
	});
	
	$("#exit").click(function(){
		document.getElementById("wow").style.display = "none";
	});
	
	// 모달 끄기
	$("#backView").click(function(){

		var bandNo = ${number};
		
		$.ajax({
			type: "get",
			url: "/band/bandView",
			data: { bandNo : bandNo } ,
			context: document.body,
			success: function(data) {
					
				// 모달 끄기
				$("#body").html(data);
				
			}, error: function() {
				alert("망함");
			}
		});
		
	});
	
	// 수정버튼
	$("#editPfmc").click(function(){
		
		if($(this).html() == "수정") {
			
			$(this).html("저장");
			$("#addPfmc").css("display", "block");
			$(".bbName").attr("disabled", false);
			$("select").attr("disabled", false);
			
			
			$("#editInfo").css("display", "block");
			
		} else{
			
			$(this).html("수정");
			$("#addPfmc").css("display", "none");
			$(".bbName").attr("disabled", true);
			$("select").attr("disabled", true);
			
			$("#editInfo").css("display", "none");
		}
	});
	
	// 추가버튼
	$("#addItem").click(function(){
		
		var $date_Y = $("#date_Y").val();
		var $date_M = $("#date_M").val();
		var $date_D = $("#date_D").val();
	
		var thisDate = $date_Y +"."+ $date_M +"."+ $date_D;
		
		console.log(thisDate);
		
		var stTime = $("#addSt option:selected").val();
		var edTime = $("#addEd option:selected").val();
		var barN = $("#addBar option:selected").val();
		
// 		console.log(stTime);
// 		console.log(edTime);
// 		console.log(barN);
		
		$.ajax({
			type: "post",
			url: "/calendar/addBar",
			data: { thisDate : thisDate,
				stTime : stTime,
				edTime : edTime,
				barNo : barN,
				bandNo : bandNo} ,
			context: document.body,
			success: function(res) {
			
				location.href="/band/bandView?bandNo=" + bandNo;
				
// 				$("#body").html(data)
				
// 				$newLine = "" +
// 				"<tr><td>"
// 				"<select id='selSt'>" +
// 				"<option>aaaa</option>" +
// 				"</select> ~ " +
// 				"<select id='selSt'>" +
// 				"<option>bbbb</option>" +
// 				"</select>" +
// 				"<input type='text' class='bbName' id='addBar' value='" + barN +"' disabled />" +
// 				"</td></tr>";	
				
// 				$("#ddInfo:last").append($newLine);
// 				$("#ddInfo:last").append("<tr><td>하 씨발 이제 쫌 되는듯하네</td></tr>");
				
			}, error: function(){
				alert("하 ㅆㅂ");
			}
		});
		
		
	});
	
});


function view(str){
	OpenWin("Update.jsp?type=SELECT&schedule_id="+str,480,360);
}

function OpenWin(URL, width, height){
	var str, width, height;
	str="'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,";
    str=str+"width="+width;
    str=str+",height="+height+"',top=50,left=50";
    window.open(URL,'remoteSchedule',str);
}

</script>

<c:set var="curYear" value="${map.curYear }" />
<c:set var="curMonth" value="${map.curMonth }" />
<c:set var="curDay" value="${map.curDay }" />
<%-- Parameter Setting --%>

<%-- <c:set var="type" value="${map.type }" /> --%>


<!-- -------------------------------- -->
<c:if test="${loginInfo.roleId eq 1 }">
<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBand() ">Application</p>
		<p class="selectMenu" onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
</c:if>
<c:if test="${loginInfo.roleId eq 2 }">
<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p class="selectMenu" onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
</c:if>

<div class="adminMypageMain">
	<div class="adminMypageMainInfo">
		<p class="adminDetailTitle">Calendar</p>
		<hr>
		<ul class="adminDetailInfo">
			<li>Calendar 일정 페이지입니다.</li>
			<li>회원님의 공연 일정에 대해 기록됩니다.</li>
			<li>날짜를 선택하면 추가 및 수정할 수 있습니다.</li>
		</ul>
	</div>
	<div class="adminMypageMainImage">
		<img src="../resources/calendarImage.gif" class="calendarImage">
	</div>
</div>

<div style="margin:0 auto">
<form name="theForm">
<%-- base table --%>
<table cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="620" height="665">
	<tr>
  		<td style="align:center; width:365; font-color:white; text-align:center;">
  			<h3 style="color:white">${curYear }년 ${curMonth }월 </h3> 
<%--   			<a href="View.jsp?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth+1}"/>&curDay=<c:out value="${curDay}"/>">▶</a> --%>
  		</td>
	</tr>
	<tr height="3">
		<td colspan="2"></td>
	</tr>
	<tr>
  		<td align="center" colspan="3" valign="top">
  		<%-- body table --%>
  		<table border="0" cellspacing="0" cellpadding="0">
  			<tr>
  				<td valign="top" style="border:#666666 1px solid; padding:5px" align="center">
  				<%-- month outline table --%>
   			 	<table border="0" cellspacing="0" cellpadding="0">
    				<tr height="30">
      					<td align=center>
      						<font color=red>일요일</font>
      					</td>
						<td align=center><font color=white>월요일</font></td>
						<td align=center><font color=white>화요일</font></td>
						<td align=center><font color=white>수요일</font></td>
						<td align=center><font color=white>목요일</font></td>
						<td align=center><font color=white>금요일</font></td>
						<td align=center><font color=white>토요일</font></td>
    				</tr>
    				<tr><td colspan=7 bgcolor=#888888 height=1></td></tr>
    				<tr><td colspan=7 bgcolor=#ffffff height=5></td></tr>
					<tr>
      					<td colspan=7>
      					<%-- month content table --%>
      					<table border='0' cellspacing='1' cellpadding='0' bgcolor=#dddddd>
      						<tr>
								<c:if test="${map.firstDayOfWeek != '1'}">
      							<%-- 해당 월의 가장 첫째줄에 있는 공백부분을 셈해서 처리한다.--%>
      							<c:forEach var="i" begin="1" end="${map.firstDayOfWeek-1}">
									<td width="70" height="78" class="uline" valign="top" align="right" style="padding:5">
									</td>
								</c:forEach>
								</c:if>
								
								<%-- 이 달의 끝날까지 메모의 제목과 날짜(숫자)를 출력한다 --%>
      							<c:forEach var="currentDay" begin="1" end="${map.lastDayOfMonth}">									
									<td bgcolor="#ffffff" style="padding:5">
										<table cellpadding="0" cellsping="0" border="0" width="70">
										<tr>
											<td height="10" width="70" class="uline" valign="top" align="right">
												<a class="getDay" id="${curYear }.${curMonth }.${currentDay }">
												<c:choose>
													<c:when test="${((currentDay-(8-map.firstDayOfWeek)) % 7) == 1}">
														<%-- 일요일 --%>
														<FONT color="red">													
															<c:out value="${currentDay}"/>  
														</FONT>
													</c:when>
													<c:otherwise>
														<c:out value="${currentDay}"/>
													</c:otherwise>
												</c:choose>
												
											</a>											
											</td>
										</tr>
										<tr>
											<td height="68" width="70" valign="top">
<%-- 											${(currentDay-(8-map.firstDayOfWeek)) % 7 }<br> --%>
											<table>
												<c:forEach var="dayIndex" items="${map.sched}">
													<c:if test="${currentDay == dayIndex.calendarDate}">
														<tr><td>
															<table>
																<tr>
																	<td>
														<a class="anchorSize" href="javascript:view('${dayIndex.calendarNo}')">
															${dayIndex.startTime} ~ ${dayIndex.endTime } : ${dayIndex.barName } - ${dayIndex.bandName }<br><br>
														</a>
																	</td>
																</tr>
															</table>
														
														</td></tr>
													</c:if>
												</c:forEach>
											</table>
											</td>
										</tr>
										</table>		
									</td>
									<%-- 만약 한주의 마지막날(토요일)이고 이 달의 마지막 날이 아니라면 다음 줄로 넘어간다. --%>
									<c:if test="${((currentDay-(8-map.firstDayOfWeek)) % 7) == 0}">
										</tr>
										<tr>
									</c:if>
								</c:forEach>

								<%-- 해당 월의 가장 마지막 줄에 있는 공백부분을 셈해서 처리한다.--%>
								<c:if test="${map.lastDayOfLastWeek != '7'}">
								<c:forEach var="i" begin="1" end="${7-map.lastDayOfLastWeek}">
									<td width=70 height=78 class=uline valign=top align=right style='padding:5'>
									</td>
								</c:forEach>
								</c:if>							
							</tr>
						</table>
						<%-- end month content table --%>
						</td>
					</tr>
      			</table>
      			<%-- end month outline table --%>
      			</td>
    		</tr>
    	</table>
    	<%-- end body table --%>
		</td>
	</tr>
  	<tr height=10><td></td></tr>
	<tr>
		<td align=right></td>
	</tr>
</table>
<%-- end base table --%>
</form>
</div>

<!-- 모달 -->
<div id="wow" class="modal-dateView">
<FORM method="post" name="theForm" action="Update.jsp" style="margin:5px;">
<TABLE cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="100%" height="100%" >
<TR>
    <TD align="center">
    <TABLE cellpadding="0" cellspacing="1" border="0" bgcolor="#ffffff" width="440">
        <TR height="10">
            <TD></TD>
        </TR>
        <TR style="height: auto;">
            <TD align=center bgcolor="#ffffff">
            <TABLE cellpadding="5" cellspacing="1" border="0" bgcolor="#666666">
                <TR bgcolor="#ffffff">
                    <TD class="main">
                        일자 
                    </TD>
                    <TD> 
                      	<INPUT type="text" id="date_Y" class="text_gray" size="4" maxlength="4" value="${curYear }"> 년 
                        <INPUT type="text" id="date_M" class="text_gray" size="2" maxlength="2" value="${curMonth }"> 월  
                        <INPUT type="text" id="date_D" class="text_gray" size="2" maxlength="2"> 일 
                    </TD>
                </TR>
                <TR bgcolor="#ffffff">
                    <TD class="main">
                      	공연시간
                    </TD>
                    <TD>
                    	<table id="ddInfo" style="margin-left:3px">
							<c:forEach var="timeInfo" items="${map.sched}">
								<tr>
								<td>
									<select id="selSt" disabled >
	                        			<c:forEach var="pt" items="${map.pTime }" >
											<option class="stTime" id="${pt.timeId }">${pt.hourM }</option>
			                        	</c:forEach>
			                        </select>
					~
    			                    <select id="selEd" disabled >
                			        	<c:forEach var="pt" items="${map.pTime }" >
			                        		<option class="edTime" id="${pt.timeId }">${pt.hourM }</option>
			                        	</c:forEach>
			                        </select>
                        
			                        <input type="text" class="bbName" />
		                        </td>
								</tr>
							</c:forEach>
	                    </table>
                    </TD>
                </TR>
            </TABLE>
            </TD>   
        </TR>     
        <TR>
            <TD colspan="2" height="5">
            	<table id="editInfo" style="display:none;">
            	<tr>
            		<td>
            			<select id="addSt" >
	                        <c:forEach var="pt" items="${map.pTime }" >
								<option class="stTime" value="${pt.timeId }">${pt.hourM }</option>
			                </c:forEach>
						</select>
					~
    			        <select id="addEd" >
                			<c:forEach var="pt" items="${map.pTime }" >
			                	<option class="edTime" value="${pt.timeId }">${pt.hourM }</option>
			                </c:forEach>
			            </select>
			           	
						<select id="addBar">
							<c:forEach var="bars" items="${bars }">
								<option class="barId" value="${bars.barNo }">${bars.barName }</option>
							</c:forEach>
						</select>

			            <button id="addItem" type="button">추가</button>
            		</td>
            	</tr>
            	</table>
            </TD>
        </TR>
        <TR>
            <TD align="center">
            	<button id="editPfmc" type="button">수정</button>
            	<button id="exit" type="button">닫기</button>
            </TD>
        </TR>
        <TR>
            <TD colspan=2 height=5></TD>
        </TR>
    </TABLE>
    </TD>
</TR>
</TABLE>
<INPUT type="hidden" name="type">
<INPUT type="hidden" name="schedule_id" value="<c:out value="${schedule_id}"/>">
<INPUT type="hidden" name="schedule_date_time">
</FORM>
</div><!-- 모달 끝 -->
