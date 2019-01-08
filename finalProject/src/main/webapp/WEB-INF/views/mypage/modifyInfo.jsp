<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		border: 2px solid #fff;
		height: 600px;
		width:700px;
		margin: 0 auto;
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
		font-size:20px;
/* 		float:left; */
	}
	
	.adminMypageMainImage {
		border: 1px solid #fff;
		margin: 10px;
		width: 335px;
		height: 575px;
		float:right;
	}
	
	.selectMenu {
		color: gold;
	}
	
	.modifyInfoDone b{
		color:#fff;
	}
	
	.modifyInfoDone input{
		color:#000;
	}
	
	.modifyBtn {
		color:#000;
	}

	.modifyBandValue {
		width:100px;
	}
	/* The Modal (background) */
	.modal-pw {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: #000; /* Fallback color */
	    background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content-pw {
	    background-color: #000;
		margin: 0 auto;
	    padding: 20px;
	    border: 3px solid #fff;
		width: 400px;
		text-align:center;
	}
	
	/* The Close Button */
	.close {
	    color: #ffffff;
	    float: right;
	    font-size: 28px;
	    cursor:pointer;
	}
	
	.close:hover,
	.close:focus {
	    color: #fff;
	    text-decoration: none;
	    cursor: pointer;
	}
	
	.barfont {
		color: black;
		font-size: 15px;
	}
</style>

<script type="text/javascript">
$(document).ready(function() {
	//	모달
	$("#modifyPwBtn").click(function() {
	  $("#myModal").css({
	    "display": "block"
	  });
	});
	
	$(".close").click(function() {
	  $("#myModal").css({
	    "display": "none"
	  });
	});
	
	$("html").click(function(event) {
	  if (event.target.id === "myModal") {
	    $("#myModal").css({
	      "display": "none"
	    });
	  }
	});
});
	
	function viewMypageInfo(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/info"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageModifyInfo(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/modifyInfo"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageUserAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/userAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	function viewMypageBoardAdmin(){
		//AJAX 처리하기
		$.ajax({ 	
			type: "get"
			, url: "/mypage/boardAdmin"
			, data: {
				
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}

	function modifyMypageInfo(){
		//AJAX 처리하기
		var email = document.getElementById("email").value;
		var telcom = document.getElementById("telcom").value;
		var contact = document.getElementById("contact").value;
		
		$.ajax({ 	
			type: "post"
			, url: "/mypage/modifyInfo"
			, data: {
				"email": email
				, "telcom": telcom
				, "contact": contact
			}
			, dataType: "html"
			, success: function( res ) {
				$("#body").html(res);
			}
			, error: function() {
				console.log("실패");
			}
		});
	}
	
	
	
	function modifyPw(){
		
		var passwordData = {
				currPassword: $("#currPassword").val()
				, newPasswordFisrt: $("#newPasswordFisrt").val()
				, newPasswordSecond: $("#newPasswordSecond").val()
		    };
// 		console.log("1, " + res);
		//AJAX 처리하기
		$.ajax({ 	
			type: "post"
			, url: "/mypage/modifyPw"
			, dataType: "json"
			, data: passwordData
			, success: function( res ) {
				console.log("2, " + res);
// 				$("#body").html(res);
			}
			, error: function(res) {
				console.log("3, " + res);
				alert("현재 비밀번호 혹은 새로운 비밀번호가 틀렸습니다.");
			}
		});
	}
	
// 	function modifyPw(){
// 		var currPassword = document.getElementById("currPassword").value;
// 		var newPasswordFisrt = document.getElementById("newPasswordFisrt").value;
// 		var newPasswordSecond = document.getElementById("newPasswordSecond").value;
		
// 		//AJAX 처리하기
// 		$.ajax({ 	
// 			type: "post"
// 			, url: "/mypage/modifyPw"
// 			, data: {
// 				"currPassword": currPassword
// 				, "newPasswordFisrt": newPasswordFisrt
// 				, "newPasswordSecond": newPasswordSecond
// 			}
// 			, dataType: "html"
// 			, success: function( res ) {
// 				$("#body").html(res);
// 			}
// 			, error: function() {
// 				alert("현재 비밀번호 혹은 새로운 비밀번호가 틀렸습니다.");
// 			}
// 		});
// 	}
</script>
<c:if test="${loginInfo.roleId eq 0 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p class="selectMenu" onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p onclick="viewMypageUserAdmin() ">회원 관리</p>
		<p onclick="viewMypageBoardAdmin() ">게시글 관리</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			
			<p class="adminDetailTitle">관리자 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
			<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button><br>
			
<!-- 			<form class="modifyInfoDone" action="/mypage/modifyPw" method="post"> -->
				<!-- The Modal -->
				<div id="myModal" class="modal-pw">
				  <!-- Modal content -->
				  <div class="modal-content-pw">
				    <p class="close">X</p>
				    <h2>비밀번호 변경</h2>
				    
					<b class="adminDetailInfo">현재 PW : </b><input type="password"  id="currPassword" name="password" ><br>
					<b class="adminDetailInfo">새 PW : </b><input type="password"  id="newPasswordFisrt" name="newPasswordFisrt" ><br>
					<b class="adminDetailInfo">새 PW 확인 : </b><input type="password"  id="newPasswordSecond" name="newPasswordSecond" ><br>
					
					<button class="modifyBtn" onclick="modifyPw()">수정</button><br>
					
				  </div>
				</div>
<!-- 			</form> -->
			
<!-- 			<form class="modifyInfoDone" action="/mypage/modifyInfo" method="post"> -->
				<b class="adminDetailInfo">이메일 : </b><input id="email" name="email" value="${member.email }"/><br>
				<b class="adminDetailInfo">통신사 : </b>
				
				<select class="modifyBtn" id="telcom" name="telcom" >
					<c:if test="${member.telcom eq null}">
						<option value="">선택</option>
					</c:if>
					
					<c:if test="${member.telcom ne null}">
						<option value="${member.telcom }" selected="selected">${member.telcom }</option>
					</c:if>
					
					<option value="KT">KT</option>
					<option value="SK">SK</option>
					<option value="LG">LG</option>
					
				</select><br>
				<b class="adminDetailInfo">연락처 : </b><input id="contact" name="contact" value="${member.contact }"/><br>
				<button class="modifyBtn" onclick="modifyMypageInfo();">수정</button>
<!-- 			</form> -->
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>

<!-- bar 마이페이지 -->
<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p class="selectMenu" onclick="viewMypageModifyInfo() ">회원 정보수정</p>
		<p onclick="viewMypageIntro() ">바 소개</p>
		<p onclick="viewMypageAppToBand() ">지원 현황</p>
		<p onclick="viewMypageCalendar() ">일정표</p>
	</div><br><br>
	<hr>

	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Bar 마이페이지 메인</p>
			<hr>
			<p class="adminDetailInfo">아이디 : ${member.userId }</p>
			<p class="adminDetailInfo">닉네임 : ${member.userName }</p>
			
			<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button><br>
			
				<!-- The Modal -->
				<div id="myModal" class="modal-pw">
				  <!-- Modal content -->
				  <div class="modal-content-pw">
				    <p class="close">X</p>
				    <h2>비밀번호 변경</h2>
				    
					<b class="adminDetailInfo">현재 PW : </b><input type="password"  id="currPassword" name="password" ><br>
					<b class="adminDetailInfo">새 PW : </b><input type="password"  id="newPasswordFisrt" name="newPasswordFisrt" ><br>
					<b class="adminDetailInfo">새 PW 확인 : </b><input type="password"  id="newPasswordSecond" name="newPasswordSecond" ><br>
					
					<button class="modifyBtn" onclick="modifyPw()">수정</button><br>
					
				  </div>
				</div>
			
			
				<b class="adminDetailInfo">이메일 : </b>
					<input id="email" name="email" value="${member.email }" /><br>
				<b class="adminDetailInfo">통신사 : </b>
				
				<select class="modifyBtn" id="telcom" name="telcom" >
					<c:if test="${member.telcom eq null}">
						<option value="">선택</option>
					</c:if>
					
					<c:if test="${member.telcom ne null}">
						<option value="${member.telcom }" selected="selected">${member.telcom }</option>
					</c:if>
					
					<option value="KT">KT</option>
					<option value="SK">SK</option>
					<option value="LG">LG</option>
					
				</select><br>
				<b class="adminDetailInfo">연락처 : </b><input id="contact" name="contact"value="${member.contact }" /><br>
				<button class="modifyBtn" onclick="modifyMypageInfo()">수정</button>

		</div>

		<div class="adminMypageMainImage">
			<p>이미지 넣어주세요</p>
		</div>

	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick=" location.href='/mypage/info' ">Mypage</p>
		<p class="selectMenu" onclick="location.href='/mypage/modifyInfo' ">회원 정보수정</p>
		<p onclick="location.href='/mypage/intro' ">밴드 소개</p>
		<p onclick="location.href='/mypage/applicationToBar' ">지원 현황</p>
		<p onclick="location.href='/mypage/recommand' ">추천 Bar</p>
		<p onclick="location.href='/mypage/calendar' ">일정표</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			
			<p class="adminDetailTitle">Band 마이페이지 메인 </p>
			<hr>
			<p class="adminDetailInfo">계정 : ${member.userId }</p>
			<p class="adminDetailInfo">이름 : ${member.userName }</p>
			<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button><br>
			
			<form class="modifyInfoDone" action="/mypage/modifyPw" method="post">
				<!-- The Modal -->
				<div id="myModal" class="modal-pw">
				  <!-- Modal content -->
				  <div class="modal-content-pw">
				    <p class="close">X</p>
				    <h2>비밀번호 변경</h2>
				    
					<b class="adminDetailInfo">현재 PW : </b><input type="password"  name="password" ><br>
					<b class="adminDetailInfo">새 PW : </b><input type="password"  name="newPassword" ><br>
					<b class="adminDetailInfo">새 PW 확인 : </b><input type="password"  name="newPassword" ><br>
					
					<button class="modifyBtn">수정</button><br>
					
				  </div>
				</div>
			</form>
				<p class="adminDetailInfo">밴드 : ${band.bandName }</p>
				<b class="adminDetailInfo">멤버</b>
				
				<form class="modifyInfoDone" action="/mypage/addMemberlist" method="post">
					<button class="modifyBtn">+</button>
				</form>
				<c:if test="${bandMemberList[0].bandMemberNo > 0}">
					<form class="modifyInfoDone" action="/mypage/minMemberlist" method="post">
						<button class="modifyBtn">-</button>
					</form>
				</c:if>
				
			<form class="modifyInfoDone" action="/mypage/modifyInfo" method="post">
				<b class="adminDetailInfo">이메일 : </b><input name="email" value="${member.email }"/><br>
				<b class="adminDetailInfo">통신사 : </b>
				
				<select class="modifyBtn" name="telcom" >
					<c:if test="${member.telcom eq null}">
						<option value="">선택</option>
					</c:if>
					
					<c:if test="${member.telcom ne null}">
						<option value="${member.telcom }" selected="selected">${member.telcom }</option>
					</c:if>
					
					<option value="KT">KT</option>
					<option value="SK">SK</option>
					<option value="LG">LG</option>
					
				</select><br>
				<b class="adminDetailInfo">연락처 : </b><input name="contact" value="${member.contact }"/><br><br>
				<ul id = 'memberList'>
					<c:forEach
					items="${bandMemberList }" var="i" varStatus="status">
					<li>
					<input class="modifyBandValue" name="bandMemName${status.count }" value="${i.bandMemName }"/> - <input class="modifyBandValue" name="mPosition${status.count }" value="${i.mPosition }"/>
					</li>
					</c:forEach>
				</ul>
				<button type="submit" class="modifyBtn">수정</button>
			</form>
		</div>
		<div class="adminMypageMainImage">
			<p >이미지 넣어주세요 </p>
		</div>
		
	</div>
</c:if>
