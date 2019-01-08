<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

BODY {
	FONT-SIZE: 9pt; FONT-FAMILY: tahoma;
}

TABLE {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: tahoma;
}

A {
	COLOR: #999999; TEXT-DECORATION: none;
	cursor: pointer;
}

A:hover {
	COLOR: red; TEXT-DECORATION: none;
}

TD.main {
	FONT-WEIGHT: bold; TEXT-ALIGN: right;
}

TD.uline {
    FONT-SIZE: 7pt; COLOR: #999999; BACKGROUND-COLOR: #ffffff;
}

TD.r_uline {
	FONT-SIZE: 7pt; COLOR: #999999; BACKGROUND-COLOR: #f4f4f4;
}

td.leftB{
	border-left: 1px solid black;
}

INPUT {
	MARGIN: -5px
}
.modal {
	border: 3px solid cyan;
	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 470; /* Full width */
    height: 320; /* Full height */
    margin:auto;
    overflow: auto; /* Enable scroll if needed */
	background-color:gray;
    border-radius:20px;
/*     background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	// 밴드넘버, 바넘버 넘겨줄 값 설정 필요
	var bandNo;
	var barNo;
	
	$(".getDay").click(function(){
		
		// 데이터 안 넘어감. 
		// 404
		
		var tDate = $(this).attr("id");
		console.log(tDate);
		
		$.ajax({
			type: "get",
			url: "/calendar/info",
			data: { tDate : tDate} ,
			dataType: "json",
			success: function(data) {
				
				document.getElementById("wow").style.display="block";
				
				console.log("");
				console.log(data);
				
			}, error: function() {
				alert("마마마망함 ㅋ");
			}
			
		});
		
	});
	
	$("#exit").click(function(){
		document.getElementById("wow").style.display = "none";
	});
	
});

// console.log("${map.today}");
// console.log("year: " + "${map.curYear }");
// console.log("month: " + "${map.curMonth}");
// console.log("date: " + "${map.curDay}");
// console.log("firstDayOfMonth: " + "${map.firstDayOfMonth}");
// console.log("firstDayOfWeek: " + "${map.firstDayOfWeek}");
// console.log("lastDayOfMonth: " + "${map.lastDayOfMonth}");
// console.log("lastDayOfLastWeek: " + "${map.lastDayOfLastWeek}");
// console.log("firstDayOfNextMonth: " + "${map.firstDayOfNextMonth}");

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
</head>


<c:set var="curYear" value="${map.curYear }" />
<c:set var="curMonth" value="${map.curMonth }" />
<c:set var="curDay" value="${map.curDay }" />
<%-- Parameter Setting --%>

<%-- <c:set var="type" value="${map.type }" /> --%>


<!-- -------------------------------- -->


<body>
<div style="margin:0 auto">
<form name="theForm">
<%-- base table --%>
<table cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="620" height="665">
	<tr>
  		<td align="center" width="365">
  			<c:out value="${curYear}"/> 年 &nbsp;&nbsp;  <c:out value="${curMonth}"/> 月 
  			<a href="View.jsp?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth+1}"/>&curDay=<c:out value="${curDay}"/>">▶</a>
  		</td>
<!--   		<TD align="left"> -->
<!--   			<IMG src="images/monthly.gif" border=0> -->
<!--   		</TD> -->
	</tr>
	<tr height="3">
		<td colspan="2"></td>
	</tr>
	<tr>
  		<td align="center" colspan="3" valign="top">
  		<%-- body table --%>
  		<table border="0" cellspacing="0" cellpadding="0">
  			<tr>
  				<td valign="top" style="border:#666666 1px solid;padding:5px" align="center">
  				<%-- month outline table --%>
   			 	<table border="0" cellspacing="0" cellpadding="0">
    				<tr height="30">
      					<td align=center>
      						<font color=red>일요일</font>
      					</td>
						<td align=center>월요일</td>
						<td align=center>화요일</td>
						<td align=center>수요일</td>
						<td align=center>목요일</td>
						<td align=center>금요일</td>
						<td align=center>토요일</td>
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
												<c:forEach var="dayIndex" items="${sched}">
													<c:if test="${currentDay == dayIndex.calendarDate}">
														<tr><td>
														<a href="javascript:view('${dayIndex.calendarNo}')">
															${dayIndex.startTime} ~ ${dayIndex.endTime } : ${dayIndex.barNo }<br>
															${dayIndex.startTime} ~ ${dayIndex.endTime } : ${dayIndex.bandNo }<br><br>
														</a>
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
						</tabkle>
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
<div id="wow" class="modal">
<FORM method="post" name="theForm" action="Update.jsp" style="margin:5px;">
<TABLE cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="100%" height="100%" >
<TR>
    <TD align="center">
    <TABLE cellpadding="0" cellspacing="1" border="0" bgcolor="#ffffff" width="440">
        <TR height="10">
            <TD></TD>
        </TR>
        <TR>
            <TD align=center bgcolor="#ffffff">
            <TABLE cellpadding="5" cellspacing="1" border="0" bgcolor="#666666">
                <TR bgcolor="#ffffff">
                    <TD class="main">
                        일자
                    </TD>
                    <TD> 
                      	<INPUT type="text" id="date_Y" class="text_gray" size="4" maxlength="4">년 
                        <INPUT type="text" id="date_M" class="text_gray" size="2" maxlength="2">월  
                        <INPUT type="text" id="date_D" class="text_gray" size="2" maxlength="2">일 
                    </TD>
                </TR>
                <TR bgcolor="#ffffff">
                    <TD class="main">
                      	공연시간
                    </TD>
                    <TD>
                        <select>
                        	<option>0800</option>
                        	<option>0830</option>
                        	<option>0900</option>
                        	<option>0930</option>
                        	<option>1000</option>
                        </select>
					~
                        <select>
                        	<option>0800</option>
                        	<option>0830</option>
                        	<option>0900</option>
                        	<option>0930</option>
                        	<option>1000</option>
                        </select>
                        
					여기는 바/밴드이름 넣기
                        
                    </TD>
                </TR>
            </TABLE>
            </TD>   
        </TR>     
        <TR>
            <TD colspan="2" height="5"></TD>
        </TR>
        <TR>
            <TD align="center">
            	<button id="enter">확인</button>
            	<button id="exit" type="button">닫기</button>
<%--                 <IMG src="images/save.gif"         style="cursor:hand" border=0 onclick="javascript:submitForm('<c:out value="${type}"/>');"> --%>
<!--                 <IMG src="images/close.gif"     style="cursor:hand" border=0 onclick="window.close()"> -->
                <c:if test="${type == 'SELECT'}">
                    <IMG src="images/delete.gif"     style="cursor:hand" border=0 onclick="javascript:deleteForm();">
                </c:if>
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

</body>
</html>