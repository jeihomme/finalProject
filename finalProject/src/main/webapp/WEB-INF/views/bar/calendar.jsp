<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

TABLE {
	FONT-SIZE: 9pt; 
	COLOR: black; 
	FONT-FAMILY: tahoma;
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
    COLOR: black;
    BACKGROUND-COLOR: #ffffff;
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
	MARGIN: -5px
}
.modal-dateView {
/* 	border: 3px solid cyan; */
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
	var barNo = ${param.barNo};
	var login = "${sessionScope.login}";
	var bandNo = "${sessionScope.bandInfo.bandNo}";
	
	$(".getDay").click(function(){
		
		var tDate = $(this).attr("id");
// 		console.log(tDate);
		
		// 선택 날짜
		var selDay = tDate.split('.');
		
// 		console.log(barNo);
		
		$.ajax({
			type: "get",
			url: "/calendar/info",
			data: { tDate : tDate ,
				barNo : barNo,
				bandNo : bandNo},
			dataType: "json",
			success: function(data) {

// 				console.log(selDay);
				
				document.getElementById("wow").style.display="block";
				
// 				// 선택 날짜 표시
				$("#date_D").val(selDay[2]);
				
// 				// 해당 날짜 정보 리스트
				var lists = data.barDInfo.barInfo;
				var emptyLists = data.barDInfo.emptySched;
				
// 				// 시간 리스트
				var setTime = data.pTime;
				
				$("#ddInfo").empty();
				
// 				// 시간 설정
// 				$(".selSt").empty();
// 				$(".selEd").empty();
// 				$(".bbName").remove();
				
// 				var checking = 0;
				
				
				
				// 공연 시간 옆의 td에 시간, 바 이름 넣어야함
				// ddInfo
				
				for(var j=0; j<lists.length; j++) {
				
					// tr
					var newTr = $("<tr></tr>");
					$("#ddInfo").append(newTr);
					
					// td
					var newTd = $("<td></td>");
					$("#ddInfo").find("tr:last").append(newTd);
					
					// stTime
					var newStTime = $("<select class='selSt' disabled ></select>");
					$("#ddInfo").find("tr:last").find("td:last").append(newStTime);
					
					//stTime option
					for(var i=0; i<setTime.length; i++) {
						
						if(lists[j].startTime == setTime[i].timeId) {
						
							var newOption = $("<option class='stTime' value='"+ setTime[i].timeId +"' selected >"+ setTime[i].hourM +"</option>");
						
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
							
						} else {
							
							var newOption = $("<option class='stTime' value='"+ setTime[i].timeId +"'>"+ setTime[i].hourM +"</option>");
							
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
						}
						
					}
					
					// 시간 중간 ~
					$("#ddInfo").find("tr:last").find("td:last").append("~");
					
					// edTime
					var newEdTime = $("<select class='selEd' disabled ><option>aaaa</option></select>");
					$("#ddInfo").find("tr:last").find("td:last").append(newEdTime);
					
					// edTime option
					for(var i=0; i<setTime.length; i++) {
						
						if(lists[j].startTime == setTime[i].timeId) {
							
							var newOption = $("<option class='edTime' value='"+ setTime[i].timeId +"' selected>"+ setTime[i].hourM +"</option>");
						
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
							
						} else {
							
							var newOption = $("<option class='edTime' value='"+ setTime[i].timeId +"'>"+ setTime[i].hourM +"</option>");
							
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
							
						}
						
					}
					
					// barName
					var newBandName = $("<input type='text' class='bbName' value='"+ lists[j].bandName +"' />")
					$("#ddInfo").find("tr:last").find("td:last").append(newBandName);
						
				}
				
				
				// 바의 비어있는 스케쥴
				for(var j=0; j<emptyLists.length; j++) {
					
					// tr
					var newTr = $("<tr></tr>");
					$("#ddInfo").append(newTr);
					
					// td
					var newTd = $("<td></td>");
					$("#ddInfo").find("tr:last").append(newTd);
					
					// stTime
					var newStTime = $("<select class='selSt' disabled ></select>");
					$("#ddInfo").find("tr:last").find("td:last").append(newStTime);
					
					//stTime option
					for(var i=0; i<setTime.length; i++) {
						
						if(emptyLists[j].startTime == setTime[i].timeId) {
						
							var newOption = $("<option class='stTime' value='"+ setTime[i].timeId +"' selected >"+ setTime[i].hourM +"</option>");
						
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
							
						} else {
							
							var newOption = $("<option class='stTime' value='"+ setTime[i].timeId +"'>"+ setTime[i].hourM +"</option>");
							
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
						}
						
					}
					
					// 시간 중간 ~
					$("#ddInfo").find("tr:last").find("td:last").append("~");
					
					// edTime
					var newEdTime = $("<select class='selEd' disabled ></select>");
					$("#ddInfo").find("tr:last").find("td:last").append(newEdTime);
					
					// edTime option
					for(var i=0; i<setTime.length; i++) {
						
						if(lists[j].startTime == setTime[i].timeId) {
							
							var newOption = $("<option class='edTime' value='"+ setTime[i].timeId +"' selected>"+ setTime[i].hourM +"</option>");
						
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
							
						} else {
							
							var newOption = $("<option class='edTime' value='"+ setTime[i].timeId +"'>"+ setTime[i].hourM +"</option>");
							
							$("#ddInfo").find("tr:last").find("td:last").find("select").append(newOption);
							
						}
						
					}
					
					// invite 버튼
					var inviteBtn = $("<button type='button' class='inviteBtn' value='"+ emptyLists[j].calendarNo +"'>초청</button>");
					$("#ddInfo").find("tr:last").find("td:last").append(inviteBtn);
						
					// invite 버튼 기능에 bind
					$('.inviteBtn').bind("click", invitePerf);
					
				}
				
			}, error: function() {
				alert(".getDay 실패");
			}
			
		});
		
	});
	
	$("#exit").click(function(){
		document.getElementById("wow").style.display = "none";
	});
	
	// 모달 끄기
	$("#backView").click(function(){

		var barNo = ${param.barNo};
		
		$.ajax({
			type: "get",
			url: "/bar/viewbar",
			data: { barNo : barNo } ,
			context: document.body,
			success: function(data) {
					
				// 모달 끄기
				$("#body").html(data);
				
			}, error: function() {
				alert("모달 끄기 실패");
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
				alert("추가 실패");
			}
		});
		
	});
	
	// 초청 버튼
	function invitePerf(){

		var calendarNo = $(this).val();
		
// 		console.log(calendarNo);
		
		$.ajax({
			type: "post",
			url: "/calendar/inviteBand",
			data: { calendarNo : calendarNo,
					barNo : barNo,
					bandNo : bandNo },
			dataType : "json",
			success: function(res) {
		
				console.log("초청 완료");
			
			}, error: function(){
				alert("초청 실패");
			}
		});
		
	}
	
});
</script>

<c:set var="curYear" value="${calendar.curYear }" />
<c:set var="curMonth" value="${calendar.curMonth }" />
<c:set var="curDay" value="${calendar.curDay }" />

<!-- -------------------------------- -->

<div style="margin:0 auto">
<form name="theForm">
<%-- base table --%>
<table cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="620" height="665">
	<tr>
  		<td style="align:center; width:365; font-color:white; text-align:center;">
  			<h3 style="color:white">${curMonth }. ${curYear }</h3> 
<%--   			<a href="View.jsp?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth+1}"/>&curDay=<c:out value="${curDay}"/>">▶</a> --%>
			<button type="button" id="backView">닫기</button>
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
								<c:if test="${map.calendar.firstDayOfWeek != '1'}">
      							<%-- 해당 월의 가장 첫째줄에 있는 공백부분을 셈해서 처리한다.--%>
      							<c:forEach var="i" begin="1" end="${calendar.firstDayOfWeek-1}">
									<td width="70" height="78" class="uline" valign="top" align="right" style="padding:5">
									</td>
								</c:forEach>
								</c:if>
								
								<%-- 이 달의 끝날까지 메모의 제목과 날짜(숫자)를 출력한다 --%>
      							<c:forEach var="currentDay" begin="1" end="${calendar.lastDayOfMonth}">									
									<td bgcolor="#ffffff" style="padding:5">
										<table cellpadding="0" cellsping="0" border="0" width="70">
										<tr>
											<td height="10" width="70" class="uline" valign="top" align="right">
											<c:choose>
												<c:when test="${sessionScope.loginInfo.roleId eq 1 }">
													<a class="getDay" id="${curYear }.${curMonth }.${currentDay }">
												</c:when>
												<c:otherwise>
													<a>
												</c:otherwise>
											</c:choose>
												<a class="getDay" id="${curYear }.${curMonth }.${currentDay }">
												<c:choose>
													<c:when test="${((currentDay-(8-calendar.firstDayOfWeek)) % 7) == 1}">
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
											<table>
												<c:forEach var="dayIndex" items="${sched.sched}">
													<c:if test="${currentDay == dayIndex.calendarDate}">
														<tr><td>
															<table>
																<tr>
																	<td>
														<a href="http://localhost:8088/bar/viewbar?barNo=${dayIndex.barNo }">
															${dayIndex.startTime} ~ ${dayIndex.endTime } : ${dayIndex.barName }<br><br>
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
									<c:if test="${((currentDay-(8-calendar.firstDayOfWeek)) % 7) == 0}">
										</tr>
										<tr>
									</c:if>
								</c:forEach>

								<%-- 해당 월의 가장 마지막 줄에 있는 공백부분을 셈해서 처리한다.--%>
								<c:if test="${calendar.lastDayOfLastWeek != '7'}">
								<c:forEach var="i" begin="1" end="${7-calendar.lastDayOfLastWeek}">
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
                      	<INPUT type="text" id="date_Y" class="text_gray" size="4" maxlength="4" value="${curYear }" disabled /> 년 
                        <INPUT type="text" id="date_M" class="text_gray" size="2" maxlength="2" value="${curMonth }" disabled /> 월  
                        <INPUT type="text" id="date_D" class="text_gray" size="2" maxlength="2" disabled /> 일 
                    </TD>
                </TR>
                <TR bgcolor="#ffffff">
                    <TD class="main">
                      	공연시간
                    </TD>
                    <TD>
                    	<table id="ddInfo" style="margin-left:3px">
							<c:forEach var="timeInfo" items="${sched.sched}">
							<c:if test="${curDay eq timeInfo.calendarDate }">
								<tr>
								<td>
									<select class="selSt" disabled >
	                        			<c:forEach var="pt" items="${sched.pTime }" >
											<option class="stTime" value="${pt.timeId }">${pt.hourM }</option>
			                        	</c:forEach>
			                        </select>
					~
    			                    <select class="selEd" disabled >
                			        	<c:forEach var="pt" items="${sched.pTime }" >
			                        		<option class="edTime" value="${pt.timeId }">${pt.hourM }</option>
			                        	</c:forEach>
			                        </select>
                        
			                        <input type="text" class="bbName" value=""/>
		                        </td>
								</tr>
							</c:if>
							</c:forEach>
							<tr>
								<td>
									<select class="selSt" disabled >
	                        			<c:forEach var="pt" items="${sched.pTime }" >
											<option class="stTime" value="${pt.timeId }">${pt.hourM }</option>
			                        	</c:forEach>
			                        </select>
					~
    			                    <select class="selEd" disabled >
                			        	<c:forEach var="pt" items="${sched.pTime }" >
			                        		<option class="edTime" value="${pt.timeId }">${pt.hourM }</option>
			                        	</c:forEach>
			                        </select>
                        
			                        <button type="button" id="inviteBtn" value="">초청</button>
		                        </td>
								</tr>
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
	                        <c:forEach var="pt" items="${sched.pTime }" >
								<option class="stTime" value="${pt.timeId }">${pt.hourM }</option>
			                </c:forEach>
						</select>
					~
    			        <select id="addEd" >
                			<c:forEach var="pt" items="${sched.pTime }" >
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
