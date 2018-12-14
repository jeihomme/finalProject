<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 자바스크립트 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btnLogin").click(function() {
	    // 공백 검사
	    if(document.loginPost.userId.value.indexOf(" ")>=0) {
	    	alert("아이디에 공백이 들어가면 안 됩니다.");
	    	$("input[name=userId]").val("");
	    	post.userId.focus();
	    	return;
	    }
	    
	    if(document.loginPost.password.value.indexOf(" ")>=0) {
	    	alert("비밀번호에 공백이 들어가면 안 됩니다.");
	    	$("input[name=password]").val("");
	    	post.password.focus();
	    	return;
	    }
	    
	    // 공란 있는지 확인
	    if(document.loginPost.userId.value.length==0) {
	        alert("아이디를 입력해 주세요.");
	        post.userId.focus();
	        return;
	    }
		
	    if(document.loginPost.password.value.length==0) {
	        alert("비밀번호를 입력해 주세요.");
	        post.password.focus();
	        return;
	    }
		
	    // 넘겨 줄 값 설정
	    var formData = {
	    	userId: $("#userId").val(),
	    	password: $("#password").val()
	    };
	    
		$.ajax({
			type: "POST",
			url: "/member/login",
			dataType: "json",
			data: formData,
			success: function(res) {
				
				// 로그인 성공시 userId 및 password로 저장
				sessionStorage.setItem("userId", formData.userId);
				sessionStorage.setItem("password", formData.password);
					
				// login form submit
				$("loginForm").submit();
					
				location.href="/main";
				
			},
			error: function() {
				// 로그인 실패, 아이디 or 비밀번호 오류
				alert("아이디 혹은 비밀번호가 잘못되었습니다.");
			}
			
		});
	});
});

</script>

<style type="text/css">
	
table {
	text-align: center;
	margin: auto;
}

.modal {
        text-align: center;
		background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        
        color: white;
}

.modal-backdrop {
	background-color: black;
}

@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}

.modal-title {
	color: gold;
}

.modal-body {
	text-align: center;
	margin: auto;
	vertical-align: middle;
	
	height: 170px;
}

.modal-footer {
	text-align: center;
	margin: auto;
}

.modal-dialog {
    display: inline-block;
	vertical-align: middle;
	width: 30%;
	
	background-color: black;
	border: 5px solid white;
}

.modal-content {
	background-color: black;
}

.loginBtn {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:20px;
	padding: 0 10px 0 10px;
	text-decoration:none;
	height: 28px;
	
	border: none;
	background-color: rgba(0,0,0,0);
}

.loginBtn:hover {
/* 	color:#D4F4FA; */
	color: gold;
	height: 28px;
/* 	메뉴 밑줄 색상 */
	border-bottom:3px solid #ffffff;
}

.headerTitle {
	padding:10px;
	color:#ffffff;
	cursor:pointer;
}

#headerMenu {
 	float:right; 
	text-align:right;
	margin:0px 5px 3px 5px;
	padding:0 100px 3px 10px;
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

#headerMenu ul li{
	float:left;
	list-style-type:none;
}

#headerMenu a {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:20px;
	padding:0 10px 0 10px;
	text-decoration:none;
}

#headerMenu a:hover {
/* 	color:#D4F4FA; */
	color: gold;
/* 	메뉴 밑줄 색상 */
	border-bottom:3px solid #ffffff;
}

#headerMenu ul ul {
	display:none;
	position:absolute;
	background-color:#000000;
}

#headerMenu ul li:hover ul {
	display: block;
}

#headerMenu ul ul li {
	float:none;
}
</style>
<!-- 헤더 타이틀 -->
<div >
	<h1 class="headerTitle" onclick="location.href='/main' ">Insert Image</h1>
</div>

<!-- 헤더 메뉴 -->
<div id="headerMenu">
	<ul>
	<li><a href="/bar/barlist">Bar</a></li>
	
	<li><a>Band</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<li><a>Ad</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<li><a>Notice</a>
		<ul>
			<li><a href="#">Sub Menu 1</a></li>
			<li><a href="#">Sub Menu 2</a></li>
			<li><a href="#">Sub Menu 3</a></li>
		</ul>
	</li>
	
	<c:if test="${not login }">
	<li><button class="loginBtn" data-target="#layerpop" data-toggle="modal">Login</button>
	</li>
	</c:if>
	
	<c:if test="${login }">
	<li><a>${loginInfo.userName }</a>님
		<ul>
			<li><a href="/mypage/info">계정관리</a></li>
			<li><a href="/member/logout">로그아웃</a></li>
			<li><a href="#">계정탈퇴</a></li>
		</ul>
	</li>
	</c:if>
	
	</ul>
</div><br>

<!-- 로그인 모달 -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color: white">&times;</button>
        <h3 class="modal-title text-center">Login</h3>
      </div>
      <div class="modal-body text-center">
            <form id="loginForm" action="/member/login" method="post" name="loginPost">
		        <br>
		        <table style="border: none;">
				<tr>
				<td>ID:&nbsp;</td>
				<td><input type="text" style="color: black" id="userId" name="userId" /></td></tr>
				<tr>
				<td>PW:&nbsp;</td>
				<td><input type="password" style="color: black" id="password" name="password" /></td></tr>
				</table>
				<br>
			</form>
			<button type="button" id="btnLogin" style="color:#337ab7">Login</button>
 			<a href="/main"><button type="button" id="btnCancel" data-dismiss="modal">Cancel</button></a>
      		<br>
      </div>
      <div class="modal-footer text-center">
      	<a href="/member/join">회원가입</a>&nbsp;&nbsp;&nbsp;
      	<a href="/member/findIdPw">아이디/비밀번호 찾기</a>
      </div>
    </div>
  </div>
</div>

<hr>