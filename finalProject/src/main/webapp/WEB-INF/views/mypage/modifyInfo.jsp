<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		height: 600px;
		width:700px;
		margin: 0 auto;
	}
	
	.adminMypageMainInfo {
		margin: 10px;
		width:300px;
		float:left;
	}
	
	.adminDetailTitle {
		font-size:30px;
		font-weight:bold;
	}
	
	.adminDetailInfo {
		font-size:20px;
		color:gold;
/* 		float:left; */
	}
	
	.adminMypageMainImage {
/* 		border: 1px solid #fff; */
		margin: 10px;
		width: 335px;
		height: 575px;
		float:right;
	}
	
	.myPageMainImage {
		width: 335px;
		height: 575px;
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
		color: black;
		font-weight: bold;
		background: gold;
		border-radius:10px;
		border-color: gold;
	}
	
	.modifySelectBtn {
		color: black;
		font-weight: bold;
		border-radius:10px;
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
	
	.adminDetailInfo2 {
		font-size:15px;
 		float:right;
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
</script>

<c:if test="${loginInfo.roleId eq 0 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p class="selectMenu" onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageUserAdmin() ">Users</p>
		<p onclick="viewMypageBoardAdmin() ">Boards</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			
			<p class="adminDetailTitle">Modify </p>
			<hr>
			
			<b class="adminDetailInfo">계정</b> <b class="adminDetailInfo2">${member.userId }</b><br>
			<b class="adminDetailInfo">이름</b> <b class="adminDetailInfo2">${member.userName }</b><br>
			
				<div id="myModal" class="modal-pw">
				  <!-- Modal content -->
				  <div class="modal-content-pw">
				    <p class="close">X</p>
				    <h2>비밀번호 변경</h2>
				    
					<b class="adminDetailInfo">현재 PW</b> <input type="password"  id="currPassword" name="password" ><br>
					<b class="adminDetailInfo">새 PW</b> <input type="password"  id="newPasswordFisrt" name="newPasswordFisrt" ><br>
					<b class="adminDetailInfo">새 PW 확인</b> <input type="password"  id="newPasswordSecond" name="newPasswordSecond" ><br>
					
					<button class="modifyBtn" onclick="modifyPw()">수정</button><br>
					
				  </div>
				</div>

				<b class="adminDetailInfo">이메일</b> <input id="email" name="email" value="${member.email }"/><br>
				<b class="adminDetailInfo">통신사</b> 
				
				<select class="modifySelectBtn" id="telcom" name="telcom" >
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
				<b class="adminDetailInfo">연락처</b> <input id="contact" name="contact" value="${member.contact }"/><br>
				<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button><button class="modifyBtn" onclick="modifyMypageInfo()">수정</button>
		</div>
		<div class="adminMypageMainImage">
			<img src="../resources/adminMainImage.png" class="myPageMainImage">
		</div>
		
	</div>
</c:if>

<!-- bar 마이페이지 -->
<c:if test="${loginInfo.roleId eq 1 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p class="selectMenu" onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBand() ">Application</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>

	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			<p class="adminDetailTitle">Modify</p>
			<hr>
			<b class="adminDetailInfo">계정</b> <b class="adminDetailInfo2">${member.userId }</b><br>
			<b class="adminDetailInfo">이름</b> <b class="adminDetailInfo2">${member.userName }</b><br>
			
				<!-- The Modal -->
				<div id="myModal" class="modal-pw">
				  <!-- Modal content -->
				  <div class="modal-content-pw">
				    <p class="close">X</p>
				    <h2>비밀번호 변경</h2>
				    
					<b class="adminDetailInfo">현재 PW</b> <input type="password"  id="currPassword" name="password" ><br>
					<b class="adminDetailInfo">새 PW</b> <input type="password"  id="newPasswordFisrt" name="newPasswordFisrt" ><br>
					<b class="adminDetailInfo">새 PW 확인</b> <input type="password"  id="newPasswordSecond" name="newPasswordSecond" ><br>
					
					<button class="modifyBtn" onclick="modifyPw()">수정</button><br>
					
				  </div>
				</div>
			
			
				<b class="adminDetailInfo">이메일</b>
					<input id="email" name="email" value="${member.email }" /><br>
				<b class="adminDetailInfo">통신사</b>
				
				<select class="modifySelectBtn" id="telcom" name="telcom" >
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
				<b class="adminDetailInfo">연락처</b><input id="contact" name="contact"value="${member.contact }" /><br><br><br>
				<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button> <button class="modifyBtn" onclick="modifyMypageInfo()">수정</button>

		</div>

		<div class="adminMypageMainImage">
			<img src="../resources/barMainImage.jpg" class="myPageMainImage">
		</div>

	</div>
</c:if>

<c:if test="${loginInfo.roleId eq 2 }">
	<div class="adminMenu">
		<p onclick="viewMypageInfo() ">Mypage</p>
		<p class="selectMenu" onclick="viewMypageModifyInfo() ">Modify</p>
		<p onclick="viewMypageIntro() ">Intro</p>
		<p onclick="viewMypageAppToBar() ">Application</p>
		<p onclick="viewMypageRecommand() ">Recommand Bar</p>
		<p onclick="viewMypageCalendar() ">Calendar</p>
	</div><br><br>
	<hr>
	<div class="adminMypageMain">
		<div class="adminMypageMainInfo">
			
			<p class="adminDetailTitle">Modify</p>
			<hr>
			<b class="adminDetailInfo">계정</b> <b class="adminDetailInfo2">${member.userId }</b><br>
			<b class="adminDetailInfo">이름</b> <b class="adminDetailInfo2">${member.userName }</b><br>
			
			
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
				
				<b class="adminDetailInfo">밴드</b> ${band.bandName }<br>
				
				<b class="adminDetailInfo">이메일 : </b><input id="email" name="email" value="${member.email }"/><br>
				<b class="adminDetailInfo">통신사 : </b>
				
				<select class="modifySelectBtn" id="telcom" name="telcom" >
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
				<b class="adminDetailInfo">연락처 : </b><input id="contact" name="contact" value="${member.contact }"/><br><br>
				
				<b class="adminDetailInfo">멤버</b>
				
				<c:if test="${rnum < 5}">
					<button class="modifyBtn" onclick="addMemberlist() ">+</button>
				</c:if>
				
				<ul id = 'memberList'>
					<c:forEach
					items="${bandMemberList }" var="i" varStatus="status">
					<li>
						<input class="modifyBandValue" name="bandMemName[]" value="${i.bandMemName }"/> -
						<input class="modifyBandValue" name="mPosition[]" value="${i.mPosition }"/>
						
						<input type="hidden" name="bandMemberNo[]" value="${i.bandMemberNo }"/>
						<input type="hidden" id="bandNo" value="${band.bandNo }"/>
						
						<button class="modifyBtn" onclick="minMemberlist${status.count }() ">-</button>
					</li>
					</c:forEach>
				</ul>
				<br><br>
				<button id="modifyPwBtn" class="modifyBtn">비밀번호 변경</button><button type="submit" class="modifyBtn" onclick="modifyMypageInfo()">수정</button>
		</div>
		<div class="adminMypageMainImage">
			<img src="../resources/BandMainImage.gif" class="myPageMainImage">
		</div>
		
	</div>
</c:if>
